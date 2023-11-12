<%--
  Created by IntelliJ IDEA.
  User: daniel
  Date: 2023/11/1
  Time: 11:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=2">
    <title>JPetStore Home</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/register.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<body>

<main class="d-flex flex-nowrap">


    <svg xmlns="http://www.w3.org/2000/svg" class="d-none">
        <symbol id="home" viewBox="0 0 16 16">
            <path d="M8.354 1.146a.5.5 0 0 0-.708 0l-6 6A.5.5 0 0 0 1.5 7.5v7a.5.5 0 0 0 .5.5h4.5a.5.5 0 0 0 .5-.5v-4h2v4a.5.5 0 0 0 .5.5H14a.5.5 0 0 0 .5-.5v-7a.5.5 0 0 0-.146-.354L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.354 1.146zM2.5 14V7.707l5.5-5.5 5.5 5.5V14H10v-4a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5v4H2.5z"/>
        </symbol>
    </svg>

    <nav class="navbar navbar-expand-xl fixed-top shadow-sm">
        <div class="container-fluid">
            <img src="${pageContext.request.contextPath}/images/jpetstore.png" alt="" width="32" height="32"
                 class="me-2">

            <a class="navbar-brand mb-0 h1" href="#">JPetStore</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav align-content-end me-auto mb-2 mb-lg-0">

                    <button class="btn btn-outline-secondary rounded-5 m-1" type="button" id="button-cart"
                            onclick="window.location.href='${pageContext.request.contextPath}/home'">
                        <svg class="bi pe-none me-2" width="16" height="16">
                            <use xlink:href="#home"/>
                        </svg>
                        Home</a>
                    </button>


                </ul>


                <div class="dropdown">
                    <a href="#"
                       class="d-flex align-items-center link-dark rounded-5 text-decoration-none dropdown-toggle"
                       data-bs-toggle="dropdown" aria-expanded="false">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                             class="bi bi-globe-americas me-2" viewBox="0 0 16 16">
                            <path d="M8 0a8 8 0 1 0 0 16A8 8 0 0 0 8 0ZM2.04 4.326c.325 1.329 2.532 2.54 3.717 3.19.48.263.793.434.743.484-.08.08-.162.158-.242.234-.416.396-.787.749-.758 1.266.035.634.618.824 1.214 1.017.577.188 1.168.38 1.286.983.082.417-.075.988-.22 1.52-.215.782-.406 1.48.22 1.48 1.5-.5 3.798-3.186 4-5 .138-1.243-2-2-3.5-2.5-.478-.16-.755.081-.99.284-.172.15-.322.279-.51.216-.445-.148-2.5-2-1.5-2.5.78-.39.952-.171 1.227.182.078.099.163.208.273.318.609.304.662-.132.723-.633.039-.322.081-.671.277-.867.434-.434 1.265-.791 2.028-1.12.712-.306 1.365-.587 1.579-.88A7 7 0 1 1 2.04 4.327Z"/>
                        </svg>
                        English
                    </a>
                    <ul class="dropdown-menu dropdown-menu-dark text-small shadow">
                        <li><a class="dropdown-item" href="#">English</a></li>
                        <li><a class="dropdown-item" href="#">汉语</a></li>
                    </ul>
                </div>
            </div>


        </div>
    </nav>

    <div class="container w-75" id="container-form">
        <main>
            <div class="py-5 text-center">
                <img class="d-block mx-auto mb-4" src="${pageContext.request.contextPath}/images/jpetstore.png" alt=""
                     width="57" height="57">
                <h2>Registration form</h2>
                <p class="lead">Please input all the data carefully</p>
            </div>

            <div class="row">

                <div class="col-md-7 col-lg-8 mx-auto">
                    <h4 class="mb-3">Account information</h4>
                    <form class="needs-validation" novalidate>


                        <div class="row g-3">
                            <div class="col-12">
                                <label for="username" class="form-label">User ID</label>
                                <div class="input-group has-validation">
                                    <input type="text" class="form-control" id="user-id" placeholder="123456"
                                           required>
                                    <div class="invalid-feedback">
                                        Your id is required.
                                    </div>
                                </div>
                            </div>

                            <div class="col-sm-6">
                                <label for="firstName" class="form-label">First name</label>
                                <input type="text" class="form-control" id="firstName" placeholder="Jake" value=""
                                       required>
                                <div class="invalid-feedback">
                                    Valid first name is required.
                                </div>
                            </div>

                            <div class="col-sm-6">
                                <label for="lastName" class="form-label">Last name</label>
                                <input type="text" class="form-control" id="lastName" placeholder="Paul" value=""
                                       required>
                                <div class="invalid-feedback">
                                    Valid last name is required.
                                </div>
                            </div>

                            <div class="col-12">
                                <label for="username" class="form-label">Username</label>
                                <div class="input-group has-validation">
                                    <span class="input-group-text">@</span>
                                    <input type="text" class="form-control" id="username" placeholder="Username"
                                           required>
                                    <div class="invalid-feedback">
                                        Your username is required.
                                    </div>
                                </div>
                            </div>

                            <div class="col-12">
                                <label for="username" class="form-label">Password</label>
                                <div class="input-group has-validation">
                                    <input type="text" class="form-control" id="password" placeholder="Password"
                                           required>
                                    <div class="invalid-feedback">
                                        Your password is required.
                                    </div>
                                </div>
                            </div>

                            <div class="col-12">
                                <label for="username" class="form-label">Confirm password</label>
                                <div class="input-group has-validation">
                                    <input type="text" class="form-control" id="confirm-password" placeholder="Password"
                                           required>
                                    <div class="invalid-feedback">
                                        Password is not the same.
                                    </div>
                                </div>
                            </div>


                            <div class="col-12">
                                <label for="email" class="form-label">Email <span
                                        class="text-body-secondary">(Optional)</span></label>
                                <input type="email" class="form-control" id="email" placeholder="you@example.com">
                                <div class="invalid-feedback">
                                    Please enter a valid email address for shipping updates.
                                </div>
                            </div>

                            <div class="col-12">
                                <label for="address" class="form-label">Address</label>
                                <input type="text" class="form-control" id="address" placeholder="1234 Main St"
                                       required>
                                <div class="invalid-feedback">
                                    Please enter your shipping address.
                                </div>
                            </div>

                            <div class="col-12">
                                <label for="address2" class="form-label">Address 2 <span class="text-body-secondary">(Optional)</span></label>
                                <input type="text" class="form-control" id="address2" placeholder="Apartment or suite">
                            </div>

                            <div class="col-md-5">
                                <label for="country" class="form-label">Country</label>
                                <select class="form-select" id="country" required>
                                    <option value="">Choose...</option>
                                    <option>United States</option>
                                </select>
                                <div class="invalid-feedback">
                                    Please select a valid country.
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label for="state" class="form-label">State</label>
                                <select class="form-select" id="state" required>
                                    <option value="">Choose...</option>
                                    <option>California</option>
                                </select>
                                <div class="invalid-feedback">
                                    Please provide a valid state.
                                </div>
                            </div>

                            <div class="col-md-3">
                                <label for="zip" class="form-label">Zip</label>
                                <input type="text" class="form-control" id="zip" placeholder="" required>
                                <div class="invalid-feedback">
                                    Zip code required.
                                </div>
                            </div>
                        </div>


                        <hr class="my-4">

                        <h4 class="mb-3">Profile Information</h4>

                        <div class="row g-3">

                            <div class="col-md-4">
                                <label for="state" class="form-label">Language preference</label>
                                <select class="form-select" id="language-preference" required>
                                    <option value="">Choose...</option>
                                    <option>English</option>
                                    <option>Chinese</option>
                                </select>
                                <div class="invalid-feedback">
                                    Please provide a language preference.
                                </div>
                            </div>
                            <div class="col-md-8">
                                <label for="state" class="form-label">Favorite category</label>
                                <select class="form-select" id="favorite-category" required>
                                    <option value="">Choose...</option>
                                    <option>Fish</option>
                                    <option>Dogs</option>
                                    <option>Reptiles</option>
                                    <option>Cats</option>
                                    <option>Birds</option>
                                </select>
                                <div class="invalid-feedback">
                                    Please provide a favorite category.
                                </div>
                            </div>


                        </div>

                        <div class="form-check mt-2">
                            <input type="checkbox" class="form-check-input" id="enable-mylist">
                            <label class="form-check-label" for="enable-mylist">Enable MyList</label>
                        </div>


                        <div class="form-check mt-2">
                            <input type="checkbox" class="form-check-input" id="enable-mybanner">
                            <label class="form-check-label" for="enable-mybanner">Enable MyBanner</label>
                        </div>

                        <div class="container d-flex m-0 p-0 align-content-center justify-content-center">
                            <img src="${pageContext.request.contextPath}/stickyImg"/>
                        </div>

                        <div class="mt-2 mb-4">

                            <label for="username" class="form-label">Captcha</label>
                            <div class="input-group has-validation">
                                <input type="text" class="form-control" id="captcha" placeholder="Captcha" name="answer"
                                       required>
                                <div class="invalid-feedback">
                                    Please enter correct captcha.
                                </div>
                            </div>
                        </div>


                        <hr class="my-4">

                        <button class="w-100 btn mb-5 btn-primary btn-lg rounded-5" id="buttonSubmit" type="submit">
                            Continue
                        </button>
                    </form>
                </div>
            </div>
        </main>


    </div>
</main>

<footer class="pb-2 text-body-secondary text-center text-small">
    <p class="mb-1">&copy; 2023–2023 JPetStore, Created by Daniel and 蔡雅韵</p>
    <ul class="list-inline">
        <li class="list-inline-item"><a href="#">Privacy</a></li>
        <li class="list-inline-item"><a href="#">Terms</a></li>
        <li class="list-inline-item"><a href="#">Support</a></li>
    </ul>
</footer>
<script src="../assets/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
