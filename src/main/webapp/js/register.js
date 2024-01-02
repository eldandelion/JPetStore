// Get the form and submit button elements
const form = document.getElementById('registration-form');
const submitButton = document.getElementById('buttonSubmit');

const firstNameInput = document.getElementById('firstName');
const lastNameInput = document.getElementById('lastName');

const passwordInput = document.getElementById('password');
const confirmPasswordInput = document.getElementById('confirm-password');

const username = document.getElementById('username');

// Add click event listener to the submit button

firstNameInput.addEventListener('input', () => {
    if (!/^[a-zA-Z]+$/.test(firstNameInput.value)) {

        firstNameInput.classList.remove('is-valid'); // Add "is-invalid" class to show validation error
        firstNameInput.classList.add('is-invalid');
    } else {
        firstNameInput.classList.remove('is-invalid'); // Remove "is-invalid" class if valid
    }
})

lastNameInput.addEventListener('input', () => {
    if (!/^[a-zA-Z]+$/.test(lastNameInput.value)) {

        lastNameInput.classList.remove('is-valid');
        lastNameInput.classList.add('is-invalid'); // Add "is-invalid" class to show validation error
    } else {
        lastNameInput.classList.remove('is-invalid'); // Remove "is-invalid" class if valid
    }
})

confirmPasswordInput.addEventListener('input', () => {
    if (passwordInput.value !== confirmPasswordInput.value) {
        event.preventDefault(); // Prevent form submission
        confirmPasswordInput.classList.add('is-invalid'); // Add "is-invalid" class to show validation error
    } else {
        confirmPasswordInput.classList.remove('is-invalid'); // Remove "is-invalid" class if valid
    }
})

username.addEventListener('input', () => {

})



$(document).ready(function () {
    // Handle form submission
    $("#registration-form").submit(function (event) {
        // Prevent the default form submission
        event.preventDefault()
        event.stopPropagation()

        if (!this.checkValidity()) {

        } else {
            // Check if the first name contains symbols other than letters
            if (!/^[a-zA-Z]+$/.test(firstNameInput.value)) {
                console.info('removed')

                firstNameInput.classList.remove('is-valid'); // Add "is-invalid" class to show validation error
                firstNameInput.classList.add('is-invalid');
            } else {
                firstNameInput.classList.remove('is-invalid'); // Remove "is-invalid" class if valid
            }

            // Check if the last name contains symbols other than letters
            if (!/^[a-zA-Z]+$/.test(lastNameInput.value)) {

                lastNameInput.classList.remove('is-valid');
                lastNameInput.classList.add('is-invalid'); // Add "is-invalid" class to show validation error
            } else {
                lastNameInput.classList.remove('is-invalid'); // Remove "is-invalid" class if valid
            }


        }

       // this.classList.add('was-validated')
    })
})
