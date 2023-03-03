
var contextRoot = "http://localhost:8080/Bookstrap/";
window.onpageshow = function (event) {
    if (event.persisted) {
        console.log("executed")
        initMails();
        updateSideBar();
    }
};
(function () {
    // addEvents();
    initMails();
})()





/**
 * prepare an interactive mail table after submitting a request to get all mail data, and place them in the table.
 */
function initMails(pageNum = 1) {
    let url = window.location.href.split("/");
    let tname = url.pop();
    let type = url.pop();
    console.log(tname);
    console.log(type);
    $(`#${type}-ul a[data-typename=${tname}]`).toggleClass("font-weight-bold").toggleClass("bg-info")
    axios({
        url: contextRoot + `mail/${type}/${tname}/${pageNum}`,
        method: "get"
    }).then(
        res => {
            $("#mailboxbody").html("");
            if (res.data.length == 0) {
                console.log("empty!");
                let tr = document.createElement("tr");
                tr.setAttribute("style", "text-align:center; color: gray")
                let td = document.createElement("td");
                td.innerHTML = "目前尚無郵件";
                tr.appendChild(td);
                $("#mailboxbody").append(tr);
            }else {
                for (rawData of res.data) {
                    let data = makeMailData(rawData);
                    // console.log(makeMailRow(data.mailId));
                    let processedRowData = fillMailRow(makeMailRow(data.mailId), data);
                    if (processedRowData.AttachmentIds == null) {
                        $("#mailboxbody").append(processedRowData.processedTableRow);
                    } else {
                        $("#mailboxbody").append(processedRowData.processedTableRow);
                        //call api to append a row of attachment
                    }
                }
            }
            addEvents();
        }
    ).catch(
        err => {
            console.log(err)
        }
    )
}


//==================================================================Row Creating Functions=====================================================
/**
 * @typedef {Object} ProcessedRowData
 * @property {Array} AttachmentIds - an array containing the attachment ids of the specified mail, null if mail
 * doesn't have any attachment.
 * @property {Element} processedTableRow - The processed table row filled with data. 
*/

function insertMailRow(dataArr) {
    document.getElementById("mailboxbody").append(tableRow);
}

/**
 * return an object that contains mail data necessary for showing the page,
 * called by fillMailRow
 * @param {Object} data - single data from reponse json dataArray
 * @return {Object} - mail data to fill in 
 */
function makeMailData(data) {
    let timeDiff = (new Date().getTime() - Date.parse(data.mailTime)) / 1000;
    let mailData = {
        'from': data.from,
        'fromLink': data.fromLink,
        'subject': data.subject,
        'timeago': timeDiff > 60 * 60 * 24 * 3 ? data.mailTime.slice(0, -3) : toTimeAgo(timeDiff),
        'mailLink': data.mailLink,
        'starred': data.starred,
        'hasread': data.hasread,
        'important': data.important,
        'mailId': data.mailId,
        'mailContent': data.mailContent,
        'attachmentIds': data.attachmentIds
    }
    return mailData
}

/**
 * fill mail row with data object
 * @param {Element} tableRow - the table row used to contain mail data 
 * @param {object} mailData - data contains info to fill in tableRow
 * @return {ProcessedRowData} - object containing attachment id array(if exists) and a tablerow filled with data
 */
function fillMailRow(tableRow, mailData) {
    console.log(mailData.important);
    if (mailData.starred == 1) $(tableRow.querySelector('.mailbox-star a i')).toggleClass('text-warning').toggleClass('text-secondary').toggleClass('starred');
    if (mailData.important == 1) $(tableRow.querySelector('.mailbox-important a i')).toggleClass('text-warning').toggleClass('text-secondary').toggleClass('important');
    $(tableRow.querySelector(".mailbox-name a")).html(mailData.from).attr("href", mailData.fromLink);
    $(tableRow.querySelector(".mailbox-subject a")).html(mailData.subject).attr("href", mailData.mailLink);
    $(tableRow.querySelector(".mailbox-subject")).click(() => window.location = mailData.mailLink);
    $(tableRow.querySelector(".mailbox-date")).html(mailData.timeago);
    if (mailData.mailContent != null) {
        $(tableRow.querySelector(".mailbox-subject")).append(mailData.mailContent.length == 0 ? "&nbsp;&nbsp;(無內文)" : " - "
            + (mailData.mailContent.length > 50 ? mailData.mailContent.substr(0, 50) : mailData.mailContent));
        // $(tableRow.querySelector(".mailbox-shortcontent")).html(mailData.mailContent.length == 0 ? " (無內文)": " - " + mailData.mailContent);       
    }
    if (mailData.hasread == 0) {
        $(tableRow.querySelector(".mailbox-subject")).toggleClass("font-weight-bold");
        $(tableRow.querySelector(".mailbox-shortcontent")).toggleClass("font-weight-bold");
        $(tableRow.querySelector(".mailbox-name a")).toggleClass("font-weight-bold");
    }
    return {
        AttachmentIds: mailData.attachmentIds,
        processedTableRow: tableRow
    };
}

