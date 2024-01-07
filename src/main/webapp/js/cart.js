const loginButton = document.getElementById('login-button');
const subtotal = document.getElementById('subtotal');
const subtotalSidebar = document.getElementById('subtotalSidebar')

if (loginButton) {
    loginButton.addEventListener('click', function () {
        const contextPath = window.location.pathname.substring(0, window.location.pathname.indexOf("/", 1));
        console.log(contextPath);
        window.location.href = contextPath + '/login'

    });
}

$.ajax({
    url: "/JPetStore_war/cart",
    type: "GET",
    data: {
        purpose: "GET_SUBTOTAL"
    },
    dataType: "json",

    success: function (data) {
        // Update the search results container with the response HTML
        setSubtotal(data.message)

    },
    error: (error) => {
        console.log(JSON.stringify(error));
    }
});

function setSubtotal(value) {
    const formatter = new Intl.NumberFormat('en-US', { style: 'currency', currency: 'USD', minimumFractionDigits: 2 });
    const formattedNumber = formatter.format(value);
    subtotal.textContent = formattedNumber;
    subtotalSidebar.textContent = formattedNumber;
}


function updateNumberElement(group) {
    var numberElement = document.getElementById('number-' + group);
    numberElement.innerText = numbers[group];
}

const pageItemsDecrement = document.querySelectorAll('.page-link-decrement');
const pageItemsIncrement = document.querySelectorAll('.page-link-increment');
const pageItemsQuantity = document.querySelectorAll('.page-link-quantity');

const badgeTotal = document.querySelectorAll('.badge-total');

// Add click event listener to each button
pageItemsDecrement.forEach(function (button) {

    button.addEventListener('click', function (event) {
        // Get the value of the clicked button
        const itemId = event.target.value;
        // Display the value in the console window

        decrementQuantity(itemId);

    });
});

function updateTotal(total, itemId) {
    badgeTotal.forEach(function (button) {


        if (button.dataset.value === itemId) {

            const formatter = new Intl.NumberFormat('en-US', { style: 'currency', currency: 'USD', minimumFractionDigits: 2 });
            const formattedNumber = formatter.format(total);
            button.textContent = formattedNumber;
        }


    });
}


pageItemsIncrement.forEach(function (button) {

    button.addEventListener('click', function (event) {
        // Get the value of the clicked button
        const itemId = event.target.value;
        // Display the value in the console window
        console.info(itemId)

        incrementQuantity(itemId);


    });
});

function updateQuantity(quantity, itemId) {
    pageItemsQuantity.forEach(function (button) {
        console.info(button.value)
        if (button.value === itemId) {
            button.textContent = quantity;
        }
    });
}

function incrementQuantity(itemId) {
    $.ajax({
        url: "/JPetStore_war/cart",
        type: "POST",
        data: {
            purpose: "INCREMENT",
            itemId: itemId
        },
        dataType: "json",

        success: function (data) {
            // Update the search results container with the response HTML
            console.info(data)
            updateQuantity(data.message, data.itemId)
            updateTotal(data.total, data.itemId)
            setSubtotal(data.subTotal)


        },
        error: (error) => {
            console.log(JSON.stringify(error));
        }
    });
}

function decrementQuantity(itemId) {
    $.ajax({
        url: "/JPetStore_war/cart",
        type: "POST",
        data: {
            purpose: "DECREMENT",
            itemId: itemId
        },
        dataType: "text",

        success: function (data) {
            // Update the search results container with the response HTML
            updateQuantity(data.message, data.itemId)
            updateTotal(data.total, data.itemId)

        },
        error: (error) => {
            console.log(JSON.stringify(error));
        }
    });
}


const loginButtonTwo = document.getElementById('loginButton');

if (loginButtonTwo) {
    loginButtonTwo.addEventListener('click', function() {
        const contextPath = window.location.pathname.substring(0, window.location.pathname.indexOf("/", 1));
        console.log(contextPath);
        window.location.href=contextPath + '/login'

    });
}