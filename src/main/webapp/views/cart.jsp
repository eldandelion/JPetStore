<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: daniel
  Date: 2023/11/7
  Time: 16:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=2">
    <title>JPetStore Cart</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/cart.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/sidebars.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          type="text/css"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<body>

<main class="d-flex flex-nowrap">
    <svg xmlns="http://www.w3.org/2000/svg" class="d-none">
        <symbol id="home" viewBox="0 0 16 16">
            <path d="M8.354 1.146a.5.5 0 0 0-.708 0l-6 6A.5.5 0 0 0 1.5 7.5v7a.5.5 0 0 0 .5.5h4.5a.5.5 0 0 0 .5-.5v-4h2v4a.5.5 0 0 0 .5.5H14a.5.5 0 0 0 .5-.5v-7a.5.5 0 0 0-.146-.354L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.354 1.146zM2.5 14V7.707l5.5-5.5 5.5 5.5V14H10v-4a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5v4H2.5z"/>
        </symbol>


        <symbol id="cart" viewBox="0 0 16 16">
            <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
        </symbol>

        <symbol id="store" viewBox="0 0 16 16">
            <path d="M8 1a2.5 2.5 0 0 1 2.5 2.5V4h-5v-.5A2.5 2.5 0 0 1 8 1zm3.5 3v-.5a3.5 3.5 0 1 0-7 0V4H1v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4h-3.5z"/>
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

                    <button class="btn btn-outline-secondary rounded-5 m-1" type="button" id="button-home"
                            onclick="window.location.href='${pageContext.request.contextPath}/home'">
                        <svg class="bi pe-none me-2" width="16" height="16">
                            <use xlink:href="#home"/>
                        </svg>
                        Home</a>
                    </button>

                    <button class="btn btn-outline-secondary rounded-5 m-1" type="button" id="button-store"
                            onclick="window.location.href='${pageContext.request.contextPath}/store'">
                        <svg class="bi pe-none me-2" width="16" height="16">
                            <use xlink:href="#store"/>
                        </svg>
                        Store</a>
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

                <span class="badge d-flex align-items-center ms-4 p-1 pe-2 text-primary-emphasis bg-primary-subtle border border-primary-subtle rounded-pill">

            <div class="dropdown">
                <a href="#"
                   class="d-flex align-items-center link-body-emphasis text-decoration-none dropdown-toggle "
                   data-bs-toggle="dropdown" aria-expanded="false">
                     <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-person-circle me-2" viewBox="0 0 16 16">
  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
  <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