/**
 * make the email row to contain necessary info
 * @param {Number} mailId - Mail id for the specified mail
 * @returns {Element} - a tr element used to contain mail info
 */
function makeMailRow(mailId) {
    let tr = document.createElement('tr');
    tr.setAttribute("data-mailId", mailId);
    tr.setAttribute("draggable", "true");
    // create td elements and their child elements
    let td1 = document.createElement('td');
    let div1 = document.createElement('div');
    div1.className = 'icheck-primary';
    let input1 = document.createElement('input');
    input1.type = 'checkbox';
    input1.value = '';
    input1.id = 'check' + mailId;
    let label1 = document.createElement('label');
    label1.htmlFor = 'check1';
    div1.appendChild(input1);
    div1.appendChild(label1);
    td1.appendChild(div1);

    let td2 = document.createElement('td');
    td2.className = 'mailbox-star';
    let a1 = document.createElement('a');
    a1.href = '#';
    let i1 = document.createElement('i');
    i1.className = 'fas fa-star text-secondary';
    a1.appendChild(i1);
    td2.appendChild(a1);

    let td3 = document.createElement('td');
    td3.className = 'mailbox-important';
    let a2 = document.createElement('a');
    a2.href = '#';
    let i2 = document.createElement('i');
    i2.className = 'fa fa-flag text-secondary';
    a2.appendChild(i2);
    td3.appendChild(a2);

    let td4 = document.createElement('td');
    td4.className = 'mailbox-name';
    let a3 = document.createElement('a');
    a3.href = 'read-mail.html';
    a3.innerHTML = '寄件人';
    td4.appendChild(a3);

    let td5 = document.createElement('td');
    td5.className = 'mailbox-subject ellipsis';
    let a4 = document.createElement('a');
    a4.href = '${contextRoot}';
    a4.innerHTML = '主旨';
    // let sp = document.createElement('span');
    // sp.className = 'mailbox-shortcontent';
    td5.appendChild(a4);
    // td5.appendChild(sp);

    // var td6 = document.createElement('td');
    // td6.className = 'mailbox-attachment';
    // var i3 = document.createElement('i');
    // i3.className = 'fas fa-paperclip';
    // td6.appendChild(i3);
    let td7 = document.createElement('td');
    td7.className = 'mailbox-date';
    td7.innerHTML = 'xxx 時間之前';

    // append td elements to the tr element
    tr.appendChild(td1);
    tr.appendChild(td2);
    tr.appendChild(td3);
    tr.appendChild(td4);
    tr.appendChild(td5);
    // tr.appendChild(td6);
    tr.appendChild(td7);
    return tr;
}


//==================================================================Utility Functions=====================================================
/**
 * 
 * @param {Number} seconds - second to transform to time ago 
 * @returns {String} - the string that represents time ago in mail
 */
function toTimeAgo(seconds) {
    let minutes = Math.floor(seconds / 60);
    let hours = Math.floor(minutes / 60);
    let days = Math.floor(hours / 24);
    if (seconds <= 10) {
        return "剛剛";
    }
    if (days > 0) {
        return days + " 天以前";
    } else if (hours > 0) {
        return hours + " 小時以前";
    } else if (minutes > 0) {
        return minutes + " 分鐘以前";
    } else {
        return Math.floor(seconds) + " 秒前";
    }
}
/**
 * addthefollowing events:
 * 1. checkbox toggle all
 * 2. star click turn yellow and update starred in database &sidebar
 * 3. important click turn yellow and update important in database & sidebar
 * 4. text not bold anymore and update hasread to 1 in database
 * 5. refresh btn 
 */
