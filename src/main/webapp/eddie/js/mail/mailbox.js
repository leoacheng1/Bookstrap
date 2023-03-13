
const contextRoot = "http://localhost:8080/Bookstrap/";
/**
 * iife executed when the page is first loaded
 */
(function startup() {
    initialize();
    $("#add-label").click(function (event) {
        event.preventDefault();
        addLabelModal();
    })
    for (li of document.getElementsByClassName("label-li")) {
        addLabelEvent(li);
    }
    window.onpageshow = function (event) {
        if (event.persisted) {
            console.log("executed")
            initialize();
        }
    };
})()
/**
 * operations to update scene
 * 1. init mail table
 * 2. update side bar numbers
 * 3. fix tool tip
 */
async function initialize() {
    await addPagination();
    await prepareConditions();
    await initMails();
    await updateSideBar();
    await addTooltip();

}

/**
 * enable proper tool tip functionality and style 
 */
async function addTooltip() { $('[data-toggle="tooltip"]').tooltip() };


/**
 * prepare an interactive mail table after submitting a request to get all mail data, and place them in the table.
 */
async function initMails(conditions, advanceFilters = false) {
    if($("body").attr("data-modalOn") == 1) advanceFilters = true;
    if (advanceFilters) {
        conditions = getFilterConditions();
    }
    let pageNum = $("body").attr("data-pagenum");
    $("#mailboxbody").html("");
    let currUrl = window.location.href.split("/");
    let tname = currUrl.pop();
    let type = currUrl.pop();
    let activeLi = $(`#${type}-ul a[data-typename=${tname}]`);
    if (!activeLi.hasClass("active_")) {
        activeLi.addClass("font-weight-bold").addClass("bg-info").addClass("active_");
    }
        if (advanceFilters) activeLi.removeClass("font-weight-bold").removeClass("bg-info").removeClass("active_");
    
    // new request with conditions
    if (!advanceFilters) {
        // let conditions = getConditions();
        if (conditions == null) {
            conditions = getConditions();
        }
        if (type == "category") conditions["categoryName"] = tname;
        if (type == "folder") conditions["folderName"] = tname;
        if (type == "label") {
            if (tname == "important") {
                conditions["important"] = 1;
            } else if (tname == "starred") {
                conditions["starred"] = 1;
            } else {
                conditions["labelId"] = tname;
            }
        }
        console.log(conditions);
    }
    axios({
        url: contextRoot + `mail/conditions/${pageNum}`,
        method: "post",
        data: conditions
    }).then(
        res => {
            // console.log(res.data);
            $("#mailboxbody").html("");
            if (res.data.length == 0) {
                let tr = document.createElement("tr");
                tr.setAttribute("style", "text-align:center; color: gray")
                let td = document.createElement("td");
                td.innerHTML = "目前尚無郵件";
                tr.appendChild(td);
                $("#mailboxbody").append(tr);
            } else {
                for (rawData of res.data) {
                    // console.log(rawData);
                    let data = makeMailData(rawData);
                    let processedRowData = fillMailRow(makeMailRow(data.mailId), data);
                    if (processedRowData.AttachmentIds == null) {
                        $("#mailboxbody").append(processedRowData.processedTableRow);
                    } else {
                        $("#mailboxbody").append(processedRowData.processedTableRow);
                        //call api to append a row of attachment, a little trivial probably not gonna make it
                    }
                }
            }
            addEvents();
            return;
        }
    ).catch(
        err => {
            console.log(err)
        }
    )

    //original request
    // else {

    // axios({
    //     url: contextRoot + `mail/${type}/${tname}/${pageNum}`,
    //     method: "get"
    // }).then(
    //     res => {
    //         // console.log(res.data);
    //         $("#mailboxbody").html("");
    //         if (res.data.length == 0) {
    //             let tr = document.createElement("tr");
    //             tr.setAttribute("style", "text-align:center; color: gray")
    //             let td = document.createElement("td");
    //             td.innerHTML = "目前尚無郵件";
    //             tr.appendChild(td);
    //             $("#mailboxbody").append(tr);
    //         } else {
    //             for (rawData of res.data) {
    //                 let data = makeMailData(rawData);
    //                 let processedRowData = fillMailRow(makeMailRow(data.mailId), data);
    //                 if (processedRowData.AttachmentIds == null) {
    //                     $("#mailboxbody").append(processedRowData.processedTableRow);
    //                 } else {
    //                     $("#mailboxbody").append(processedRowData.processedTableRow);
    //                     //call api to append a row of attachment, a little trivial probably not gonna make it
    //                 }
    //             }
    //         }
    //         addEvents();
    //         return;
    //     }
    // ).catch(
    //     err => {
    //         console.log(err)
    //     }
    // )
    // }
    console.log("initialized");
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
        'attachmentIds': data.attachmentIds,
        'mailLabels': data.mailLabels,
        'mailCategory': data.mailCategory,
        'mailFolder': data.mailFolder
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
    if (mailData.starred == 1) $(tableRow.querySelector('.mailbox-star a i')).toggleClass('text-warning').toggleClass('text-secondary').toggleClass('starred');
    if (mailData.important == 1) $(tableRow.querySelector('.mailbox-important a i')).toggleClass('text-warning').toggleClass('text-secondary').toggleClass('important');
    $(tableRow.querySelector(".mailbox-name a")).html(mailData.from).attr("href", mailData.fromLink);
    $(tableRow.querySelector(".mailbox-subject a")).html(mailData.subject).attr("href", mailData.mailLink);
    $(tableRow.querySelector(".mailbox-subject")).click(() => window.location = mailData.mailLink);
    const folderNameMapping = {
        "inbox": "收件匣",
        "sent": "已寄出",
        "draft": "草稿",
        "bin": " 回收桶"
    }
    const categoryNameMapping = {
        "normal": "一般信件",
        "job": "工作指派",
        "company": "公司訊息"
    }

    $("<span/>", { class: "badge badge-pill badge-primary mr-1", html: folderNameMapping[mailData.mailFolder.folderName] }).insertBefore($(tableRow.querySelector(".mailbox-subject a")))
    $("<span/>", { class: "badge badge-pill badge-success mr-1", html: categoryNameMapping[mailData.mailCategory.categoryName] }).insertBefore($(tableRow.querySelector(".mailbox-subject a")))
    for (label of mailData.mailLabels) {
        $("<span/>", { class: "badge badge-pill badge-info mr-1", html: label.labelName }).insertBefore($(tableRow.querySelector(".mailbox-subject a")));
    }
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
    $('.checkbox-toggle').unbind('click');
    $('.checkbox-toggle .far.fa-check-square').removeClass('fa-check-square').addClass('fa-square')
    $('.checkbox-toggle').click(function () {
        var clicks = $(this).data('clicks');
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
            } else {
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
            } else {
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
    //handle deletion and recovery
    let mailbox_ = window.location.href.split("/").pop();
    if (mailbox_ == "bin" || mailbox_ == "draft") {
        if ($("#recovery-btn").length == 0) {
            addRecoveryBtn();
            addTooltip();
        }

        $("#delete-mail").css("color", "red");
        $('#delete-mail').unbind('click');
        $("#delete-mail").click(permanentDelete);

    } else {
        $('#delete-mail').unbind('click');
        $("#delete-mail").click(deleteEvent);
    }

    //refresh
    $('#refreshBtn').unbind('click');
    $("#refreshBtn").click(function () {
        $("body").attr("data-modalOn",0);
        initialize();
        $(this).tooltip('hide');
    })

    //read and unread buttons
    $("#hasread-mail").unbind('click');
    $("#hasread-mail").click(function () { setHasreads(1); $(this).tooltip('hide'); });
    $("#notread-mail").unbind('click');
    $("#notread-mail").click(function () { setHasreads(0); $(this).tooltip('hide'); });

    //add label list
    addLabelLi();

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
    let formData = getSelectedFormdata();
    if (formData == null) return;
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
            initialize();
        })
        .catch(error => console.log(error));
    $(this).tooltip('hide');
}

