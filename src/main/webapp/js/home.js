

const loginButton = document.getElementById('login-button');

loginButton.addEventListener('click', function() {
    const contextPath = window.location.pathname.substring(0, window.location.pathname.indexOf("/", 1));
    console.log(contextPath);
    window.location.href=contextPath + '/login'

});