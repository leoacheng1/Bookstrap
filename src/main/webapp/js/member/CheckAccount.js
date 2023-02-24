
const accountInput = document.getElementById('memberEmail');
console.log(accountInput);
accountInput.addEventListener('blur', e => {

    let String = document.getElementById('memberEmail').value;
                console.log(String);

    let formData = new FormData();
    formData.append("memberEmail", String);    

checkAccount(formData);



})

function checkAccount(json){

    let requestUrl = 'http://localhost:8080/Bookstrap/member/checkaccount';

    axios.post(requestUrl, json)
    .then(res => {
        console.log(res)
    })
    .catch(err => {
        console.error(err);
    })

}