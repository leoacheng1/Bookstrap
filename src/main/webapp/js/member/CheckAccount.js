const button =  document.getElementById('submitButton');

button.addEventListener('blur', e =>{

let inputEmail = document.getElementById('memberEmail')

let requestUrl = 'http://localhost:8080/member/checkaccount'

axios({
    method:'post',
    url: requestUrl,
    data: {
        id:requestUrl
    }
})

} )