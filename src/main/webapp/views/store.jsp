<%@ page import="com.danyayun.jpetstore.domain.Item" %>
<%@ page import="java.util.List" %>
<%@ page import="com.danyayun.jpetstore.domain.Category" %>
<%@ page import="com.danyayun.jpetstore.domain.Product" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Objects" %>
<%@ page import="java.math.BigDecimal" %>
<%@ page import="com.danyayun.jpetstore.domain.Account" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%


    Account account = (Account) session.getAttribute("loginAccount");

    //getting data from the session
    List<Item> itemList = (List<Item>) session.getAttribute("itemList");
    List<Category> categoryList = (List<Category>) session.getAttribute("categoryList");
    List<Product> productList = (List<Product>) session.getAttribute("productList");


    List<Item> fishItems = (List<Item>) session.getAttribute("fishItems");
    List<Item> dogsItems = (List<Item>) session.getAttribute("dogsItems");
    List<Item> catsItems = (List<Item>) session.getAttribute("catsItems");
    List<Item> reptilesItems = (List<Item>) session.getAttribute("reptilesItems");
    List<Item> birdsItems = (List<Item>) session.getAttribute("birdsItems");


%>


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

<%--navigation bar is the bar on top of the screen, it contains JPetStore logo, name, Home button and Cart button, search view and so on--%>
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


                <button class="btn btn-outline-secondary rounded-5 m-1 position-relative" type="submit" id="button-cart"
                        onclick="window.open('${pageContext.request.contextPath}/cart', '_blank')">
                    <svg class="bi pe-none me-2" width="16" height="16">
                        <use xlink:href="#cart"/>
                    </svg>
                    <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger"
                          id="cart-size-span">
                        0
                        <span class="visually-hidden">unread messages</span>
                    </span>
                    Cart</a>
                </button>


            </ul>

            <form class="d-flex" role="search" method="POST" id="search-form">
                <div class="input-group me-2">
                    <input type="text" autocomplete="off" class="form-control rounded-start-5 search-input" placeholder="Search"
                           aria-label="Search" aria-describedby="button-addon2" id="search-input">

                    <button class="btn btn-outline-secondary rounded-end-5" type="submit" id="button-search">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                             class="bi bi-search" viewBox="0 0 16 16">
                            <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                        </svg>
                    </button>

                    <div id="search-list" style="display: none">
                        <ul class="dropdown-menu position-static d-grid pt-5 gap-1 p-2 rounded-3 mx-0" id="dropdown-search">
                        </ul>
                    </div>



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

<div class="progress" role="progressbar" aria-label="Animated striped example" aria-valuenow="100" aria-valuemin="0"
     aria-valuemax="100" id="progress-bar">
    <div class="progress-bar progress-bar-striped progress-bar-animated" style="width: 100%"></div>
</div>