function addEvents() {
    //Enable check and uncheck all functionality
    $('.checkbox-toggle').click(function () {
        var clicks = $(this).data('clicks')
        if (clicks) {
            //Uncheck all checkboxes
            $('.mailbox-messages input[type=\'checkbox\']').prop('checked', false)
            $('.checkbox-toggle .far.fa-check-square').removeClass('fa-check-square').addClass('fa-square')
        } else {
            //Check all checkboxes
            $('.mailbox-messages input[type=\'checkbox\']').prop('checked', true)
            $('.checkbox-toggle .far.fa-square').removeClass('fa-square').addClass('fa-check-square')
        }
        $(this).data('clicks', !clicks)
    })

    //Handle starring for font awesome
    $('.mailbox-star').click(function (e) {
        e.preventDefault()
        //detect type
        let $this = $(this).find('a > i')
        let fa = $this.hasClass('fas')
        let this_ = $(this);
        let starred = $this.hasClass("starred") ? 0 : 1;
        //Switch states
        if (fa) $this.toggleClass('text-secondary').toggleClass('text-warning').toggleClass('starred');
        if (starred != null) {
            let formData = new FormData();
            formData.append("accountId", Number($("body").attr("data-ref")));
            formData.append("starred", starred);
            axios.put(contextRoot + "mail/starred/" + this_.parent("tr").attr("data-mailid"), formData)
                .then(response => console.log(response))
                .catch(error => console.log(error));
                let len = $("#starred-count").html().length;
                if (len == 0) {
                    $("#starred-count").html("1");
                }else {
                    let num = Number($("#starred-count").html());
                    num += (starred == 1 ? 1 : -1);
                    $("#starred-count").html(num == 0 ? "" : num);
                }
        }
    })
    //handle important
    $('.mailbox-important').click(function (e) {
        e.preventDefault()
        //detect type
        let $this = $(this).find('a > i');
        let fa = $this.hasClass('fa');
        let this_ = $(this);
        let important = $this.hasClass("important") ? 0 : 1;
        //Switch states
        if (fa) $this.toggleClass('text-secondary').toggleClass('text-warning').toggleClass('important');
        if (important != null) {
            let formData = new FormData();
            formData.append("accountId", Number($("body").attr("data-ref")));
            formData.append("important", important);
            axios.put(contextRoot + "mail/important/" + this_.parent("tr").attr("data-mailid"), formData)
                .then(response => console.log(response))
                .catch(error => console.log(error));
            let len = $("#important-count").html().length;
            if (len == 0) {
                $("#important-count").html("1");
            }else {
                let num = Number($("#important-count").html());
                num += (important == 1 ? 1 : -1);
                $("#important-count").html(num == 0 ? "" : num);
            }
        }
    })
    //handle hasread
    $('.mailbox-subject').click(function () {
        let accountId = $("body").attr("data-ref");
        let mailId = $(this).parent('tr').attr("data-mailid");
        let formData = new FormData();
        formData.append("accountId", accountId);
        formData.append("hasread", 1);
        axios.put(contextRoot + "mail/hasread/" + mailId, formData).
            then(response => response).
            catch(error => console.log(error));
    })
    //handle deletion
    if (window.location.href.split("/").pop() == "bin") {
        $("#delete-mail").css("color", "red");
        $("#delete-mail").click(permanentDelete);
    } else {
        $("#delete-mail").click(deleteEvent);
    }

    //refresh
    $("#refreshBtn").click(function(){
        initMails();
        updateSideBar();
    })

}

/**
 * find table rows which check box is checked
 * @returns {Element} - table rows that is selected
 */
function findChecked() {
    let trs = [];
    for (input of $(".icheck-primary input")) {
        if (input.checked) {
            trs.push($(input).parents("tr")[0]);
        }
    }
    return trs;
}

/**
 *  a call back function for delete button eventlistner which move
 *  all selected rows to bin
 * @returns 
 */
function deleteEvent() {
    let trs = findChecked();
    if (trs.length == 0) return;
    let accountId = $("body").attr("data-ref");
    let mailIds = [];
    for (tr of trs) {
        let mailId = $(tr).attr("data-mailid");
        if (mailId != null) mailIds.push(mailId);
    }
    let formData = new FormData();
    formData.append("mailIds", mailIds);
    formData.append("accountId", accountId);
    axios.put(contextRoot + "mail/folder/4", formData)
        .then(response => {
            Swal.fire({
                position: 'bottom-start',
                toast: true,
                icon: 'success',
                title: '已將' + response.data + '筆郵件移入回收桶',
                showConfirmButton: false,
                timer: 1500
            })
            initMails(1);
            updateSideBar();
        })
        .catch(error => console.log(error));
}


function permanentDelete(numDeleted) {
    let trs = findChecked();
    if (trs.length == 0) return;
    let accountId = $("body").attr("data-ref");
    let mailIds = [];
    for (tr of trs) {
        let mailId = $(tr).attr("data-mailid");
        if (mailId != null) mailIds.push(mailId);
    }
    let formData = new FormData();
    formData.append("mailIds", mailIds);
    formData.append("accountId", accountId);
    Swal.fire({
        title: '永久刪除',
        text: "刪除後無法復原，確認刪除此" + mailIds.length + "筆郵件?",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#d33',
        confirmButtonText: '刪除',
        cancelButtonText: '取消',
        width: 400,
        preConfirm: () => {
            let trs = findChecked();
            let accountId = $("body").attr("data-ref");
            let mailIds = [];
            for (tr of trs) {
                let mailId = $(tr).attr("data-mailid");
                if (mailId != null) mailIds.push(mailId);
            }
            let formData = new FormData();
            formData.append("mailIds", mailIds);
            formData.append("accountId", accountId);
            axios.delete(contextRoot + "mail/multiple", {data:formData}).then(
                response => response
            ).catch(error => {
                Swal.showValidationMessage(
                    `刪除失敗: ${error}`
                )
            })
        }
    }).then((result) => {
        let delay = ms => new Promise(res => setTimeout(res, ms));
        if (result.isConfirmed) {
            console.log(result);
            Swal.fire({
                position: 'bottom-start',
                toast: true,
                icon: 'success',
                title: '郵件移除成功',
                showConfirmButton: false,
                timer: 1500
            });
            (async function() {
                await delay(2000);
                initMails(1);
                updateSideBar();
            })();
        }
    })
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


//testing area
$('.js-example-basic-multiple').select2({
    placeholder: '請選擇要放入的類別',
    dropdownAutoWidth: true,
    width: "120px",

});
$('[data-toggle="tooltip"]').tooltip()