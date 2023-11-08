<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=2">
    <title>JPetStore Store</title>

    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          type="text/css"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/sidebars.css">
</head>

<body>
<nav class="navbar navbar-expand-xl fixed-top shadow-sm">
    <div class="container-fluid">
        <img src="${pageContext.request.contextPath}/images/jpetstore.png" alt="" width="32" height="32" class="me-2">

        <a class="navbar-brand mb-0 h1" href="#">JPetStore</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <button class="btn btn-outline-secondary rounded-5 m-1" type="button" id="button-home"
                        onclick="window.location.href='${pageContext.request.contextPath}/home'">
                    <svg class="bi pe-none me-2" width="16" height="16">
                        <use xlink:href="#home"/>
                    </svg>
                    Home</a>
                </button>


                <button class="btn btn-outline-secondary rounded-5 m-1" type="submit" id="button-cart"
                        onclick="window.location.href='${pageContext.request.contextPath}/cart'">
                    <svg class="bi pe-none me-2" width="16" height="16">
                        <use xlink:href="#cart"/>
                    </svg>
                    Cart</a>
                    <span class="badge rounded-pill ms-2 badge-counter">0</span>
                </button>


            </ul>

            <form class="d-flex" role="search">
                <div class="input-group me-2">
                    <input type="text" class="form-control rounded-start-5 search-input" placeholder="Search"
                           aria-label="Search" aria-describedby="button-addon2">
                    <button class="btn btn-outline-secondary rounded-end-5" type="submit" id="button-search">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                             class="bi bi-search" viewBox="0 0 16 16">
                            <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                        </svg>
                    </button>
                </div>
            </form>
            <div class="dropdown">
                <a href="#" class="d-flex align-items-center link-dark rounded-5 text-decoration-none dropdown-toggle"
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

