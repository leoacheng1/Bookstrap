
const contextRoot = "http://localhost:8080/Bookstrap/";
$(document).ready(function () {
    setMailContent(location.href.slice(location.href.lastIndexOf("/") + 1));
    addEvents();
});
/**
 * a recursive function that fetch multiple attachment and set URIs for download.(confidence boost ><)
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
            setAttachment(attachmentIds, attachmentDataArray);
        }).catch(err => console.log(err))
    }
}
/**
 * to fill in mail info 
 * @param {Number} mailId - mail id of the given mail 
 * @returns 
 */
function setMailContent(mailId) {
    axios({
        url: contextRoot + 'mail/' + mailId,
        method: 'GET'
    }).then(response => {
        let data = response.data;
        console.log(response);
        $('.mailbox-read-info h5').html(data.mailSubject).siblings('h6').html(`寄件人: ${data.mailFrom}` + `<span class="mailbox-read-time float-right">${data.mailTime}</span>`);
        $('.mailbox-read-message').html(data.mailContent);
        setAttachment(response.data.attachmentIds);
        if ($('.premail').length) $('.premail').CardWidget('collapse');
    }).catch(err => console.log(err))
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
    let li = $('<li/>', { append: [attachmentIcon, attachmentInfo] });
    $('.mailbox-attachments:not(.premail-attachment)').append(li);
    console.log("isImg: " + isImg);
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
 * a call back function permanently delete mail, bind to #permanentdeleteMailBtn
 * @returns 
 */
function permanentDelete() {
    Swal.fire({
        title: '永久刪除',
        text: "刪除後無法復原，確認刪除此郵件?",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#d33',
        confirmButtonText: '刪除',
        cancelButtonText: '取消',
        width: 400,
        preConfirm: () => {
            let accountId = $("body").attr("data-ref");
            let mailIds = [window.location.href.split("/").pop()];
            let formData = new FormData();
            formData.append("mailIds", mailIds);
            formData.append("accountId", accountId);
            axios.delete(contextRoot + "mail/multiple", { data: formData }).then(
                response => window.history.back()
            ).catch(error => {
                Swal.showValidationMessage(
                    `刪除失敗: ${error}`
                )
            })
        }
    }).then((result) => {

    }
    )
}
/**
 * a call back function move mail to bin, bind to #deleteMailBtn
 * @returns 
 */
function deleteEvent() {
    let accountId = $("body").attr("data-ref");
    let mailIds = [window.location.href.split("/").pop()];
    let formData = new FormData();
    formData.append("mailIds", mailIds);
    formData.append("accountId", accountId);
    axios.put(contextRoot + "mail/folder/4", formData)
        .then(response => window.history.back())
        .catch(error => Swal.showValidationMessage(
            `刪除失敗: ${error}`
        ));
}

function addEvents() {
    $("#printMailBtn").click(() => { window.print() });
    if ($("#permanentdeleteMailBtn").length) {
        $("#permanentdeleteMailBtn").click(permanentDelete);
    }else if($("#deleteMailBtn").length) {
        $("#deleteMailBtn").click(deleteEvent);
    }
}