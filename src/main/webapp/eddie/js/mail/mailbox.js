
$(function () {
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
      let fa    = $this.hasClass('fas')

      //Switch states
      if (fa) {
        console.log("clicked!")
        $this.toggleClass('text-secondary')
        $this.toggleClass('text-warning')
        $this.toggleClass('starred')
      }
    })
    //handle important
    $('.mailbox-important').click(function (e) {
      e.preventDefault()
      //detect type
      let $this = $(this).find('a > i')
      let fa    = $this.hasClass('fa')

      //Switch states
      if (fa) {
        console.log("clicked!")
        $this.toggleClass('text-secondary')
        $this.toggleClass('text-warning')
        $this.toggleClass('important')
      }
    })
  })

  console.log($('.mailrow').clone(true))
  axios({
    url : "http://localhost:8080/Bookstrap/mail/api/allmail",
    method: "get"
}).then(
  res => {
    dataArr = res.data;
    makeMailRow(dataArr);
  }
).catch(
  err => {
    console.log(err)
  }
)

function makeMailRow(dataArr) {
  for (data of dataArr) {
    let fromuser = data.accountFrom.account;
    let subject = data.mailSubject;
    let now = new Date();
    let timeDiff = (now.getTime() - Date.parse(data.mailTime))/1000;
    let timeDiffString;
    if (timeDiff < 5) {
      timeDiffString = "剛剛";
    }else if(timeDiff < 60) {
      timeDiffString = timeDiff + "秒以前";
    }else if(timeDiff < 3600) {
      let min = Math.floor(timeDiff / 60);
      let sec = timeDiff % 60;
      timeDiffString = min + "分鐘" + sec + "秒以前";
    }else if(timeDiff < 216000) {
      let hr = Math.floor 
    }
  }
  // let mailrow = $('mailrowTemplate')[0].clone(true); 

}


{/* <tr class="mailrowTemplate">
<td>
  <div class="icheck-primary">
    <input type="checkbox" value="" id="check1">
    <label for="check1"></label>
  </div>
</td>
<td class="mailbox-star"><a href="#"><i class="fas fa-star text-secondary"></i></a></td>
<td class="mailbox-important"><a href="#"><i class="fa fa-bookmark text-secondary"></i></a></td>
<td class="mailbox-name"><a href="read-mail.html">馬保國</a></td>
<td class="mailbox-subject"><a href="${contextRoot}">混元太極功法</a></td>
<td class="mailbox-attachment"></td>
<td class="mailbox-date">5 mins ago</td>
</tr> */}