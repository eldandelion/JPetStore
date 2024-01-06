

const loginButton = document.getElementById('login-button');

if (loginButton) {
    loginButton.addEventListener('click', function() {
        const contextPath = window.location.pathname.substring(0, window.location.pathname.indexOf("/", 1));
        console.log(contextPath);
        window.location.href=contextPath + '/login'

    });
}
function incrementNumber(group) {
    numbers[group]++;
    updateNumberElement(group);
}

function decrementNumber(group) {
    if (numbers[group] > 1) {
        numbers[group]--;
        updateNumberElement(group);
    }
}

function updateNumberElement(group) {
    var numberElement = document.getElementById('number-' + group);
    numberElement.innerText = numbers[group];
}

const pageItemsDecrement = document.querySelectorAll('.page-link-decrement');

// Add click event listener to each button
pageItemsDecrement.forEach(function(button) {

    button.addEventListener('click', function(event) {
        // Get the value of the clicked button
        const itemId = event.target.value;
        // Display the value in the console window



    });
});