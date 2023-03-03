var contextRoot = "http://localhost:8080/Bookstrap/";
$(document).ready(function () {
  initSummerNote();
  addEvents();

});

/**
 *  add eventlisteners on elements
 */
function addEvents() {
  document.getElementById("sendMail").addEventListener("click", sendEmail);
  document.getElementById("draftBtn").addEventListener("click", draftEmail);
  document.getElementById("dropMailBtn").addEventListener("click", dropEmail);
  $("#attachments").change(inputEffect);
  window.onbeforeunload = draftOnLeave; //draft unsaved mail on leave
}


/**
 * initialize summernote
 */
function initSummerNote() {
  $('#compose-textarea').summernote({ height: "500px",toolbar: [
    ['style', ['style']],
    ['font', ['bold', 'underline', 'clear']],
    ['fontname', ['fontname','fontsize']],
    ['color', ['color']],
    ['para', ['ul', 'ol', 'paragraph']],
    ['table', ['table']],
    ['insert', ['link', 'picture', 'video','hr']],
    ['view', ['fullscreen', 'codeview', 'help']],
  ] });
  //resolve tool tip misposition issue
  $('#compose-textarea').summernote('fullscreen.toggle');
  $('#compose-textarea').summernote('fullscreen.toggle');
  $('[data-widget="pushmenu"]').PushMenu('collapse');
}

/**
 * get file info from a file 
 * @param {File} file - input file object
 * @param {String} fileName - file name in string
 * @param {String} extension - file mime type
 * @param {String} fileSize - byte value file size into mB/kb representation string 
 * @param {String} rawType - raw type of file for storing into database
*/
function getFileInfo(file) {

  let fileName = file.name;
  let extension = file.type;
  let fileSize = file.size.toString();
  fileSize = fileSize.length < 7 ? `${Math.round(+fileSize / 1024)}kb` : `${(Math.round(+fileSize / 1024) / 1000).toFixed(1)}MB`;
  return {
    'fileName': fileName,
    'extension': extension,
    'fileSize': fileSize,
    'rawType': getRawFileType(file)
  }
}
/**
 * map file mime type into raw type string to store in database
 * @param {File} file 
 */
function getRawFileType(file) {
  if (file.type.startsWith("image")) {
    return "image";
  } else if (file.type.includes("wordprocessingml")) {
    return "word";
  } else if (file.name.endsWith("rar") || file.name.endsWith("zip")) {
    return "archive";
  } else if (file.name.endsWith(".xlsx")) {
    return "excel";
  } else if (file.type == "text/plain") {
    return "text";
  } else if (file.name.endsWith("pdf")) {
    return "pdf";
  } else {
    return "other"
  }
}
/**
 * call back function for delete button to delete certain attachment
 */
function deleteAttachmentBtn() {
  const filenum = $(this).parents('li').attr('data-filenum');
  $(this).parents('li').remove();
  let files = document.getElementById('attachments').files;
  let temp = new DataTransfer();
  for (let i = 0; i < files.length; i++) {
    if (i != filenum) {
      temp.items.add(files[i]);
    }
  }
  $.each($("#fileplace").children('li'), function () {
    let num = $(this).attr('data-filenum');
    if (num > filenum) {
      $(this).attr('data-filenum', Number(num) - 1);
    }
  });
  document.getElementById('attachments').files = temp.files;
}

/**
 * everything for generating input block.
 * @returns 
 */
function inputEffect() {
  $("#fileplace").empty()
  let files = this.files;
  let maxLength = Math.max.apply(Math, $.map(files, function (el) { return el.name.length }));
  let totalSize = 0;
  for (let i = 0; i < files.length; i++) {
    let file = files[i];
    totalSize += file.size;
    if (totalSize > 32 * 1024 * 1024) {
      $("#attachments").val("");
      $("#triggersizelimit").click();
      document.getElementById("fileplace").innerHTML = "";
      document.getElementById('attachments').files = null;
      return;
    }
    let info = getFileInfo(file);
    //get url for file(used to show image and download)
    let objectURL;
    if (objectURL) { URL.revokeObjectURL(objectURL) };
    objectURL = URL.createObjectURL(file);

    //generate block that holds input file preview
    let box = $(`#${info.rawType}_template`).clone(true).removeAttr('id').attr("data-filenum", i);
    box.find(".mailbox-attachment-name").html(box.find(".mailbox-attachment-name").html() + info.fileName);
    box.find(".filesize").html(info.fileSize);
    box.find(".remove-attachment").click(deleteAttachmentBtn);
    //add preview for image, or url for files
    if (info.rawType == "image") {
      box.find('img').attr("src", objectURL);
    } else {
      // box.find(".mailbox-attachment-name").attr("download",objectURL);
    }
    $("#fileplace").append(box);
  }
}

/**
 * clear the whole edit area
 */
function clearEditArea() {
  $('.note-editable.card-block').empty();
  $('[name="mailTo"]').val("");
  $('[name="mailSubject"]').val("");
  document.getElementById('attachments').value = "";
  document.getElementById('fileplace').innerHTML = "";
}
/**
 * sendEmail to our server
 * @param {Event} event - input as callback function for addEventListener
 */
