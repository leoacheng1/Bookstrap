
const submitBtnnnn = document.getElementById('submitBtnnnn')
submitBtnnnn.addEventListener('click',function(e){
 console.log("OKOK")
 let selectorL = ""
 let selectorC = ""
if(document.getElementById("allL").checked == true){
   
 }
if(document.getElementById("chinese").checked == true){
  selectorL+="or languages = 中文 "
}
if(document.getElementById("foreign").checked == true){
  selectorL+="or languages = 外文 "
}
if(document.getElementById("allC").checked == true){
   
}
if(document.getElementById("philosophy").checked == true){
  selectorC+="or category = 哲學 "
}
if(document.getElementById("religion").checked == true){
  selectorC+="or category = 宗教 "
}
if(document.getElementById("science").checked == true){
  selectorC+="or category = 科學 "
}
if(document.getElementById("appliedScience").checked == true){
  selectorC+="or category = 應用科學 "
}
if(document.getElementById("socialScience").checked == true){
  selectorC+="or category = 社會科學 "
}
if(document.getElementById("history").checked == true){
  selectorC+="or category = 歷史 "
}
if(document.getElementById("geography").checked == true){
  selectorC+="or category = 地理 "
}
if(document.getElementById("foreignLan").checked == true){
  selectorC+="or category = 語言文學 "
}
if(document.getElementById("Art").checked == true){
  selectorC+="or category = 藝術 "
}
if(document.getElementById("other").checked == true){
  selectorC+="or category = 其他 "
}
console.log("selectorL:"+selectorL)
console.log("selectorC:"+selectorC)
const str1=selectorL.substring(15,selectorL.length)
const str2=selectorC.substring(14,selectorC.length)
console.log("str1:"+str1)
console.log("str2:"+str2)
getbook(str1,str2);
})

function getbook(str1,str2){
axios({
  url: "http://localhost:8080/Bookstrap/books/getbook",
  method:'get',
  params:{
    languages:str1,
    category:str2
}
})
.then(res=>{
  console.log("res:"+res.data)
  htmlmaker(res.data)
})
.catch(err=>{
  console.log("跳頁失敗")
})

}
function htmlmaker(data){
 
  let daaaata=""
    data.forEach(element => {


console.log(element.name )

    daaaata+=`<div class="card" style="width: 18rem">`
  +`<img src="http://localhost:8080/Bookstrap/books/id?id=`+element.id+`" class="card-img-top">`
  +`<div class="card-body">`
  +`<h5 class="card-title">`+element.name+`</h5>`
  +` <p class="card-text">售價:`+element.price+`元</p>`
  +`<a href="#" class="btn btn-primary">加入購物車</a>`
  +` </div>`
  +`</div>`
  }); 
  const con = document.getElementById('console')
  con.innerHTML=daaaata
}