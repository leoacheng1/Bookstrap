$(document).ready(function () {
  initSummerNote();
  addEvents();

});

/**
 *  add eventlisteners on elements
 */
function addEvents() {
  document.getElementById("sendMail").addEventListener("click", sendEmail);
  $("#attachments").change(inputEffect);
}


/**
 * initialize summernote
 */
function initSummerNote(){
  $('#compose-textarea').summernote({ height: "500px" });
  //resolve tool tip misposition issue
  $('#compose-textarea').summernote('fullscreen.toggle');
  $('#compose-textarea').summernote('fullscreen.toggle');
  // $("[data-widget = 'pushmenu']").click();
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
  if (fileSize.length < 7) {
    fileSize = `${Math.round(+fileSize / 1024)}kb`
  } else {
    fileSize = `${(Math.round(+fileSize / 1024) / 1000).toFixed(1)}MB`
  }
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
 * everything for generating input block.
 * @returns 
 */
function inputEffect() {
  $("#fileplace").empty()
  let files = this.files;
  let maxLength = Math.max.apply(Math, $.map(files, function (el) { return el.name.length }));
  let totalSize = 0;
  for (file of files) {
    totalSize += file.size;
    if (totalSize > 32 * 1024 * 1024) {
      $("#attachments").val("");
      $("#triggersizelimit").click();
      $("#fileplace").empty();
      return;
    }
    let info = getFileInfo(file);  
    //get url for file(used to show image and download)
    let objectURL;
    if (objectURL) {URL.revokeObjectURL(objectURL)};
    objectURL = URL.createObjectURL(file);

    //generate block that holds input file preview
    let box = $(`#${info.rawType}_template`).clone(true).removeAttr('id');
    box.find(".mailbox-attachment-name").html(box.find(".mailbox-attachment-name").html()+ info.fileName);
    box.find(".filesize").html(info.fileSize);

    //add preview for image, or url for files
    if (info.rawType == "image") {
      box.find('img').attr("src",objectURL);
    } else {
      // box.find(".mailbox-attachment-name").attr("download",objectURL);
    }
    $("#fileplace").append(box);
  }
}

/**
 * sendEmail to our server
 * @param {Event} event - input as callback function for addEventListener
 */
function sendEmail(event){
  event.preventDefault();
  let mailTo = $('[name="mailTo"]').val();
  let subject = $('[name="mailSubject"]').val();
  let content = $('.note-editable.card-block').html();
  let files = document.getElementById('attachments').files;

  let formData = new FormData();
  formData.append("mailTo", mailTo);
  formData.append("mailSubject", subject);
  formData.append("mailContent", content);
  formData.append("starred", 0);
  formData.append("important", 0);
  formData.append("hasread", 0);
  for(f of files){
    formData.append("file",f);
  }
  axios({
    url : "http://localhost:8080/Bookstrap/mail/api/post",
    method: "post",
    data: formData,
    headers: {
      "Content-Type" : "multipart/form-data"
    }

})
.then(res => {
  console.log(res.data);
  console.log("上傳成功");
  location.reload();
})
.catch(err => console.log(err));
$('#sendModal').modal('hide')
}

