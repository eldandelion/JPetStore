

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