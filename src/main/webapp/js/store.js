


const toastTrigger = document.getElementsByClassName('btn-purchase')
const toastLiveExample = document.getElementById('liveToast')


if (toastTrigger) {
    const toastBootstrap = bootstrap.Toast.getOrCreateInstance(toastLiveExample)
    for (let i = 0; i < toastTrigger.length; i++) {
        toastTrigger[i].addEventListener('click', () => {
            toastBootstrap.show();
        });
    }
}
document.getElementById("backToTop").addEventListener("click", function(event) {
    event.preventDefault(); // Pr  event the default link behavior
    document.getElementById("album-categories").scrollTo(
        {
            top: 0,
            behavior: "smooth" // Use smooth scrolling behavior for a smooth transition
        });

});


const btnClose = document.getElementById('button-close')
const searchContainer = document.getElementById('container-search');
const fishContainer = document.getElementById('container-fish');
const dogsContainer = document.getElementById('container-dogs');
const catsContainer = document.getElementById('container-cats');
const reptilesContainer = document.getElementById('container-reptiles');
const birdsContainer = document.getElementById('container-birds');
const searchInput = document.getElementById('search-input');

btnClose.addEventListener("click", function() {
    if (searchContainer.style.display === 'none') {
        searchContainer.style.display = 'block';
    } else {
        fishContainer.style.display = 'block';
        dogsContainer.style.display = 'block';
        catsContainer.style.display = 'block';
        reptilesContainer.style.display = 'block';
        birdsContainer.style.display = 'block';
        searchContainer.style.display = 'none';
        searchInput.value = '';
    }
});

const progressBar = document.getElementById('progress-bar');



$(document).ready(function() {
    // Handle form submission
    $("#search-form").submit(function(event) {
        // Prevent the default form submission
        event.preventDefault();
        progressBar.style.display = 'block'

        // Get the search query from the input field
        var searchQuery = $("#search-input").val();
        $("#container-search").show();
        $("#container-fish").hide();
        $("#container-dogs").hide();
        $("#container-cats").hide();
        $("#container-reptiles").hide();
        $("#container-birds").hide();


        // Make an AJAX request to the server
        $.ajax({
            url: "/JPetStore_war/store",
            type: "POST",
            data: { searchQuery: searchQuery },
            dataType: "text",

            success: function(response) {
                // Update the search results container with the response HTML
                $("#cards-search").html(response);
                progressBar.style.display = 'none'
            },
            error: (error) => {
                console.log(JSON.stringify(error));
                progressBar.style.display = 'none'
            }
        });
    });
});




