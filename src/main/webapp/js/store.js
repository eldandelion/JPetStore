
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