</svg>
                    Log In
                </a>
                <ul class="dropdown-menu dropdown-menu-dark text-small shadow">
                    <li><a class="dropdown-item" href="#">Settings</a></li>
                    <li><a class="dropdown-item" onclick="window.location.href='${pageContext.request.contextPath}/profile'">Profile</a></li>
                    <li>
                        <hr class="dropdown-divider">
                    </li>
                    <li><a class="dropdown-item" href="#">Sign out</a></li>
                </ul>
            </div>
            </span>
            </div>


        </div>
    </nav>

    <div class="container container-fluid mx-auto scrollarea pt-5" id="container-main">
        <div class="row mt-1 mx-auto">
            <div class="col-md-5 w-100 ps-5 pe-5 col-lg-4 order-md-last mx-auto">
                <h4 class="d-flex justify-content-between align-items-center mb-3">
                    <span class="display-2 h2-category-name" id="text-your-cart">Your cart</span>
                    <span class="badge bg-primary p-3 ps-3 pe-3 rounded-pill" id="badge-counter">3</span>
                </h4>


                <div class="container" id="container-items-list">
                    <div class="row m-2 p-2" id="list-heading">
                        <div class="col-4 text-uppercase">
                            <strong>Product details</strong>
                        </div>
                        <div class="col-3 text-center text-uppercase">
                            <strong>Quantity</strong>
                        </div>
                        <div class="col-3 text-center text-uppercase">
                            <strong>Price</strong>
                        </div>
                        <div class="col-2 text-end text-uppercase">
                            <strong>Total</strong>
                        </div>

                    </div>



                    <div class="row m-2 ps-2 pe-2">
                        <hr>
                        <div class="col-4">
                            <div class="container p-0 m-0">
                                <div class="row">
                                    <div class="col-6">
                                        <svg class="bd-placeholder-img rounded-circle" width="100" height="100"
                                             xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder"
                                             preserveAspectRatio="xMidYMid slice" focusable="false">
                                            <title>Placeholder</title>
                                            <rect width="100%" height="100%" fill="var(--bs-secondary-color)"/>
                                        </svg>
                                    </div>
                                    <div class="col-6">
                                        <div class="container p-0 m-0">
                                            <div class="row">
                                                <div class="col-12 d-flex flex-column justify-content-center">
                                                    <h6 class="my-0">Product name</h6>
                                                    <small class="text-body-secondary">Brief description</small>
                                                    <small class="text-body-secondary">Product ID: 3124241</small>
                                                    <small class="text-body-secondary">Item ID: 3124241</small>
                                                    <small class="text-body-secondary" id="text-remove">Remove</small>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-3 d-flex justify-content-center">
                            <ul class="pagination">
                                <li class="page-item"><a class="page-link" href="#" onclick="decrementNumber()">-</a></li>
                                <li class="page-item"><a class="page-link" href="#">1</a></li>
                                <li class="page-item"><a class="page-link" href="#" onclick="incrementNumber()">+</a></li>
                            </ul>
                        </div>

                        <div class="col-3 d-flex justify-content-center">
                            <ul class="pagination">
                                <li class="page-item"><a class="page-link" href="#" onclick="decrementNumber('group${group.id}')">-</a></li>
                                <li class="page-item"><a id="number-group${group.id}" class="page-link" href="#">${group.counter}</a></li>
                                <li class="page-item"><a class="page-link" href="#" onclick="incrementNumber('group${group.id}')">+</a></li>
                            </ul>
                        </div>
                        <div class="col-3 text-center">
                            <span class="badge rounded-pill badge-counter">12$</span>
                        </div>
                        <div class="col-2 text-end">
                            <span class="badge rounded-pill badge-counter">12$</span>
                        </div>
                    </div>







                    <div class="row p-2 ms-2 me-2" id="list-bottom">
                        <hr>
                        <div class="col-6">
                            <span>Total (USD)</span>


                        </div>
                        <div class="col-6 text-end">
                            <strong>$20</strong>

                        </div>

                    </div>


                </div>


            </div>
        </div>

        <footer class="text-body-secondary mt-5 text-center text-small">
            <p class="mb-1">&copy; 2023–2023 JPetStore, Developed by Daniel and 蔡雅韵</p>
            <ul class="list-inline">
                <li class="list-inline-item"><a href="#">Privacy</a></li>
                <li class="list-inline-item"><a href="#">Terms</a></li>
                <li class="list-inline-item"><a href="#">Support</a></li>
            </ul>
        </footer>

    </div>


    <div class="d-flex flex-column flex-shrink-0 p-3" id="sidebar-summary">

        <strong id="text-items" class="h5 text-muted mt-1 mb-0">Order Summary</strong>
        <hr>

        <div class="container m-2">

            <div class="row me-2">
                <div class="col-6">
                    <span class="text-body-secondary text-uppercase">Items 3</span>
                </div>
                <div class="col-6 text-end">
                    <span class="text-body-secondary text-uppercase">432$</span>
                </div>

            </div>

            <div class="row mt-3">
                <div class="col-12">
                    <span class="text-body-secondary text-uppercase">Shipping address</span>
                </div>

            </div>

            <div class="row mt-3 me-2">

                <select class="form-select" aria-label="Address">
                    <option selected value="1">One</option>
                    <option value="2">Two</option>
                </select>
            </div>
        </div>





        <div class="flex-grow-1"></div>

        <button class="w-100 btn btn-primary btn-lg mt-5 mb-2 rounded-5 text-uppercase" id="buttonSubmit" type="submit">Checkout
        </button>


    </div>

</main>


</body>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/js/cart.js"></script>
</html>
