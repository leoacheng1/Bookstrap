
const accountInput = document.getElementById('memberEmail');
console.log(accountInput);

accountInput.addEventListener('blur', e => {

    let String = document.getElementById('memberEmail').value;
                console.log(String);

    let formData = new FormData();
    formData.append("memberEmail", String);    
    if(accountInput != null && !accountInput.value == ''){
            checkAccount(formData);
    } else{
        submitButton.disabled = true;
    }

})

function checkAccount(json){

    let requestUrl = 'http://localhost:8080/Bookstrap/member/checkaccount';
    axios.post(requestUrl, json)
    .then(res => {
        console.log("result:" +  document.getElementsByClassName('accountExist')[0].innerHtml);
        if (res.data.response == 'Y') {
            document.getElementsByClassName('accountExist')[0].innerHTML =  '此帳號已被註冊'
            document.getElementsByClassName('accountNotExist')[0].innerHTML = ''
            submitButton.disabled = true;
        }else {
            document.getElementsByClassName('accountExist')[0].innerHTML =  ''
            document.getElementsByClassName('accountNotExist')[0].innerHTML = '帳號可以被註冊'
            submitButton.disabled = false;
        }
    })
    .catch(err => {
        console.error(err);
    })}

    const submitButton = document.getElementById('submitButton')
    submitButton.disabled = true;

   