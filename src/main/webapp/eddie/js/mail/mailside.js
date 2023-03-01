var contextRoot = "http://localhost:8080/Bookstrap/";




$("#add-label").click(function (event) {
    event.preventDefault();
    addLabelModal();
})
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
            formData.append("labelName",labelName);
            formData.append("accountId",accountId);
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
        }
    })
}
// function addLabelRow(labelData) {
//     let li = $(".label-li");
//     if (li != null) {
//         let newLi = $(li[0]).clone(true,true);
//         labelData.labelName
//         labelData.
//     }
// }


for (li of document.getElementsByClassName("label-li")) {
    addLabelEvent(li);
}


/**
 * for passing into
 * @param {Object} response - json response after insert label, with attribute value : {labelId, labelName, accountId(null)}
 */
function createLabelRow(response) {
    let a = $('<a/>',{class: "nav-link user-label", href: "apiURL"+response.value.labelId, append:[
        $('<i/>',{class: "fas fa-bookmark text-secondary", style: "padding-left:3px;padding-right: 2px;"}), " " , response.value.labelName, $('<i/>',{class: "fa fa-trash text-primary invisible float-right"})
    ]});
    let li = $('<li/>',{class: "nav-item label-li", "data-lid": response.value.labelId, append: a});
    return li;
}
/**
 * - add events to elements in li
 * @param {Element} li - a  <li> at side bar 
 */
function addLabelEvent(li) {
    $(li.firstElementChild.lastElementChild).click(function(e){
        e.preventDefault();
        let id = $(li).attr("data-lid");
        Swal.fire({
            title: '刪除標籤',
            text: "確認進行刪除?",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#d33',
            confirmButtonText: '刪除',
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
            }
          })
    })
    li.addEventListener("mouseover", function() {
        $(this.firstElementChild.lastElementChild).toggleClass("invisible");      
    })
    li.addEventListener("mouseout", function() {
        $(this.firstElementChild.lastElementChild).toggleClass("invisible");         
    })
    $(li.firstElementChild.lastElementChild).mouseover(function(){$(this).toggleClass("text-danger").toggleClass("text-primary");});
    $(li.firstElementChild.lastElementChild).mouseout(function(){$(this).toggleClass("text-danger").toggleClass("text-primary");});
}