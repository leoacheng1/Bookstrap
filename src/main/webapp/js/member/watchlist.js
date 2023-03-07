// function addToWatchlist(ebookId) {
//     // Send an AJAX request to the server to add or remove the ebook from the user's watchlist

//     console.log('Function!!!!!!!!')
//     $.ajax({
//         url: "/watchlist/add",
//         method: "GET",
//         data: {
//             ebookId: ebookId
//         },
//         success: function(response) {
//             // Update the appearance of the "Add to Watchlist" button
//             if (response === "added") {
//                 $("#addToWatchlistButton").addClass("watchlist-added");
//                 $("#addToWatchlistButton").html("Added to Watchlist");
//             } else if (response === "removed") {
//                 $("#addToWatchlistButton").removeClass("watchlist-added");
//                 $("#addToWatchlistButton").html("Add to Watchlist");
//             }
//         },
//         error: function(xhr, status, error) {
//             console.error("Error adding ebook to watchlist: " + error);
//         }
//     });
// }


// const accountInput = document.getElementById('addToWatchlistButton');
// console.log(accountInput);

// accountInput.addEventListener('click', e => {

//     let String = document.getElementById('memberEmail').value;
//                 console.log(String);

//     let formData = new FormData();
//     formData.append("memberEmail", String);    

//     checkAccount(formData);
// })


function addToWatchlist(ebookId){

    let requestUrl = 'http://localhost:8080/Bookstrap/favorite/ebook/checkfavority';
    axios.get(requestUrl, ebookId)
    .then(res => {
        
        if (res.data.response == 'Y') {
            $("#addToWatchlistButton").addClass("watchlist-added");
                $("#addToWatchlistButton").html("Added to Watchlist");
                
                document.getElementsByClassName('watchListString')[0].innerHTML =  'Add to watch List'
                document.getElementsByClassName('watchListString')[0].innerHTML = ''
        }else {
            $("#addToWatchlistButton").removeClass("watchlist-added");
            $("#addToWatchlistButton").html("Add to Watchlist");
            
            document.getElementsByClassName('watchListString')[0].innerHTML =  ''
            document.getElementsByClassName('watchListString')[0].innerHTML = 'Remove form watch List'

        }
    })
    .catch(err => {
        console.error(err);
    })}

    