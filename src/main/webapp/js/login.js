// (() => {
//     'use strict'
//
//     // Fetch all the forms we want to apply custom Bootstrap validation styles to
//     const forms = document.querySelectorAll('.needs-validation')
//
//     // Loop over them and prevent submission
//     Array.from(forms).forEach(form => {
//         form.addEventListener('submit', event => {
//             if (!form.checkValidity()) {
//                 event.preventDefault()
//                 event.stopPropagation()
//             }
//
//
//             form.classList.add('was-validated')
//         }, false)
//     })
// })()

const usernameInput = document.getElementById("floatingUsername");
const passwordInput = document.getElementById("floatingPassword");
const captchaInput = document.getElementById("floatingCaptcha");
const form = document.getElementById("form-login");

const formUsername = document.getElementById("form-username")

captchaInput.addEventListener("input", function () {
    captchaInput.classList.remove("is-invalid")
});

usernameInput.addEventListener("input", function () {
    usernameInput.classList.remove("is-invalid")
});

passwordInput.addEventListener("input", function () {
    passwordInput.classList.remove("is-invalid")
});

$(document).ready(function () {
    // Handle form submission
    $("#form-login").submit(function (event) {
        // Prevent the default form submission
        event.preventDefault()
        event.stopPropagation()

        if (!this.checkValidity()) {

        } else {


            const username = usernameInput.value;
            const password = passwordInput.value;
            const answer = captchaInput.value;


            $.ajax({
                url: "/JPetStore_war/login",
                type: "POST",
                data: {
                    username: username,
                    password: password,
                    answer: answer
                },
                dataType: "json",

                success: function (data, textStatus) {
                    console.log(data)
                    if (data.redirect) {
                        // data.redirect contains the string URL to redirect to
                        window.location.href = data.redirect;
                    } else if (data.message === "WRONG_CAPTCHA") {
                        //form.classList.remove('was-validated')
                        captchaInput.classList.add("is-invalid")


                    } else if (data.message === "WRONG_CREDENTIALS") {
                        usernameInput.classList.add("is-invalid")
                        passwordInput.classList.add("is-invalid")
                    }


                },
                error: (error) => {
                    console.log(JSON.stringify(error));
                }
            });
        }

        //this.classList.add('was-validated')




    });
});