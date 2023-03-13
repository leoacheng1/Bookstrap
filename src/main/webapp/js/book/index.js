///////// 最新中文書推薦 ////////
let chineseBtns = document.getElementsByClassName('chineseBtn')//因ClassName回傳的是NodeList，代表有多個元素符合指定的類別名稱，所以需要使用迴圈
for (i = 0; i < chineseBtns.length; i++) {
  chineseBtns[i].addEventListener('click', function(e){
    console.log("有抓到")
    let languageC = this.getAttribute('data-languages')
    console.log('語言為'+languageC)
    axios({
        url: 'http://localhost:8080/Bookstrap/books/date',
        method:'get',
        params:{
            languages:languageC
        }
    })
    .then(res=>{
        // console.log(res.data)
        // console.log(res.data.length)
        photoMakerC(res.data)
    })
    .catch(err=>{
        console.log(err)
    })
  })
}

function photoMakerC(data){
    const photoArea = document.getElementById('photoArea')
    photoArea.innerHTML=''
    let photoC = ''
    data.forEach(element => {
        console.log(element.name)
        photoC += `<li style="list-style: none;float: left;text-align: center;flex: 2;margin-left:35px;margin-right:35px">
                  <a href="http://localhost:8080/Bookstrap/books/oneBook?id=`+element.id+`">
                  <img src="http://localhost:8080/Bookstrap/books/id?id=`+element.id+`" style="width:157px;height:240px;" /></a>
                  <div style="text-align: center;margin-left:7px"><a href="http://localhost:8080/Bookstrap/books/oneBook?id=` + element.id + `">`+element.name+`</a></div>
                  </li>`
    });
    photoArea.innerHTML = photoC

}
                
window.addEventListener('load', function(e){
    console.log("有抓到")
    let chineseBtns = document.getElementsByClassName('chineseBtn')
    for (i = 0; i < chineseBtns.length; i++) {
        let languageC = chineseBtns[i].getAttribute('data-languages')
        console.log('語言為'+languageC)
    axios({
        url: 'http://localhost:8080/Bookstrap/books/date',
        method:'get',
        params:{
            languages:languageC
        }
    })
    .then(res=>{
        console.log(res.data)
        console.log(res.data.length)
        photoMakerC(res.data)
    })
    .catch(err=>{
        console.log(err)
    })
    }
  })

  ///////// 最新外文書推薦 ////////
  let foreignBtn = document.getElementsByClassName('foreignBtn')//因ClassName回傳的是NodeList，代表有多個元素符合指定的類別名稱，所以需要使用迴圈
  for (i = 0; i < foreignBtn.length; i++) {
    foreignBtn[i].addEventListener('click', function(e){
      console.log("有抓到")
      let languageF = this.getAttribute('data-languages')
      console.log('語言為'+languageF)
      axios({
          url: 'http://localhost:8080/Bookstrap/books/date',
          method:'get',
          params:{
              languages:languageF
          }
      })
      .then(res=>{
          console.log(res.data)
          console.log(res.data.length)
          photoMakerF(res.data)
      })
      .catch(err=>{
          console.log(err)
      })
    })
  }

  function photoMakerF(data){
    const photoArea = document.getElementById('photoArea')
    photoArea.innerHTML=''
    let photoF = ''
    data.forEach(element => {
        console.log(element.name)
        photoF += `<li style="list-style: none;float: left;text-align: center;flex: 2;margin-left:35px;margin-right:35px">
                   <a href="http://localhost:8080/Bookstrap/books/oneBook?id=`+element.id+`">
                   <img src="http://localhost:8080/Bookstrap/books/id?id=`+element.id+`" style="width:157px;height:240px;" /></a>
                   <div style="text-align: center;margin-left:7px">`+element.name+`</div>
                   </li>`
    });
    photoArea.innerHTML = photoF

}