function sendEmail(event) {
  let mailTo = $('[name="mailTo"]').val();
  let subject = $('[name="mailSubject"]').val();
  let content = $('.note-editable.card-block').html();
  let files = document.getElementById('attachments').files;

  let formData = new FormData();
  formData.append("mailTo", mailTo);
  formData.append("mailSubject", subject);
  formData.append("mailContent", content);
  for (f of files) {
    formData.append("file", f);
  }
  axios({
    url: contextRoot + "mail",
    method: "post",
    data: formData,
    headers: {
      "Content-Type": "multipart/form-data"
    }

  })
    .then(res => {
      console.log(res.data);
      Swal.fire(
        '寄信成功',
        '您的郵件已寄出',
        'success'
      );
      clearEditArea();
      updateSideBar();
    })
    .catch(err => Swal.fire(
      '送出失敗',
      '發生非預期的錯誤',
      'error'
    )).finally(
      () => $('#sendModal').modal('hide')
    );
}
/**
 * helper function for delaying instruction
 * @param {Number} ms - delay in millisecond  
 * @returns 
 */
const delay = ms => new Promise(res => setTimeout(res, ms));

/**
 * sendEmail to our server, put it in draft folder 
 * @param {Event} event - input as callback function for addEventListener
 */
async function draftEmail(event) {
  //save data 
  let mailTo = $('[name="mailTo"]').val();
  let subject = $('[name="mailSubject"]').val();
  let content = $('.note-editable.card-block').html();
  let files = document.getElementById('attachments').files;
  if (mailTo.length == 0 && subject.length == 0 && content.length == 26 && files.length == 0) return;
  let formData = new FormData();
  formData.append("mailTo", mailTo);
  formData.append("mailSubject", subject);
  formData.append("mailContent", content);
  for (f of files) {
    formData.append("file", f);
  }
  let cardBackup = $('.card.card-primary.card-outline .card-body').clone(true, true);
  clearEditArea();
  $('.card.card-primary.card-outline .card-body').attr("data-ready", "1");
  //if not onleave add toast
  if (event.type == "click") {
    draftToast(cardBackup, formData);
    await delay(3000);
  }
  //return if restore button in toast is clicked
  if ($('.card.card-primary.card-outline .card-body').attr("data-ready") == "0") return; 
  axios({
    url: contextRoot + "mail/draft",
    method: "post",
    data: formData,
    headers: {
      "Content-Type": "multipart/form-data"
    }

  })
    .then(res => {
      updateSideBar();
    })
    .catch(err => Swal.fire(
      '加入失敗',
      '發生非預期的錯誤',
      'error'
    ));
}
/**
 * simply redirect to inbox
 */
function dropEmail() {
  $('#dropModal').modal('hide');
  location.href = contextRoot + "backend/mailpage/folder/inbox";
}


/**
 * 
 * @param {Object} cardBackup -a copy for the original content (.card.card-primary.card-outline .card-body)
 * @param {boolean} skip - whether to skip or not
 */
function draftToast(cardBackup, formData, skip) {
  if (skip) return;
  $("body").Toasts('create', {
    title: '已加入草稿',
    body: '已將編輯內容加入草稿。    <a style="color:blue">復原</a>',
    position: 'topRight',
    icon: 'fas fa-pencil-alt',
    class: "eddie-toast draft-toast",
    autohide: true,
    delay: 3000
  })
  $(".draft-toast a").click(function () {
    $('.card.card-primary.card-outline .card-body').replaceWith(cardBackup);
    $('.card.card-primary.card-outline .card-body').attr("data-ready", "0");
    $('.toast.eddie-toast.draft-toast').find("button.close").click();
  })
}


/**
 * a call back function that draft mail which is passed to window onbeforeunload
 * @returns 
 */
function draftOnLeave() {
  let mailTo = $('[name="mailTo"]').val();
  let subject = $('[name="mailSubject"]').val();
  let content = $('.note-editable.card-block').html();
  let files = document.getElementById('attachments').files;
  if (mailTo.length == 0 && subject.length == 0 && content.length == 26 && files.length == 0) return;
  let formData = new FormData();
  formData.append("mailTo", mailTo);
  formData.append("mailSubject", subject);
  formData.append("mailContent", content);
  for (f of files) {
    formData.append("file", f);
  }
  fetch(contextRoot + "mail/draft", {
    method: "POST",
    body: formData,
    keepalive: true
  });
}
/**
 * update sidebar number for page
 */
function updateSideBar() {
  let accountId = $("body").attr("data-ref");
  axios.get(`${contextRoot}mail/countall/${accountId}`)
  .then(response => {
      console.log(response);
      $("#inbox-count").html(response.data.inboxCount == 0 ? "" : response.data.inboxCount);
      $("#sent-count").html(response.data.sentCount == 0 ? "" : response.data.sentCount);
      $("#draft-count").html(response.data.draftCount == 0 ? "" : response.data.draftCount);
      $("#bin-count").html(response.data.binCount == 0 ? "" : response.data.binCount);
      $("#normal-count").html(response.data.normalCount == 0 ? "" : response.data.normalCount);
      $("#job-count").html(response.data.workCount == 0 ? "" : response.data.workCount);
      $("#company-count").html(response.data.companyCount == 0 ? "" : response.data.companyCount);
      $("#starred-count").html(response.data.starredCount == 0 ? "" : response.data.starredCount);
      $("#important-count").html(response.data.importantCount == 0 ? "" : response.data.importantCount);
  })
  .catch(err => console.log(err)); 
}
//not finished
function checkSend() {
  let mailTo = $('[name="mailTo"]').val();
  let subject = $('[name="mailSubject"]').val();
  let content = $('.note-editable.card-block').html();
}