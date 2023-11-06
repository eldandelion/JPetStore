

document.getElementById("backToTop").addEventListener("click", function(event) {
    event.preventDefault(); // Pr  event the default link behavior
    document.getElementById("album-categories").scrollTo(
        {
            top: 0,
            behavior: "smooth" // Use smooth scrolling behavior for a smooth transition
        });

});