<main class="d-flex flex-nowrap">

    <svg xmlns="http://www.w3.org/2000/svg" class="d-none">
        <symbol id="home" viewBox="0 0 16 16">
            <path d="M8.354 1.146a.5.5 0 0 0-.708 0l-6 6A.5.5 0 0 0 1.5 7.5v7a.5.5 0 0 0 .5.5h4.5a.5.5 0 0 0 .5-.5v-4h2v4a.5.5 0 0 0 .5.5H14a.5.5 0 0 0 .5-.5v-7a.5.5 0 0 0-.146-.354L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.354 1.146zM2.5 14V7.707l5.5-5.5 5.5 5.5V14H10v-4a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5v4H2.5z"/>
        </symbol>


        <symbol id="cart" viewBox="0 0 16 16">
            <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
        </symbol>
    </svg>


    <div id="sidebar" class="d-flex flex-column flex-shrink-0 p-3 sidebar">

        <ul class="nav nav-pills flex-column mb-auto">
            <strong id="text-items" class="h5 text-muted">Categories</strong>
            <li class="nav-item">
                <a href="#container-fish" class="nav-link rounded-4 link-body-emphasis active" aria-current="page">
                    <div class="row justify-content-between align-items-center">
                        <div class="col-auto name">
                            <img src="${pageContext.request.contextPath}/images/fish.png" alt="" width="22" height="22"
                                 class="me-2">
                            Fish
                        </div>
                        <div class="col-auto badge-col">
                            <span class="badge rounded-pill badge-counter">5</span>
                        </div>
                    </div>


                </a>
            </li>
            <li class="nav-item">
                <a href="#container-dogs" class="nav-link rounded-4 link-body-emphasis">
                    <div class="row justify-content-between align-items-center">
                        <div class="col-auto name">
                            <img src="${pageContext.request.contextPath}/images/paws.png" alt="" width="22" height="22"
                                 class="me-2">
                            Dogs
                        </div>
                        <div class="col-auto badge-col">
                            <span class="badge rounded-pill badge-counter">5</span>
                        </div>
                    </div>

                </a>
            </li>
            <li>
                <a href="#container-cats" class="nav-link rounded-4 link-body-emphasis">
                    <div class="row justify-content-between align-items-center">
                        <div class="col-auto name">
                            <img src="${pageContext.request.contextPath}/images/cats.png" alt="" width="22" height="22"
                                 class="me-2">
                            Cats
                        </div>
                        <div class="col-auto badge-col">
                            <span class="badge rounded-pill badge-counter">5</span>
                        </div>
                    </div>
                </a>
            </li>
            <li>
                <a href="#container-reptiles" class="nav-link rounded-4 link-body-emphasis">
                    <div class="row justify-content-between align-items-center">
                        <div class="col-auto name">
                            <img src="${pageContext.request.contextPath}/images/reptiles.png" alt="" width="22"
                                 height="22" class="me-2">
                            Reptiles
                        </div>
                        <div class="col-auto badge-col">
                            <span class="badge rounded-pill badge-counter">5</span>
                        </div>
                    </div>

                </a>
            </li>
            <li>
                <a href="#container-birds" class="nav-link rounded-4 link-body-emphasis">
                    <div class="row justify-content-between align-items-center">
                        <div class="col-auto name">
                            <img src="${pageContext.request.contextPath}/images/birds.png" alt="" width="22" height="22"
                                 class="me-2">
                            Birds
                        </div>
                        <div class="col-auto badge-col">
                            <span class="badge rounded-pill badge-counter">5</span>
                        </div>
                    </div>
                </a>

            </li>
        </ul>
        <hr>
        <div class="dropdown">
            <a href="#" class="d-flex align-items-center link-body-emphasis text-decoration-none dropdown-toggle"
               data-bs-toggle="dropdown" aria-expanded="false">
                <img src="https://github.com/mdo.png" alt="" width="32" height="32" class="rounded-circle me-2">
                <strong>Log In</strong>
            </a>
            <ul class="dropdown-menu dropdown-menu-dark text-small shadow">
                <li><a class="dropdown-item" href="#">Settings</a></li>
                <li><a class="dropdown-item" href="#">Profile</a></li>
                <li>
                    <hr class="dropdown-divider">
                </li>
                <li><a class="dropdown-item" href="#">Sign out</a></li>
            </ul>
        </div>
    </div>

    <div data-bs-spy="scroll" data-target="#sidebar" id="album-categories" data-bs-smooth-scroll="true"
         class="album py-5 px-4 bg-body-tertiary">

        <div class="container" id="container-fish">

            <div class="row justify-content-between align-items-center">
                <div class="col-auto">
                    <h1 id="scrollspyHeadingFish" class="display-1 h1-category-name">Fish</h1>
                </div>
                <div class="col-auto" id="col-category-fish">
                    <img width="180" height="120" class="me-2"
                         src="${pageContext.request.contextPath}/images/fish%20illustration.png">
                </div>
            </div>


            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-4 g-3 card-row">
                <div class="col">
                    <div class="card shadow-sm">
                        <svg class="bd-placeholder-img card-img-top" width="100%" height="225"
                             xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail"
                             preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title>
                            <rect width="100%" height="100%" fill="#55595c"/>
                            <text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text>
                        </svg>
                        <div class="card-body">
                            <p class="card-text">Fishy fish</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-sm btn-outline-secondary rounded-start-4">
                                        View
                                    </button>
                                    <button type="button"
                                            class="btn btn-sm btn-outline-secondary rounded-end-4 btn-purchase"
                                            id="btn-purchase">Purchase
                                    </button>
                                </div>
                                <span class="badge rounded-pill p-2">14 元</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card shadow-sm">
                        <svg class="bd-placeholder-img card-img-top" width="100%" height="225"
                             xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail"
                             preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title>
                            <rect width="100%" height="100%" fill="#55595c"/>
                            <text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text>
                        </svg>
                        <div class="card-body">
                            <p class="card-text">Fishy fish</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-sm btn-outline-secondary rounded-start-4">
                                        View
                                    </button>
                                    <button type="button" class="btn btn-sm btn-outline-secondary rounded-end-4 btn-purchase">Get
                                    </button>
                                </div>
                                <span class="badge rounded-pill p-2">14 元</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card shadow-sm">
                        <svg class="bd-placeholder-img card-img-top" width="100%" height="225"
                             xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail"
                             preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title>
                            <rect width="100%" height="100%" fill="#55595c"/>
                            <text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text>
                        </svg>
                        <div class="card-body">
                            <p class="card-text">Fishy fish</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-sm btn-outline-secondary rounded-start-4">
                                        View
                                    </button>
                                    <button type="button" class="btn btn-sm btn-outline-secondary rounded-end-4">Get
                                    </button>
                                </div>
                                <span class="badge rounded-pill p-2">14 元</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card shadow-sm">
                        <svg class="bd-placeholder-img card-img-top" width="100%" height="225"
                             xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail"
                             preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title>
                            <rect width="100%" height="100%" fill="#55595c"/>
                            <text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text>
                        </svg>
                        <div class="card-body">
                            <p class="card-text">Fishy fish</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-sm btn-outline-secondary rounded-start-4">
                                        View
                                    </button>
                                    <button type="button" class="btn btn-sm btn-outline-secondary rounded-end-4">Get
                                    </button>
                                </div>
                                <span class="badge rounded-pill p-2">14 元</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card shadow-sm">
                        <svg class="bd-placeholder-img card-img-top" width="100%" height="225"
                             xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail"
                             preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title>
                            <rect width="100%" height="100%" fill="#55595c"/>
                            <text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text>
                        </svg>
                        <div class="card-body">
                            <p class="card-text">Fishy fish</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-sm btn-outline-secondary rounded-start-4">
                                        View
                                    </button>
                                    <button type="button" class="btn btn-sm btn-outline-secondary rounded-end-4">Get
                                    </button>
                                </div>
                                <span class="badge rounded-pill p-2">14 元</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container" id="container-dogs">

            <div class="row justify-content-between align-items-center">
                <div class="col-auto">
                    <h1 id="scrollspyHeadingDogs" class="display-1 h1-category-name">Dogs</h1>
                </div>
                <div class="col-auto" id="col-category-dog">
                    <img width="180" height="120" class="me-1"
                         src="${pageContext.request.contextPath}/images/dog%20illustration.png">
                </div>
            </div>

            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-4 g-3 card-row">
                <div class="col">
                    <div class="card shadow-sm">
                        <svg class="bd-placeholder-img card-img-top" width="100%" height="225"
                             xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail"
                             preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title>
                            <rect width="100%" height="100%" fill="#55595c"/>
                            <text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text>
                        </svg>
                        <div class="card-body">
                            <p class="card-text">Fishy fish</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-sm btn-outline-secondary rounded-start-4">
                                        View
                                    </button>
                                    <button type="button" class="btn btn-sm btn-outline-secondary rounded-end-4">Get
                                    </button>
                                </div>
                                <span class="badge rounded-pill p-2">14 元</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card shadow-sm">
                        <svg class="bd-placeholder-img card-img-top" width="100%" height="225"
                             xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail"
                             preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title>
                            <rect width="100%" height="100%" fill="#55595c"/>
                            <text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text>
                        </svg>
                        <div class="card-body">
                            <p class="card-text">Fishy fish</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-sm btn-outline-secondary rounded-start-4">
                                        View
                                    </button>
                                    <button type="button" class="btn btn-sm btn-outline-secondary rounded-end-4">Get
                                    </button>
                                </div>
                                <span class="badge rounded-pill p-2">14 元</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card shadow-sm">
                        <svg class="bd-placeholder-img card-img-top" width="100%" height="225"
                             xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail"
                             preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title>
                            <rect width="100%" height="100%" fill="#55595c"/>
                            <text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text>
                        </svg>
                        <div class="card-body">
                            <p class="card-text">Fishy fish</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-sm btn-outline-secondary rounded-start-4">
                                        View
                                    </button>
                                    <button type="button" class="btn btn-sm btn-outline-secondary rounded-end-4">Get
                                    </button>
                                </div>
                                <span class="badge rounded-pill p-2">14 元</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card shadow-sm">
                        <svg class="bd-placeholder-img card-img-top" width="100%" height="225"
                             xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail"
                             preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title>
                            <rect width="100%" height="100%" fill="#55595c"/>
                            <text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text>
                        </svg>
                        <div class="card-body">
                            <p class="card-text">Fishy fish</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-sm btn-outline-secondary rounded-start-4">
                                        View
                                    </button>
                                    <button type="button" class="btn btn-sm btn-outline-secondary rounded-end-4">Get
                                    </button>
                                </div>
                                <span class="badge rounded-pill p-2">14 元</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card shadow-sm">
                        <svg class="bd-placeholder-img card-img-top" width="100%" height="225"
                             xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail"
                             preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title>
                            <rect width="100%" height="100%" fill="#55595c"/>
                            <text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text>
                        </svg>
                        <div class="card-body">
                            <p class="card-text">Fishy fish</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-sm btn-outline-secondary rounded-start-4">
                                        View
                                    </button>
                                    <button type="button" class="btn btn-sm btn-outline-secondary rounded-end-4">Get
                                    </button>
                                </div>
                                <span class="badge rounded-pill p-2">14 元</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="container" id="container-cats">

            <div class="row justify-content-between align-items-center">
                <div class="col-auto">
                    <h1 id="scrollspyHeadingCats" class="display-1 h1-category-name">Cats</h1>
                </div>
                <div class="col-auto" id="col-category-cat">
                    <img id="cat-image" width="100" height="100" class="me-4"
                         src="${pageContext.request.contextPath}/images/cat%20illustration.png">
                </div>
            </div>

            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-4 g-3 card-row">
                <div class="col">
                    <div class="card shadow-sm">
                        <svg class="bd-placeholder-img card-img-top" width="100%" height="225"
                             xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail"
                             preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title>
                            <rect width="100%" height="100%" fill="#55595c"/>
                            <text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text>
                        </svg>
                        <div class="card-body">
                            <p class="card-text">Fishy fish</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-sm btn-outline-secondary rounded-start-4">
                                        View
                                    </button>
                                    <button type="button" class="btn btn-sm btn-outline-secondary rounded-end-4">Add To
                                        Cart
                                    </button>
                                </div>
                                <span class="badge rounded-pill p-2">14 元</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card shadow-sm">
                        <svg class="bd-placeholder-img card-img-top" width="100%" height="225"
                             xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail"
                             preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title>
                            <rect width="100%" height="100%" fill="#55595c"/>
                            <text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text>
                        </svg>
                        <div class="card-body">
                            <p class="card-text">Fishy fish</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-sm btn-outline-secondary rounded-start-4">
                                        View
                                    </button>
                                    <button type="button" class="btn btn-sm btn-outline-secondary rounded-end-4">Add To
                                        Cart
                                    </button>
                                </div>
                                <span class="badge rounded-pill p-2">14 元</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card shadow-sm">
                        <svg class="bd-placeholder-img card-img-top" width="100%" height="225"
                             xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail"
                             preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title>
                            <rect width="100%" height="100%" fill="#55595c"/>
                            <text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text>
                        </svg>
                        <div class="card-body">
                            <p class="card-text">Fishy fish</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-sm btn-outline-secondary rounded-start-4">
                                        View
                                    </button>
                                    <button type="button" class="btn btn-sm btn-outline-secondary rounded-end-4">Add To
                                        Cart
                                    </button>
                                </div>
                                <span class="badge rounded-pill p-2">14 元</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card shadow-sm">
                        <svg class="bd-placeholder-img card-img-top" width="100%" height="225"
                             xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail"
                             preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title>
                            <rect width="100%" height="100%" fill="#55595c"/>
                            <text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text>
                        </svg>
                        <div class="card-body">
                            <p class="card-text">Fishy fish</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-sm btn-outline-secondary rounded-start-4">
                                        View
                                    </button>
                                    <button type="button" class="btn btn-sm btn-outline-secondary rounded-end-4">Add To
                                        Cart
                                    </button>
                                </div>
                                <span class="badge rounded-pill p-2">14 元</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card shadow-sm">
                        <svg class="bd-placeholder-img card-img-top" width="100%" height="225"
                             xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail"
                             preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title>
                            <rect width="100%" height="100%" fill="#55595c"/>
                            <text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text>
                        </svg>
                        <div class="card-body">
                            <p class="card-text">Fishy fish</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-sm btn-outline-secondary rounded-start-4">
                                        View
                                    </button>
                                    <button type="button" class="btn btn-sm btn-outline-secondary rounded-end-4">Add To
                                        Cart
                                    </button>
                                </div>
                                <span class="badge rounded-pill p-2">14 元</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="container" id="container-reptiles">

            <div class="row justify-content-between align-items-center">
                <div class="col-auto">
                    <h1 id="scrollspyHeadingReptiles" class="display-1 h1-category-name">Reptiles</h1>
                </div>
                <div class="col-auto" id="col-category-reptile">
                    <img width="160" height="100" class="me-4 mt-3"
                         src="${pageContext.request.contextPath}/images/reptile%20illustration.png">
                </div>
            </div>

            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-4 g-3 card-row">
                <div class="col">
                    <div class="card shadow-sm">
                        <svg class="bd-placeholder-img card-img-top" width="100%" height="225"
                             xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail"
                             preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title>
                            <rect width="100%" height="100%" fill="#55595c"/>
                            <text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text>
                        </svg>
                        <div class="card-body">
                            <p class="card-text">Fishy fish</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-sm btn-outline-secondary rounded-start-4">
                                        View
                                    </button>
                                    <button type="button" class="btn btn-sm btn-outline-secondary rounded-end-4">Add To
                                        Cart
                                    </button>
                                </div>
                                <span class="badge rounded-pill p-2">14 元</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card shadow-sm">
                        <svg class="bd-placeholder-img card-img-top" width="100%" height="225"
                             xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail"
                             preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title>
                            <rect width="100%" height="100%" fill="#55595c"/>
                            <text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text>
                        </svg>
                        <div class="card-body">
                            <p class="card-text">Fishy fish</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-sm btn-outline-secondary rounded-start-4">
                                        View
                                    </button>
                                    <button type="button" class="btn btn-sm btn-outline-secondary rounded-end-4">Add To
                                        Cart
                                    </button>
                                </div>
                                <span class="badge rounded-pill p-2">14 元</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card shadow-sm">
                        <svg class="bd-placeholder-img card-img-top" width="100%" height="225"
                             xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail"
                             preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title>
                            <rect width="100%" height="100%" fill="#55595c"/>
                            <text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text>
                        </svg>
                        <div class="card-body">
                            <p class="card-text">Fishy fish</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-sm btn-outline-secondary rounded-start-4">
                                        View
                                    </button>
                                    <button type="button" class="btn btn-sm btn-outline-secondary rounded-end-4">Add To
                                        Cart
                                    </button>
                                </div>
                                <span class="badge rounded-pill p-2">14 元</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card shadow-sm">
                        <svg class="bd-placeholder-img card-img-top" width="100%" height="225"
                             xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail"
                             preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title>
                            <rect width="100%" height="100%" fill="#55595c"/>
                            <text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text>
                        </svg>
                        <div class="card-body">
                            <p class="card-text">Fishy fish</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-sm btn-outline-secondary rounded-start-4">
                                        View
                                    </button>
                                    <button type="button" class="btn btn-sm btn-outline-secondary rounded-end-4">Add To
                                        Cart
                                    </button>
                                </div>
                                <span class="badge rounded-pill p-2">14 元</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card shadow-sm">
                        <svg class="bd-placeholder-img card-img-top" width="100%" height="225"
                             xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail"
                             preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title>
                            <rect width="100%" height="100%" fill="#55595c"/>
                            <text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text>
                        </svg>
                        <div class="card-body">
                            <p class="card-text">Fishy fish</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-sm btn-outline-secondary rounded-start-4">
                                        View
                                    </button>
                                    <button type="button" class="btn btn-sm btn-outline-secondary rounded-end-4">Add To
                                        Cart
                                    </button>
                                </div>
                                <span class="badge rounded-pill p-2">14 元</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="container" id="container-birds">

            <div class="row justify-content-between align-items-center">
                <div class="col-auto">
                    <h1 id="scrollspyHeadingBirds" class="display-1 h1-category-name">Birds</h1>
                </div>
                <div class="col-auto" id="col-category-bird">
                    <img width="100" height="100" class="ms-5 me-4"
                         src="${pageContext.request.contextPath}/images/bird%20illustration.png">
                </div>
            </div>

            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-4 g-3 card-row">
                <div class="col">
                    <div class="card shadow-sm">
                        <svg class="bd-placeholder-img card-img-top" width="100%" height="225"
                             xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail"
                             preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title>
                            <rect width="100%" height="100%" fill="#55595c"/>
                            <text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text>
                        </svg>
                        <div class="card-body">
                            <p class="card-text">Fishy fish</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-sm btn-outline-secondary rounded-start-4">
                                        View
                                    </button>
                                    <button type="button" class="btn btn-sm btn-outline-secondary rounded-end-4">Add To
                                        Cart
                                    </button>
                                </div>
                                <span class="badge rounded-pill p-2">14 元</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card shadow-sm">
                        <svg class="bd-placeholder-img card-img-top" width="100%" height="225"
                             xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail"
                             preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title>
                            <rect width="100%" height="100%" fill="#55595c"/>
                            <text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text>
                        </svg>
                        <div class="card-body">
                            <p class="card-text">Fishy fish</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-sm btn-outline-secondary rounded-start-4">
                                        View
                                    </button>
                                    <button type="button" class="btn btn-sm btn-outline-secondary rounded-end-4">Add To
                                        Cart
                                    </button>
                                </div>
                                <span class="badge rounded-pill p-2">14 元</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card shadow-sm">
                        <svg class="bd-placeholder-img card-img-top" width="100%" height="225"
                             xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail"
                             preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title>
                            <rect width="100%" height="100%" fill="#55595c"/>
                            <text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text>
                        </svg>
                        <div class="card-body">
                            <p class="card-text">Fishy fish</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-sm btn-outline-secondary rounded-start-4">
                                        View
                                    </button>
                                    <button type="button" class="btn btn-sm btn-outline-secondary rounded-end-4">Add To
                                        Cart
                                    </button>
                                </div>
                                <span class="badge rounded-pill p-2">14 元</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card shadow-sm">
                        <svg class="bd-placeholder-img card-img-top" width="100%" height="225"
                             xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail"
                             preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title>
                            <rect width="100%" height="100%" fill="#55595c"/>
                            <text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text>
                        </svg>
                        <div class="card-body">
                            <p class="card-text">Fishy fish</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-sm btn-outline-secondary rounded-start-4">
                                        View
                                    </button>
                                    <button type="button" class="btn btn-sm btn-outline-secondary rounded-end-4">Add To
                                        Cart
                                    </button>
                                </div>
                                <span class="badge rounded-pill p-2">14 元</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card shadow-sm">
                        <svg class="bd-placeholder-img card-img-top" width="100%" height="225"
                             xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail"
                             preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title>
                            <rect width="100%" height="100%" fill="#55595c"/>
                            <text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text>
                        </svg>
                        <div class="card-body">
                            <p class="card-text">Fishy fish</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-sm btn-outline-secondary rounded-start-4">
                                        View
                                    </button>
                                    <button type="button" class="btn btn-sm btn-outline-secondary rounded-end-4">Add To
                                        Cart
                                    </button>
                                </div>
                                <span class="badge rounded-pill p-2">14 元</span>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <footer class="container">
            <p class="float-end"><a id="backToTop" href="#">Back to top</a></p>
            <p>&copy; 2023–2023 JPetStore, Created By Daniel and 蔡雅韵 &middot; <a href="#">Privacy</a> &middot; <a
                    href="#">Terms</a></p>
        </footer>
    </div>


</main>

<div class="toast-container position-fixed bottom-0 end-0 p-3">
    <div id="liveToast" class="toast" role="alert" aria-live="assertive" aria-atomic="true">
        <div class="toast-header">
            <strong class="me-auto">Meow!</strong>
            <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
        </div>
        <div class="toast-body">
            The item was added to the cart
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/js/store.js" async></script>

</body>

</html>