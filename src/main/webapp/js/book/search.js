
const submitBtnnnn = document.getElementById('submitBtnnnn')
submitBtnnnn.addEventListener('click',function(e){
 console.log("OKOK")
 let selectorL = ""
 let selectorC = ""
if(document.getElementById("allL").checked == true){
   
 }
if(document.getElementById("chinese").checked == true){
  selectorL+="or languages = '中文' "
}
if(document.getElementById("foreign").checked == true){
  selectorL+="or languages = '外文' "
}
if(document.getElementById("allC").checked == true){
   
}
if(document.getElementById("philosophy").checked == true){
  selectorC+="or category = '哲學' "
}
if(document.getElementById("religion").checked == true){
  selectorC+="or category = '宗教' "
}
if(document.getElementById("science").checked == true){
  selectorC+="or category = '科學' "
}
if(document.getElementById("appliedScience").checked == true){
  selectorC+="or category = '應用科學' "
}
if(document.getElementById("socialScience").checked == true){
  selectorC+="or category = '社會科學'"
}
if(document.getElementById("history").checked == true){
  selectorC+="or category = '歷史' "
}
if(document.getElementById("philosophy").checked == true){
  selectorC+="or category = '地理' "
}
if(document.getElementById("geography").checked == true){
  selectorC+="or category = '語言文學' "
}
if(document.getElementById("Art").checked == true){
  selectorC+="or category = '藝術' "
}
if(document.getElementById("other").checked == true){
  selectorC+="or category = '其他' "
}
console.log("selectorL:"+selectorL)
console.log("selectorC:"+selectorC)
const str1=selectorL.substring(15,selectorL.length)
const str2=selectorC.substring(14,selectorC.length)
console.log("str1:"+str1)
console.log("str2:"+str2)

// axios({
//   method:'get',
//   url: "http://localhost:8080/Bookstrap/books/search",
//   params:{
//     languages:str1,
//     category:str2
// }
// })
// .then(res=>{
//   console.log("跳頁成功")
//   window.location.href = 'http://localhost:8080/Bookstrap/books/search';
// })
// .catch(err=>{
//   console.log("跳頁失敗")
// })
})