/**
 * a call back function permanently delete mail
 * @returns 
 */
function permanentDelete() {
    $(this).tooltip('hide');
    let trs = findChecked();
    if (trs.length == 0) return;
    Swal.fire({
        title: '永久刪除',
        text: "刪除後無法復原，確認刪除此" + trs.length + "筆郵件?",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#d33',
        confirmButtonText: '刪除',
        cancelButtonText: '取消',
        width: 400,
        preConfirm: () => {
            let formData = getSelectedFormdata();
            if (formData == null) return;
            axios.delete(contextRoot + "mail/multiple", { data: formData }).then(
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
            (async function () {
                await delay(1500);
                initialize();
            })();
        }
    })
    $(this).tooltip('hide');
}

/**
 * update sidebar number for page
 */
async function updateSideBar() {
    let accountId = $("body").attr("data-ref");
    axios.get(`${contextRoot}mail/countall/${accountId}`)
        .then(response => {
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
    console.log("side bar updated");
}

/**
 * add recovery button
 */
async function addRecoveryBtn() {
    let newBtn = $('<button/>', {
        type: "button",
        class: "btn btn-default btn-sm",
        "data-toggle": "tooltip",
        "data-placement": "bottom",
        "title": "放入收件匣",
        "id": "recovery-btn",
        append: $('<i/>', { class: "fa fa-inbox" }),
        click: function () {
            $(this).tooltip('hide');
            let formData = getSelectedFormdata();
            if (formData == null) return;
            axios.put(contextRoot + "mail/folder/1", formData)
                .then(response => {
                    Swal.fire({
                        position: 'bottom-start',
                        toast: true,
                        icon: 'success',
                        title: '已將' + response.data + '筆郵件放入收件夾',
                        showConfirmButton: false,
                        timer: 1500
                    })
                    initialize();
                })
            $(this).tooltip('hide');
        }
    })
    newBtn.insertAfter($("#delete-mail"));
}
/**
 * add label list items for setting mail's label.
 */
function addLabelLi() {
    $("#labelDropdown").html("");
    let accountId = $("body").attr("data-ref");
    axios.get(contextRoot + "mail/label/findall/" + accountId)
        .then(
            response => {
                if (response.data.length == 0) {
                    $("#labelDropdown").append($("<span/>", { class: "dropdown-item text-center", html: "尚無標籤" }));
                    return;
                }
                $("#labelDropdown").html("");
                for (label of response.data) {
                    $("#labelDropdown").append($("<div/>", {
                        class: "form-check form-control-md pl-5 pb-2",
                        style: "font-size:1.0rem",
                        append: [
                            $("<input/>", { class: "form-check-input label-checkbox", type: "checkbox", "data-labelId": label.labelId }),
                            $("<label/>", { class: "form-check-label", html: label.labelName })
                        ]
                    }))
                }
                $("#labelDropdown").append($("<a/>", {
                    class: "dropdown-item border-top text-center",
                    href: "#",
                    html: "套用標籤",
                    click: function (event) {
                        event.preventDefault();
                        let labelIds = [];
                        for (input of $(".label-checkbox")) {
                            if (input.checked) {
                                labelIds.push(Number($(input).attr("data-labelId")));
                            }
                        }
                        let formData = getSelectedFormdata();
                        if (formData == null) return;
                        formData.append("labelIds", labelIds);
                        axios.put(contextRoot + "mail/labels", formData)
                            .then(
                                response => {
                                    Swal.fire({
                                        position: 'bottom-start',
                                        toast: true,
                                        icon: 'success',
                                        title: '已更改' + response.data + '筆郵件的標籤',
                                        showConfirmButton: false,
                                        timer: 1500
                                    })
                                    initialize();
                                }
                            )
                            .catch(
                                errors => console.log(errors)
                            )

                    }
                }))
            }
        )
}

/**
 * return formdata for selected mails status updates
 * @returns {FormData} - formdata contains an array of accountmail's id and their account id {"mailIds": int[], "accountId": int}
 */
function getSelectedFormdata() {
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
    return formData;
}



/**
 * fire a modal that accept user input 
 */
function addLabelModal() {
    Swal.fire({
        title: '請輸入標籤名稱',
        input: 'text',
        inputAttributes: {
            autocapitalize: 'off'
        },
        showCancelButton: true,
        confirmButtonText: '新增標籤',
        cancelButtonText: '取消',
        showLoaderOnConfirm: true,
        preConfirm: (labelName) => {
            let accountId = $("body").attr("data-ref");
            let formData = new FormData();
            formData.append("labelName", labelName);
            formData.append("accountId", accountId);
            return fetch(contextRoot + "mail/label", { method: "post", body: formData })
                .then(response => {
                    if (!response.ok) {
                        console.log(response);
                        throw new Error(response.statusText)
                    }
                    return response.json();
                })
                .catch(error => {
                    Swal.showValidationMessage(
                        `新增失敗: ${error}`
                    )
                })
        },
        allowOutsideClick: () => !Swal.isLoading()
    }).then((result) => {
        if (result.isConfirmed) {
            let row = createLabelRow(result)[0];
            addLabelEvent(row);
            $(row).insertBefore($("#add-label"));
            console.log(result);
            Swal.fire({
                position: 'bottom-start',
                toast: true,
                icon: 'success',
                title: '新增標籤成功',
                showConfirmButton: false,
                timer: 1500
            })
            addLabelLi();
        }
    })
}
/**
 * for passing into
 * @param {Object} response - json response after insert label, with attribute value : {labelId, labelName, accountId(null)}
 */
function createLabelRow(response) {
    let a = $('<a/>', {
        class: "nav-link user-label", href: contextRoot + "backend/mailpage/mailbox/l/label/" + response.value.labelId
        , "data-typeName": response.value.labelId, append: [
            $('<i/>', { class: "fa fa-tag text-secondary", style: "padding-left:3px;padding-right: 2px;" }), " ", response.value.labelName, $('<i/>', { class: "fa fa-trash text-primary invisible float-right" })
        ]
    });
    let li = $('<li/>', { class: "nav-item label-li", "data-lid": response.value.labelId, append: a });
    return li;
}
/**
 * - add events to elements in li
 * @param {Element} li - a  <li> at side bar 
 */
function addLabelEvent(li) {
    $(li.firstElementChild.lastElementChild).click(function (e) {
        e.preventDefault();
        let id = $(li).attr("data-lid");
        Swal.fire({
            title: '刪除標籤',
            text: "確認進行刪除?",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#d33',
            confirmButtonText: '刪除',
            cancelButtonText: '取消',
            preConfirm: () => {
                axios.delete(contextRoot + "mail/label/" + id).then(
                    response => response
                ).catch(error => {
                    Swal.showValidationMessage(
                        `刪除失敗: ${error}`
                    )
                })
            }
        }).then((result) => {
            if (result.isConfirmed) {
                Swal.fire({
                    position: 'bottom-start',
                    toast: true,
                    icon: 'success',
                    title: '移除標籤成功',
                    showConfirmButton: false,
                    timer: 1500
                })
                $(li).remove();
                addLabelLi();
                initMails();
            }
        })
    })
    li.addEventListener("mouseover", function () {
        $(this.firstElementChild.lastElementChild).toggleClass("invisible");
    })
    li.addEventListener("mouseout", function () {
        $(this.firstElementChild.lastElementChild).toggleClass("invisible");
    })
    $(li.firstElementChild.lastElementChild).mouseover(function () { $(this).toggleClass("text-danger").toggleClass("text-primary"); });
    $(li.firstElementChild.lastElementChild).mouseout(function () { $(this).toggleClass("text-danger").toggleClass("text-primary"); });
}

/**
 * - set selected mails read or not read
 * @param {Number} hasread - 0 or 1, represent not read and read 
 */
function setHasreads(hasread) {
    let formData = getSelectedFormdata();
    axios.put(contextRoot + "mail/hasreads/" + hasread, formData)
        .then(
            response => initMails()
        )
        .catch(
            error => console.log(error)
        )
}
/**
 * add pagination too mailbox
 */
async function addPagination(conditions, advanceFilters = false) {
    let url = window.location.href.split("/");
    let tname = url.pop();
    let type = url.pop();
    if (conditions == null) conditions = getConditions();
    if (!advanceFilters) {
        if (type == "category") conditions["categoryName"] = tname;
        if (type == "folder") conditions["folderName"] = tname;
        if (type == "label") {
            if (tname == "important") {
                conditions["important"] = 1;
            } else if (tname == "starred") {
                conditions["starred"] = 1;
            } else {
                conditions["labelId"] = tname;
            }
        }
    }
    axios.post(contextRoot + `mail/conditions/count`, conditions)
        .then(
            response => {
                console.log("make pagination")
                console.log(response.data);
                let onePageMail = 10;
                let numOfPages = Math.ceil(response.data / onePageMail);
                if (numOfPages == 0) numOfPages = 1;
                if (numOfPages < Number($("body").attr("data-pagenum"))) {
                    $("body").attr("data-pagenum", numOfPages);
                    initMails();
                }
                console.log(numOfPages);
                if (advanceFilters) {
                    makePagination(numOfPages, true);
                } else {
                    makePagination(numOfPages);
                }
            }
        )
}
//old pagination
// async function addPagination() {
//     let accountId = $("body").attr("data-ref");
//     let url = window.location.href.split("/");
//     let tname = url.pop();
//     let type = url.pop();
//     axios.get(contextRoot + `mail/count/${type}/${tname}/${accountId}`)
//         .then(
//             response => {
//                 console.log("make pagination")
//                 let onePageMail = 10;
//                 let numOfPages = Math.ceil(response.data / onePageMail);
//                 if (numOfPages < Number($("body").attr("data-pagenum"))) {
//                     $("body").attr("data-pagenum", numOfPages);
//                     initMails();
//                 }
//                 makePagination(numOfPages);
//             }
//         )
// }
/**
 * make elements with event handlers to deal with paging
 * @param {Number} pageNum - total number of pages of the specified mailbox 
 */
function makePagination(pageNum, advanceFilters = false) {
    $(".page-number").remove();
    $("#prevPageLi").addClass("disabled");
    $("#nextPageLi").removeClass("disabled");
    if (pageNum == 1) $("#nextPageLi").addClass("disabled");
    for (let i = 1; i <= pageNum; i++) {
        let li = $("<li/>", { class: "page-item page-number", append: $("<a/>", { class: "page-link", href: "#", html: i }) });
        li.insertBefore($("#nextPageLi"));
    }

    $($(".page-number")[Number($("body").attr("data-pagenum")) - 1]).addClass("active");
    $("#nextPageLi a").off('click');
    $("#nextPageLi a").click(function (event) {
        event.preventDefault();
        $("body").attr("data-pagenum", Number($("body").attr("data-pagenum")) + 1);
        initMails();
        $("#prevPageLi").removeClass("disabled");
        if ($("body").attr("data-pagenum") == pageNum) {
            $("#nextPageLi").addClass("disabled");
        }
        let a = $(".page-number.active");
        a.next(".page-number").addClass("active");
        a.removeClass("active")
    })
    $("#prevPageLi a").off('click');
    $("#prevPageLi a").click(function (event) {
        event.preventDefault();
        $("body").attr("data-pagenum", Number($("body").attr("data-pagenum")) - 1);
        initMails();
        $("#nextPageLi").removeClass("disabled");
        if ($("body").attr("data-pagenum") == 1) {
            $("#prevPageLi").addClass("disabled");
        }
        let a = $(".page-number.active");
        a.prev(".page-number").addClass("active");
        a.removeClass("active")
    })
    if (advanceFilters) {
        for (a of $(".page-number a")) {
            $(a).click(function (event) {
                event.preventDefault();
                $("body").attr("data-pagenum", this.innerHTML);
                $(".page-number").removeClass("active");
                $(this).parent(".page-number").addClass("active");
                if ($(this).parent(".page-number").hasClass("active")) {
                    if (pageNum == 1 || pageNum == 0) {
                        $("#nextPageLi").addClass("disabled");
                        $("#prevPageLi").addClass("disabled");
                    } else if (this.innerHTML == 1) {
                        $("#nextPageLi").removeClass("disabled");
                        $("#prevPageLi").addClass("disabled");
                    } else if (this.innerHTML == pageNum) {
                        $("#prevPageLi").removeClass("disabled");
                        $("#nextPageLi").addClass("disabled");
                    } else {
                        $("#prevPageLi").removeClass("disabled");
                        $("#nextPageLi").removeClass("disabled");
                    }
                }
                let conditions = getFilterConditions();
                initMails(conditions);
            })
        }
        return;
    }
    for (a of $(".page-number a")) {
        $(a).click(function (event) {
            event.preventDefault();
            $("body").attr("data-pagenum", this.innerHTML);
            $(".page-number").removeClass("active");
            $(this).parent(".page-number").addClass("active");
            if ($(this).parent(".page-number").hasClass("active")) {
                if (pageNum == 1 || pageNum == 0) {
                    $("#nextPageLi").addClass("disabled");
                    $("#prevPageLi").addClass("disabled");
                } else if (this.innerHTML == 1) {
                    $("#nextPageLi").removeClass("disabled");
                    $("#prevPageLi").addClass("disabled");
                } else if (this.innerHTML == pageNum) {
                    $("#prevPageLi").removeClass("disabled");
                    $("#nextPageLi").addClass("disabled");
                } else {
                    $("#prevPageLi").removeClass("disabled");
                    $("#nextPageLi").removeClass("disabled");
                }
            }
            initMails();
        })
    }
}
/**
 * create and add eventListeners to buttons that set conditions,
 */
async function prepareConditions() {
    axios.get(contextRoot + "mail/sent/" + $("body").attr("data-ref"))
        .then(
            response => {
                $("#sendByItems").html("");
                let a0 = $("<a/>", {
                    class: "dropdown-item", href: "#",
                    html: "不限",
                    click: function (event) {
                        event.preventDefault();
                        $("#condition-sendBy").html("寄件人 ");
                        let conditions = getConditions();
                        $("body").attr("data-modalOn",0);
                        initMails(conditions);
                        addPagination();
                    }
                });
                a0.appendTo($("#sendByItems"));
                for (account of response.data) {
                    let a = $("<a/>", {
                        class: "dropdown-item", href: "#",
                        html: account,
                        click: function (event) {
                            event.preventDefault();
                            $("#condition-sendBy").html("寄件人 " + $(this).html());
                            let conditions = getConditions();
                            $("body").attr("data-modalOn",0);
                            initMails(conditions);
                            addPagination();
                        }
                    })
                    a.appendTo($("#sendByItems"))
                };
            }
        )
    $('#condition-daterange').unbind('apply.daterangepicker');
    $('#condition-daterange').on('apply.daterangepicker', function (ev, picker) {
        $('#condition-daterange span').html(picker.chosenLabel);
        let conditions = getConditions();
        $("body").attr("data-modalOn",0);
        initMails(conditions);
        addPagination();
    });

    $("#condition-unread, #condition-hasAttachment").unbind("click");
    $("#condition-unread, #condition-hasAttachment").click(function () {
        $(this).toggleClass("active").trigger("blur");
        let conditions = getConditions();
        $("body").attr("data-modalOn",0);
        initMails(conditions);
        addPagination();
    })

    $("#searchMailBtn").unbind("click");
    $("#searchMailBtn").click(function () {
        let conditions = getConditions();
        let text = $("#searchText").val();
        // if (text.length == 0) return;
        conditions.subject = text;
        conditions.content = text;
        // console.log(text);
        $("body").attr("data-modalOn",0);
        initMails(conditions);
        addPagination(conditions);
    })
}
/**
 * get condition object based on top bar buttons
 * @returns {conditions}
 */
function getConditions() {
    let conditions = {
        sentBy: "",
        sentTo: "",
        subject: "",
        content: "",
        startDate: "",
        endDate: "",
        folderName: "",
        categoryName: "",
        labelId: -1,
        hasread: -1,
        hasAttachment: -1,
        important: -1,
        starred: -1
    }
    if ($("#condition-unread").hasClass("active")) conditions["hasread"] = 0;
    if ($("#condition-hasAttachment").hasClass("active")) conditions["hasAttachment"] = 1;
    let dateString = $("#condition-daterange input").val();
    if (dateString.length > 0) {
        let dates = dateString.split("to");
        conditions["startDate"] = dates[0];
        conditions["endDate"] = dates[1];
    }
    let sentBy = $("#condition-sendBy").html().split("寄件人")[1];
    if (sentBy.length != 0) conditions["sentBy"] = sentBy.trim();
    // console.log(conditions);
    return conditions;
}


$("#searchFilterBtn").click(initFilterModal);
$("#filterModalSend").click(
    function () {
        let conditions = getFilterConditions();
        $("body").attr("data-modalOn","1");
        initMails(conditions,true);
        addPagination(conditions,true);
        $('#filterModal').modal('hide');
    }
);

/**
 * init filter modal, a callback function passed to #searchFilterBtn click eventlistener
 */
function initFilterModal() {
    //init mailTo
    axios.get(contextRoot + "mail/sent/" + $("body").attr("data-ref")).
        then(
            res => {
                $("#mailFromC").html("");
                $("#mailFromC").append($("<option/>", { value: "", html: "不限" }));
                let accounts = res.data;
                if (accounts.length == 0) {
                    $("#mailFromC").append($("<option/>", { html: "無收件人", disabled: true }));
                    return;
                }
                for (acc of accounts) {
                    $("#mailFromC").append($("<option/>", { html: acc }));
                };
            }
        );
    //init mailFrom
    axios.get(contextRoot + "mail/from/" + $("body").attr("data-ref")).
        then(
            res => {
                $("#mailToC").html("");
                $("#mailToC").append($("<option/>", { value: "", html: "不限" }));
                let accounts = res.data;
                if (accounts.length == 0) {
                    $("#mailToC").append($("<option/>", { html: "無寄件人", disabled: true }));
                    return;
                }
                for (acc of accounts) {
                    $("#mailToC").append($("<option/>", { html: acc }));
                };
            }
        );
    //init labels
    axios.get(contextRoot + "mail/label/findall/" + $("body").attr("data-ref")).
        then(
            res => {
                $("#labelC").html("");
                $("#labelC").append($("<option/>", { value: -1, html: "不限" }));
                if (res.data.length == 0) {
                    $("#labelC").append($("<option/>", { html: "(目前無標籤)", disabled: true, style: "background-color: lightgray" }));
                    return;
                }
                for (label of res.data) {
                    $("#labelC").append($("<option/>", { html: label.labelName, value: label.labelId }));
                }
            }
        )
}

/**
 * get conditions based on modal fields, a callback function passed to #filterModalSend click eventListener
 * @returns {conditions}
 */
function getFilterConditions() {
    let conditions = {
        sentBy: "",
        sentTo: "",
        subject: "",
        content: "",
        startDate: "",
        endDate: "",
        folderName: "",
        categoryName: "",
        labelId: -1,
        hasread: -1,
        hasAttachment: -1,
        important: -1,
        starred: -1
    }
    conditions.sentTo = $("#mailToC").val();
    conditions.sentBy = $("#mailFromC").val();
    conditions.subject = $("#subjectC").val();
    conditions.content = $("#contentC").val();
    conditions.startDate = $("#startDateC").val();
    conditions.endDate = $("#endDateC").val();
    conditions.folderName = $("#folderC").val();
    conditions.categoryName = $("#categoryC").val();
    conditions.labelId = Number($("#labelC").val());
    conditions.hasread = $("#hasreadC").prop("checked") ? 0 : -1;
    conditions.hasAttachment = $("#hasAttachmentC").prop("checked") ? 1 : -1;
    conditions.important = $("#importantC").prop("checked") ? 1 : -1;
    conditions.starred = $("#starredC").prop("checked") ? 1 : -1;
    console.log(conditions);
    return conditions;
}

//not finished
function checkFilterConditions(conditions) {
    if (conditions.endDate < conditions.firstDate) {
        let error = "結束日期不能大於開始日期";
    }
    return;
}