<main class="d-flex flex-nowrap">

    <%--    Icons for navigation bars buttons Home button and Cart button--%>
    <svg xmlns="http://www.w3.org/2000/svg" class="d-none">
        <symbol id="home" viewBox="0 0 16 16">
            <path d="M8.354 1.146a.5.5 0 0 0-.708 0l-6 6A.5.5 0 0 0 1.5 7.5v7a.5.5 0 0 0 .5.5h4.5a.5.5 0 0 0 .5-.5v-4h2v4a.5.5 0 0 0 .5.5H14a.5.5 0 0 0 .5-.5v-7a.5.5 0 0 0-.146-.354L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.354 1.146zM2.5 14V7.707l5.5-5.5 5.5 5.5V14H10v-4a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5v4H2.5z"/>
        </symbol>


        <symbol id="cart" viewBox="0 0 16 16">
            <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
        </symbol>
    </svg>


    <%--    Sidebar is the element on the left side of the screen which contains list of categories--%>
    <div id="sidebar" class="d-flex flex-column flex-shrink-0 p-3 sidebar">


        <ul class="nav nav-pills flex-column mb-auto">
            <strong id="text-items" class="h5 mt-1 mb-0 text-muted">Categories</strong>
            <hr>
            <li class="nav-item">
                <a href="#container-fish" class="nav-link rounded-5 link-body-emphasis active" aria-current="page">
                    <div class="row justify-content-between align-items-center">
                        <div class="col-auto name ">
                            <img src="${pageContext.request.contextPath}/images/fish.png" alt="" width="22" height="22"
                                 class="me-2">
                            Fish
                        </div>
                        <div class="col-auto badge-col">
                            <span class="badge rounded-pill badge-counter"><%= fishItems.size()%></span>
                        </div>
                    </div>


                </a>
            </li>
            <li class="nav-item">
                <a href="#container-dogs" class="nav-link rounded-5 link-body-emphasis">
                    <div class="row justify-content-between align-items-center">
                        <div class="col-auto name">
                            <img src="${pageContext.request.contextPath}/images/paws.png" alt="" width="22" height="22"
                                 class="me-2">
                            Dogs
                        </div>
                        <div class="col-auto badge-col">
                            <span class="badge rounded-pill badge-counter"><%= dogsItems.size()%></span>
                        </div>
                    </div>

                </a>
            </li>
            <li>
                <a href="#container-cats" class="nav-link rounded-5 link-body-emphasis">
                    <div class="row justify-content-between align-items-center">
                        <div class="col-auto name">
                            <img src="${pageContext.request.contextPath}/images/cats.png" alt="" width="22" height="22"
                                 class="me-2">
                            Cats
                        </div>
                        <div class="col-auto badge-col">
                            <span class="badge rounded-pill badge-counter"><%= catsItems.size()%></span>
                        </div>
                    </div>
                </a>
            </li>
            <li>
                <a href="#container-reptiles" class="nav-link rounded-5 link-body-emphasis">
                    <div class="row justify-content-between align-items-center">
                        <div class="col-auto name">
                            <img src="${pageContext.request.contextPath}/images/reptiles.png" alt="" width="22"
                                 height="22" class="me-2">
                            Reptiles
                        </div>
                        <div class="col-auto badge-col">
                            <span class="badge rounded-pill badge-counter"><%= reptilesItems.size()%></span>
                        </div>
                    </div>

                </a>
            </li>
            <li>
                <a href="#container-birds" class="nav-link rounded-5 link-body-emphasis">
                    <div class="row justify-content-between align-items-center">
                        <div class="col-auto name">
                            <img src="${pageContext.request.contextPath}/images/birds.png" alt="" width="22" height="22"
                                 class="me-2">
                            Birds
                        </div>
                        <div class="col-auto badge-col">
                            <span class="badge rounded-pill badge-counter"><%= birdsItems.size()%></span>
                        </div>
                    </div>
                </a>

            </li>
        </ul>
        <hr>
        <c:choose>
            <c:when test="${sessionScope.loginAccount != null}">
        <span class="badge d-flex align-items-center p-1 pe-2 text-primary-emphasis bg-primary-subtle border border-primary-subtle rounded-pill">
            <div class="dropdown">
                <a href="#" class="d-flex align-items-center link-body-emphasis text-decoration-none dropdown-toggle"
                   data-bs-toggle="dropdown" aria-expanded="false">
                    <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor"
                         class="bi bi-person-circle me-2" viewBox="0 0 16 16">
                        <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
                        <path fill-rule="evenodd"
                              d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
                    </svg>
                    <%= account.getUsername() %>
                </a>
                <ul class="dropdown-menu rounded-4 dropdown-menu-dark text-small shadow">
                 <li><a class="dropdown-item" href="#">Settings</a></li>
                      <li>
                    <hr class="dropdown-divider">
                </li>
                    <li><a class="dropdown-item"
                           onclick="window.location.href='${pageContext.request.contextPath}/profile'">Profile</a></li>
                </ul>
            </div>
        </span>
            </c:when>
            <c:otherwise>
          <span class="badge d-flex align-items-center p-1 pe-2 text-primary-emphasis bg-primary-subtle border border-primary-subtle rounded-pill"
                id="login-button">
                <a onclick="window.open('${pageContext.request.contextPath}/login', '_blank')" href="#"
                   class="d-flex align-items-center link-body-emphasis text-decoration-none pe-1" aria-expanded="false">
                    <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor"
                         class="bi bi-person-circle me-2" viewBox="0 0 16 16">
                        <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
                        <path fill-rule="evenodd"
                              d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
                    </svg>
                    Log In
                </a>
        </span>
            </c:otherwise>
        </c:choose>
    </div>

    <div data-bs-spy="scroll" data-target="#sidebar" id="album-categories" data-bs-smooth-scroll="true"
         class="album py-5 pb-0 px-4 bg-body-tertiary">

        <div class="container" id="container-search">
            <div class="row justify-content-between align-items-center">
                <div class="col-auto">
                    <h1 id="search-results" class="display-1 h1-category-name">Search Results</h1>
                </div>
                <div class="col-auto" id="col-close-button">
                    <button class="btn btn-secondary m-3 ps-2 pe-2 pt-1 pb-1 rounded-circle" type="button"
                            id="button-close">
                        <svg xmlns="http://www.w3.org/2000/svg" width="58" height="58" fill="currentColor"
                             class="bi bi-x-lg" viewBox="0 0 16 16">
                            <path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8 2.146 2.854Z"/>
                        </svg>
                    </button>
                </div>


            </div>


            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-4 g-3 card-row" id="cards-search">
                <%--                    check store.js ajax to understand how it actually works --%>


            </div>


        </div>
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
                <%--                forEach loop creates cards for every Product.class available in the database --%>
                <c:forEach var="item" items="${sessionScope.fishItems}">

                    <%--                    TODO create a new page with product details instead of a modal --%>
                    <%--                Card view contains information about Product.class --%>
                    <div class="col">
                        <div class="card shadow-sm" onclick="window.open('${pageContext.request.contextPath}/item?itemId=${item.itemId}', '_blank')">
                            <div style="display: none" class="item-id">${item.itemId}</div>
                            <img class="bd-placeholder-img card-img-top image-holder crop-image" src="${pageContext.request.contextPath}/${item.attribute2}" width="100%" height="225">
                            <div class="card-body">
                                <p class="card-text mb-0">${item.product.name}</p>
                                <p class="text-secondary p-0 mt-1">${item.attribute1}</p>
                                <div class="d-flex justify-content-between align-items-center">
                                    <div class="btn-group">
                                        <button type="button"
                                                class="btn btn-sm btn-outline-secondary rounded-start-4 btn-view"
                                                onclick="window.open('${pageContext.request.contextPath}/item?itemId=${item.itemId}', '_blank')">
                                            View
                                        </button>
                                        <button type="button"
                                                class="btn btn-sm btn-outline-secondary rounded-end-4 btn-purchase">
                                            Purchase
                                        </button>
                                    </div>
                                    <span class="badge rounded-pill p-2">
                                         <fmt:formatNumber value="${item.listPrice}" pattern="$#,##0.00"/>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>


                </c:forEach>


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
                <c:forEach var="item" items="${sessionScope.dogsItems}">


                    <%--                Card view contains information about Product.class --%>
                    <div class="col">
                        <div class="card shadow-sm" onclick="window.open('${pageContext.request.contextPath}/item?itemId=${item.itemId}', '_blank')">
                                <%--                            <svg class="bd-placeholder-img card-img-top image-holder" width="100%" height="225"--%>
                                <%--                                 xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail"--%>
                                <%--                                 preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title>--%>
                                <%--                                <rect width="100%" height="100%" fill="#55595c"></rect>--%>
                                <%--                                <text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text>--%>
                                <%--                            </svg>--%>
                                    <img class="bd-placeholder-img card-img-top image-holder crop-image" src="${pageContext.request.contextPath}/${item.attribute2}" width="100%" height="225">
                            <div class="card-body">
                                <p class="card-text mb-0">${item.product.name}</p>
                                <p class="text-secondary p-0 mt-1">${item.attribute1}</p>
                                <div class="d-flex justify-content-between align-items-center">
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-sm btn-outline-secondary rounded-start-4"
                                                onclick="window.open('${pageContext.request.contextPath}/item?itemId=${item.itemId}', '_blank')">
                                            View
                                        </button>
                                        <button type="button"
                                                class="btn btn-sm btn-outline-secondary rounded-end-4 btn-purchase">
                                            Purchase
                                        </button>
                                    </div>
                                    <span class="badge rounded-pill p-2">
                                         <fmt:formatNumber value="${item.listPrice}" pattern="$#,##0.00"/>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>

                </c:forEach>
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
                <c:forEach var="item" items="${sessionScope.catsItems}">


                    <%--                Card view contains information about Product.class --%>
                    <div class="col">
                        <div class="card shadow-sm" onclick="window.open('${pageContext.request.contextPath}/item?itemId=${item.itemId}', '_blank')">
                            <img class="bd-placeholder-img card-img-top image-holder crop-image" src="${pageContext.request.contextPath}/${item.attribute2}" width="100%" height="225">
                            <div class="card-body">
                                <p class="card-text mb-0">${item.product.name}</p>
                                <p class="text-secondary p-0 mt-1">${item.attribute1}</p>
                                <div class="d-flex justify-content-between align-items-center">
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-sm btn-outline-secondary rounded-start-4"
                                                onclick="window.open('${pageContext.request.contextPath}/item?itemId=${item.itemId}', '_blank')">
                                            View
                                        </button>
                                        <button type="button"
                                                class="btn btn-sm btn-outline-secondary rounded-end-4 btn-purchase">
                                            Purchase
                                        </button>
                                    </div>
                                    <span class="badge rounded-pill p-2">
                                         <fmt:formatNumber value="${item.listPrice}" pattern="$#,##0.00"/>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>

                </c:forEach>
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
                <c:forEach var="item" items="${sessionScope.reptilesItems}">


                    <%--                Card view contains information about Product.class --%>
                    <div class="col">
                        <div class="card shadow-sm" onclick="window.open('${pageContext.request.contextPath}/item?itemId=${item.itemId}', '_blank')">
                            <img class="bd-placeholder-img card-img-top image-holder crop-image" src="${pageContext.request.contextPath}/${item.attribute2}" width="100%" height="225">
                            <div class="card-body">
                                <p class="card-text mb-0">${item.product.name}</p>
                                <p class="text-secondary p-0 mt-1">${item.attribute1}</p>
                                <div class="d-flex justify-content-between align-items-center">
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-sm btn-outline-secondary rounded-start-4"
                                                onclick="window.open('${pageContext.request.contextPath}/item?itemId=${item.itemId}', '_blank')">
                                            View
                                        </button>
                                        <button type="button"
                                                class="btn btn-sm btn-outline-secondary rounded-end-4 btn-purchase">
                                            Purchase
                                        </button>
                                    </div>
                                    <span class="badge rounded-pill p-2">
                                         <fmt:formatNumber value="${item.listPrice}" pattern="$#,##0.00"/>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>

                </c:forEach>
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
                <c:forEach var="item" items="${sessionScope.birdsItems}">


                    <%--                Card view contains information about Product.class --%>
                    <div class="col">
                        <div class="card shadow-sm" onclick="window.open('${pageContext.request.contextPath}/item?itemId=${item.itemId}', '_blank')">
                            <img class="bd-placeholder-img card-img-top image-holder crop-image" src="${pageContext.request.contextPath}/${item.attribute2}" width="100%" height="225">
                            <div class="card-body">
                                <p class="card-text mb-0">${item.product.name}</p>
                                <p class="text-secondary p-0 mt-1">${item.attribute1}</p>
                                <div class="d-flex justify-content-between align-items-center">
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-sm btn-outline-secondary rounded-start-4"
                                                onclick="window.open('${pageContext.request.contextPath}/item?itemId=${item.itemId}', '_blank')">
                                            View
                                        </button>
                                        <button type="button"
                                                class="btn btn-sm btn-outline-secondary rounded-end-4 btn-purchase">
                                            Purchase
                                        </button>
                                    </div>
                                    <span class="badge rounded-pill p-2">
                                         <fmt:formatNumber value="${item.listPrice}" pattern="$#,##0.00"/>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>

                </c:forEach>

            </div>
        </div>
        <%--        container is 盒子 --%>

        <div id="container-footer">
            <footer class="d-flex flex-wrap justify-content-between align-items-center py-3 mt-4">
                <div class="col-auto d-flex align-items-center">
                    <a href="/" class="mb-3 me-2 mb-md-0 text-body-secondary text-decoration-none lh-1">
                        <svg class="bi" width="30" height="24"><img
                                src="${pageContext.request.contextPath}/images/jpetstore.png" alt="" width="32"
                                height="32" class="me-2"></svg>
                    </a>
                    <span class="mb-3 mb-md-0 text-body-secondary">&copy; 2023 JPetstore, Inc</span>


                    <button class="btn ms-3 btn-outline-secondary rounded-5" id="backToTop">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                             class="bi bi-arrow-up me-2" viewBox="0 0 16 16">
                            <path fill-rule="evenodd"
                                  d="M8 15a.5.5 0 0 0 .5-.5V2.707l3.146 3.147a.5.5 0 0 0 .708-.708l-4-4a.5.5 0 0 0-.708 0l-4 4a.5.5 0 1 0 .708.708L7.5 2.707V14.5a.5.5 0 0 0 .5.5"/>
                        </svg>
                        Back to top
                    </button>
                </div>


            </footer>
            <%--    <footer class="text-body-secondary mt-5 text-center text-small">--%>
            <%--        <p class="mb-1">&copy; 2023–2023 JPetStore, Developed by Daniel and 蔡雅韵</p>--%>
            <%--    </footer>--%>

        </div>


        <%--        <footer class="container">--%>


        <%--            <div class="row-cols-2" >--%>
        <%--                <div class="col-auto">--%>
        <%--                    <p>&copy; 2023–2023 JPetStore, Created By Daniel and 蔡雅韵</p>--%>
        <%--                </div>--%>
        <%--                <div class="col-auto">--%>
        <%--                    <button class="btn btn-outline-secondary rounded-5" id="backToTop"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-up me-2" viewBox="0 0 16 16">--%>
        <%--                        <path fill-rule="evenodd" d="M8 15a.5.5 0 0 0 .5-.5V2.707l3.146 3.147a.5.5 0 0 0 .708-.708l-4-4a.5.5 0 0 0-.708 0l-4 4a.5.5 0 1 0 .708.708L7.5 2.707V14.5a.5.5 0 0 0 .5.5"/>--%>
        <%--                    </svg>Back To Top</button>--%>
        <%--                </div>--%>
        <%--            </div>--%>


        <%--        </footer>--%>
    </div>


</main>

<div class="toast-container position-fixed bottom-0 end-0 p-3">
    <div id="liveToast" class="toast" role="alert" aria-live="assertive" aria-atomic="true">
        <div class="toast-header">
            <strong class="me-auto">Meow!</strong>
            <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
        </div>
        <div class="toast-body">
            <div class="row mx-auto">
                <div class="col-8  justify-content-center align-content-center">The item was added to the cart</div>
                <div class="col-4 d-flex justify-content-end align-items-center">
                    <button type="button" class="btn btn-sm btn-outline-secondary rounded-4" id="btn-toast-view"
                            onclick="window.open('${pageContext.request.contextPath}/cart', '_blank')">View
                    </button>
                </div>
            </div>

        </div>
    </div>
</div>


</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
<script defer src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script defer src="${pageContext.request.contextPath}/js/store.js"></script>

</html>