const btnLogout = document.getElementById('btn-sign-out')


btnLogout.addEventListener('click', () => {
    logOut()
})

function logOut() {

    $.ajax({
        url: "/JPetStore_war/profile",
        type: "POST",
        data: {operation: "invalidate"},
        dataType: "json",

        success: function (response) {
            console.info('data received')
            window.location.href = response.redirect;

        },
        error: (error) => {
            console.log(JSON.stringify(error));
        }
    });
}


// Make an AJAX request to the server
$.ajax({
    url: "/JPetStore_war/cart",
    type: "GET",
    data: {cartSizeQuery: "give me profile cart"},
    dataType: "json",

    success: function (response) {
        console.info(response)
        const cartSpan = document.getElementById("cart-size-span")
        cartSpan.innerText = response

    },
    error: (error) => {
        console.log(JSON.stringify(error));
    }
});


const editButtonAddress = document.getElementById('button-edit-address');
const addressInput = document.getElementById('address');

const editButtonAddressTwo = document.getElementById('button-edit-address-two');
const addressTwoInput = document.getElementById('address2');

const editButtonPassword = document.getElementById('button-edit-password')
const passwordInput = document.getElementById('password');

const editButtonEmail = document.getElementById('button-edit-email')
const emailInput = document.getElementById('email');

const editButtonPhone = document.getElementById('button-edit-phone')
const phoneInput = document.getElementById('phone');
// Add a click event listener to the edit button
editButtonAddress.addEventListener('click', function() {
    // Enable the input field
    addressInput.disabled = false;
});

editButtonAddressTwo.addEventListener('click', function() {
    // Enable the input field
    addressTwoInput.disabled = false;
});

editButtonPassword.addEventListener('click', function() {
    // Enable the input field
    passwordInput.disabled = false;
});

editButtonEmail.addEventListener('click', function() {
    // Enable the input field
    emailInput.disabled = false;
});

editButtonPhone.addEventListener('click', function() {
    // Enable the input field
    phoneInput.disabled = false;
});

