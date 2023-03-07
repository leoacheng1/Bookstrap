function addToWatchlist(ebookId) {
    // Send an AJAX request to the server to add or remove the ebook from the user's watchlist

    console.log('Function!!!!!!!!')
    $.ajax({
        url: "/watchlist/add",
        method: "GET",
        data: {
            ebookId: ebookId
        },
        success: function(response) {
            // Update the appearance of the "Add to Watchlist" button
            if (response === "added") {
                $("#addToWatchlistButton").addClass("watchlist-added");
                $("#addToWatchlistButton").html("Added to Watchlist");
            } else if (response === "removed") {
                $("#addToWatchlistButton").removeClass("watchlist-added");
                $("#addToWatchlistButton").html("Add to Watchlist");
            }
        },
        error: function(xhr, status, error) {
            console.error("Error adding ebook to watchlist: " + error);
        }
    });
}
