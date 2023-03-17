const contextRoot = "http://localhost:8080/Bookstrap/";
$(document).ready(function () {
  initSummerNote();
  addEvents();
  initSelect2();
  initializeAttachment();
});

/**
 *  add eventlisteners on elements
 */
function addEvents() {
  document.getElementById("sendMail").addEventListener("click", sendEmail);
  document.getElementById("draftBtn").addEventListener("click", draftEmail);
  document.getElementById("dropMailBtn").addEventListener("click", dropEmail);
  $("#attachments").change(inputEffect);
  $("#attachments").focus(inputEffect);
  window.onbeforeunload = draftOnLeave; //draft unsaved mail on leave
  chooseCategory();
}


/**
 * initialize summernote
 */
function initSummerNote() {
  $('#compose-textarea').summernote({
    height: "500px", toolbar: [
      ['style', ['style']],
      ['font', ['bold', 'underline', 'clear']],
      ['fontname', ['fontname', 'fontsize']],
      ['color', ['color']],
      ['para', ['ul', 'ol', 'paragraph']],
      ['table', ['table']],
      ['insert', ['link', 'picture', 'video', 'hr']],
      ['view', ['fullscreen', 'codeview', 'help']],
    ]
  });
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
  let extension = file.name.split(".").slice(-1)[0];
  console.log(extension);
  if (file.type.startsWith("image") || ['jpg', 'jpeg', 'png', 'gif', 'bmp', 'svg', 'tif', 'tiff', 'ico'].includes(extension)) {
    return "image";
  } else if (['doc', 'docx'].includes(extension)) {
    return "word";
  } else if (['zip', 'rar', 'tar', 'gz', '7z'].includes(extension)) {
    return "archive";
  } else if (['xls', 'xlsx'].includes(extension)) {
    return "excel";
  } else if (["txt"].includes(extension)) {
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
  console.log("gen");
  $("#fileplace").empty();
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
  // let mailTo = $('[name="mailTo"]').val();
  let mailTo = $('#mailToSelect').select2('data')[0].id;
  let subject = $('[name="mailSubject"]').val();
  let content = $('.note-editable.card-block').html();
  let category;
  switch ($("#categoryMenuButton").html()) {
    case '一般信件':
      category = "normal";
      break;
    case '工作指派':
      category = "job";
      break;
    case '公司訊息':
      category = "company";
      break;
  }
  let files = document.getElementById('attachments').files;

  let formData = new FormData();
  formData.append("mailTo", mailTo);
  formData.append("mailSubject", subject);
  formData.append("mailContent", content);
  formData.append("mailCategory", category);
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
  // let mailTo = $('[name="mailTo"]').val();
  let mailTo = $('#mailToSelect').select2('data')[0].id;
  let subject = $('[name="mailSubject"]').val();
  let content = $('.note-editable.card-block').html();
  let category;
  switch ($("#categoryMenuButton").html()) {
    case '一般信件':
      category = "normal";
      break;
    case '工作指派':
      category = "job";
      break;
    case '公司訊息':
      category = "company";
      break;
  }
  let files = document.getElementById('attachments').files;

  let formData = new FormData();
  formData.append("mailTo", mailTo);
  formData.append("mailSubject", subject);
  formData.append("mailContent", content);
  formData.append("mailCategory", category);
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
  $('.card.card-primary.card-outline .card-body').attr("data-ready", "0");
  location.href = contextRoot + "backend/mailpage/mailbox/folder/inbox";
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
  if ($('.card.card-primary.card-outline .card-body').attr("data-ready") == "0") return;
  // let mailTo = $('[name="mailTo"]').val();
  let mailTo = $('#mailToSelect').select2('data')[0].id;
  let subject = $('[name="mailSubject"]').val();
  let content = $('.note-editable.card-block').html();
  let category;
  switch ($("#categoryMenuButton").html()) {
    case '一般信件':
      category = "normal";
      break;
    case '工作指派':
      category = "job";
      break;
    case '公司訊息':
      category = "company";
      break;
  }
  let files = document.getElementById('attachments').files;
  if (subject.length == 0 && $('.note-editable.card-block').text().replace("\n","").trim().length == 0 && files.length == 0) return;
  let formData = new FormData();
  formData.append("mailTo", mailTo);
  formData.append("mailSubject", subject);
  formData.append("mailContent", content);
  formData.append("mailCategory", category);
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

/**
 * choose category event
 */
function chooseCategory() {
  $("#categoryDropdown a").click(function (event) {
    event.preventDefault();
    $("#categoryMenuButton").html(this.innerHTML);
  })
}


//not finished
function checkSend() {
  let mailTo = $('[name="mailTo"]').val();
  let subject = $('[name="mailSubject"]').val();
  let content = $('.note-editable.card-block').html();
}

//==========================================select 2 related function ========================================================
function initSelect2() {
  let optLanguage = {
    "noResults": () => "查無結果",
    "removeItem": () => "移除"
  }
  let options = {
    language: optLanguage,
    templateResult: function (markup) {
      let arr = markup.text.split(','),
        name = arr[0],
        account = arr[1],
        template = $(`<span>${name}</span><span style="visibility:hidden">${account}</span>`);
      return template;
    },
    templateSelection: function (markup) {
      let arr = markup.text.split(','),
        name = arr[0],
        account = arr[1],
        template = $(`<span>${name}</span><span style="visibility:hidden">${account}</span>`);
      return template;
    }
  }
  $('#mailToSelect').select2(options);
}

/**
 * a recursive function that fetch multiple attachment and set URIs for download.
 * @param {Array<Number>} attachmentIds -id of the attachment
 * @returns 
 */
function setAttachment(attachmentIds, attachmentDataArray = []) {
  if (attachmentIds.length != 0) {
    axios({
      url: contextRoot + 'mail/attachment/' + attachmentIds[0],
      method: 'GET',
      responseType: 'blob'
    }).then(response => {
      console.log(response);
      let disposition = response.headers['content-disposition'];
      let file = new File([response.data], decodeURIComponent(disposition.split("'").pop()));
      attachmentDataArray.push(file);
      attachmentIds.shift();
      if (attachmentIds.length == 0) {
        let temp = new DataTransfer();
        for (data of attachmentDataArray) {
          temp.items.add(data);
        }
        document.getElementById("attachments").files = temp.files;
        $("#attachments").trigger("change");
      };
      setAttachment(attachmentIds, attachmentDataArray);
    }).catch(err => console.log(err))
  }
}



/**
 * a recursive function that fetch multiple attachment and set URIs for download.(confidence boost ><)
 * @param {Array<Number>} attachmentIds -id of the attachment
 * @returns 
 */
function setAttachment2(attachmentIds, attachmentDataArray = []) {
  if (attachmentIds.length != 0) {
      axios({
          url: contextRoot + 'mail/attachment/' + attachmentIds[0],
          method: 'GET',
          responseType: 'blob'
      }).then(response => {
          console.log(response);
          let disposition = response.headers['content-disposition'];
          let uri = window.URL.createObjectURL(new Blob([response.data]));
          let fileSize = response.data.size.toString();

          attachmentDataArray.push({
              'id': attachmentIds[0],
              'uri': uri,
              'name': decodeURIComponent(disposition.split("'").pop()),
              'extension': decodeURIComponent(disposition.split(".").pop()),
              'size': fileSize.length < 7 ? `${Math.round(+fileSize / 1024)}kb` : `${(Math.round(+fileSize / 1024) / 1000).toFixed(1)}MB`
          });
          attachmentIds.shift();
          if (attachmentIds.length == 0) {
              for (data of attachmentDataArray) {
                  makeAttachment(data);
              }
          };
          setAttachment2(attachmentIds, attachmentDataArray);
      }).catch(err => console.log(err))
  }
}

/**
 * generate attachment block based on attachment data
 * @param {Object} attachmentData - attachmentData used to generate attachment blocks
 * {
                'id': ,
                'uri': ,
                'name': ,
                'extension': ,
                'size': 
            }
 */
function makeAttachment(attachmentData) {
  let extension = attachmentData.extension;
  console.log(extension)
  let typeIcon;
  if (['zip', 'rar', 'tar', 'gz', '7z'].includes(extension)) {
    typeIcon = "far fa-file-archive";
  } else if (["pdf"].includes(extension)) {
    typeIcon = "far fa-file-pdf";
  } else if (['doc', 'docx'].includes(extension)) {
    typeIcon = "far fa-file-word";
  } else if (['xls', 'xlsx'].includes(extension)) {
    typeIcon = "far fa-file-excel";
  } else if (["txt"].includes(extension)) {
    typeIcon = "fas fa-book";
  } else {
    typeIcon = "fas fa-file";
  }
  let isImg = ['jpg', 'jpeg', 'png', 'gif', 'bmp', 'svg', 'tif', 'tiff', 'ico'].includes(attachmentData.extension);
  let filesize = $('<span/>', { class: 'filesize', append: attachmentData.size });
  let downloadLink = $('<a/>', {
    download: attachmentData.name,
    href: attachmentData.uri,
    class: "btn btn-default btn-sm float-right",
    append: $("<i/>", { class: "fas fa-cloud-download-alt" }),
  });
  let attachmentSize = $('<span/>', { class: "mailbox-attachment-size clearfix mt-1", append: [filesize, downloadLink] });
  let attachmentName = $('<a/>', {
    href: attachmentData.uri,
    class: "mailbox-attachment-name",
    append: [$('<i/>', { class: (isImg ? "fas fa-camera" : "fas fa-paperclip") }), " " + attachmentData.name],
    download: attachmentData.name
  })
  let attachmentIcon = $("<span/>", {
    class: isImg ? "mailbox-attachment-icon has-img" : "mailbox-attachment-icon",
    style: "min-height: 114px;",
    append: isImg ? $("<img/>", { src: attachmentData.uri, style: "height:114px;" }) : $("<i/>", { class: typeIcon })
  });
  let attachmentInfo = $("<div/>", { class: "mailbox-attachment-info", append: [attachmentName, attachmentSize] });
  let li = $('<li/>', { append: [attachmentIcon, attachmentInfo], id: "a" + attachmentData.id });
  $('.premail-attachment').append(li);
}

/**
 * initialize attachments for different usage
 */
function initializeAttachment() {
  let dmailId = $("body").attr("data-draftmail"),
    rmailId = $("body").attr("data-replymail"),
    fmailId = $("body").attr("data-forwardmail"),
    type,
    mailId;
  if (dmailId.length != 0) {
    mailId = dmailId;
    type = "draft";
  } else if (rmailId.length != 0) {
    mailId = rmailId;
    type = "reply";
  } else if (fmailId.length != 0) {
    mailId = fmailId;
    type = "forward"
  }
  console.log("mailId: " + mailId);
  axios({
    url: contextRoot + 'mail/' + mailId,
    method: 'GET'
  }).then(response => {
    if (type == "draft") setAttachment(response.data.attachmentIds);
    if (type == "reply") setAttachment2(response.data.attachmentIds);
    if ($('.premail').length) $('.premail').CardWidget('collapse');
    $('.note-editable').find('.premail').attr('contenteditable',false);
    let time = $('.mailbox-read-time.ml-1.align-middle').html();
    $('.mailbox-read-time.ml-1.align-middle').html(time.split(".")[0]);
  }).catch(err => console.log(err))
}