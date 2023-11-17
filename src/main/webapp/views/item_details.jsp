<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.danyayun.jpetstore.domain.Item" %>
<%@ page import="com.danyayun.jpetstore.domain.Account" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    Account account = (Account) session.getAttribute("loginAccount");
    Item item = (Item) session.getAttribute("item");

    if (item == null) {
        String contextPath = request.getContextPath();
        String path = contextPath + "/store";
        response.sendRedirect(path);
        return;
    }


%>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=2">
    <title>JPetStore Item Details</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/item_details.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          type="text/css"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
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
            <ul class="navbar-nav align-content-end me-auto mb-2 mb-lg-0">

                <button class="btn btn-outline-secondary rounded-5 m-1" type="button" id="button-home"
                        onclick="window.location.href='${pageContext.request.contextPath}/home'">
                    <svg class="bi pe-none me-2" width="16" height="16">
                        <use xlink:href="#home"/>
                    </svg>
                    Home</a>
                </button>

                <button class="btn btn-outline-secondary rounded-5 m-1" type="button" id="button-store"
                        onclick="window.open('${pageContext.request.contextPath}/store', '_blank')" >
                    <svg class="bi pe-none me-2" width="16" height="16">
                        <use xlink:href="#store"/>
                    </svg>
                    Store</a>
                </button>
                <button class="btn btn-outline-secondary rounded-5 m-1 position-relative" type="button" id="button-cart"
                        onclick="window.open('${pageContext.request.contextPath}/cart', '_blank')" >
          <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
                        99+
                        <span class="visually-hidden">unread messages</span>
                    </span>
                    <svg class="bi pe-none me-2" width="16" height="16">
                        <use xlink:href="#cart"/>
                    </svg>
                    Cart</a>
                </button>


            </ul>


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

            <c:choose>
                <c:when test="${sessionScope.loginAccount != null}">
        <span class="badge d-flex align-items-center ms-4 p-1 pe-2 text-primary-emphasis bg-primary-subtle border border-primary-subtle rounded-pill">
            <div class="dropdown">
                <a href="#" class="d-flex align-items-center link-body-emphasis text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                    <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-person-circle me-2" viewBox="0 0 16 16">
                        <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
                        <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
                    </svg>
                    <%= account.getUsername() %>
                </a>
                <ul class="dropdown-menu dropdown-menu-dark text-small shadow">
                    <li><a class="dropdown-item" href="#">Settings</a></li>
                    <li><a class="dropdown-item" onclick="window.location.href='${pageContext.request.contextPath}/profile'">Profile</a></li>
                    <li><hr class="dropdown-divider"></li>
                    <li><a class="dropdown-item" href="#">Sign out</a></li>
                </ul>
            </div>
        </span>
                </c:when>
                <c:otherwise>
          <span class="badge d-flex align-items-center ms-4 p-1 pe-2 text-primary-emphasis bg-primary-subtle border border-primary-subtle rounded-pill" id="login-button" >
                <a onclick="window.open('${pageContext.request.contextPath}/login', '_blank')" href="#" class="d-flex align-items-center link-body-emphasis text-decoration-none pe-1" aria-expanded="false">
                    <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-person-circle me-2" viewBox="0 0 16 16">
                        <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
                        <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
                    </svg>
                    Log In
                </a>
        </span>
                </c:otherwise>
            </c:choose>
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

        <symbol id="store" viewBox="0 0 16 16">
            <path d="M8 1a2.5 2.5 0 0 1 2.5 2.5V4h-5v-.5A2.5 2.5 0 0 1 8 1zm3.5 3v-.5a3.5 3.5 0 1 0-7 0V4H1v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4h-3.5z"/>
        </symbol>
    </svg>


</main>

<nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
    <ol class="breadcrumb p-4">
        <li class="breadcrumb-item text-secondary text-uppercase"><a onclick="window.location.href='${pageContext.request.contextPath}/store'" href="#">Store</a></li>
        <li class="breadcrumb-item active text-secondary text-uppercase" aria-current="page"><%= item.getProduct().getName()%></li>
    </ol>
</nav>


<div class="container-fluid d-flex justify-content-center align-items-center m-0 p-0" id="container-content">


    <div class="container w-75 m-0 p-0" id="container-element">
        <main>


            <div class="row d-flex w-100 h-100 m-0 p-0">


                <div class="col-6 p-0 m-0">
                    <svg class="bd-placeholder-img card-img-top image-holder" id="image-holder" width="100%"
                         height="100%"
                         xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail"
                         preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title>
                        <rect width="100%" height="100%" fill="#55595c"/>
                        <text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text>
                    </svg>
                </div>

                <div class="col-6 d-flex flex-shrink-0 flex-column" id="col-description">


                    <div class="row m-0 p-0">
                        <div class="col-8 p-0 m-0">
                            <h1 class="modal-title fs-3 p-0 m-0"
                                id="text-item-name"><%= item.getProduct().getName()%>
                                <small class="text-body-secondary"><%= item.getAttribute1()%>
                                </small></h1>
                        </div>
                        <div class="col-4 d-flex justify-content-end p-0 m-0 ">
                            <span class="badge bg-primary p-3 ps-3 pe-3 rounded-pill m-0" id="badge-instock">
                            <c:if test="${sessionScope.item.quantity <= 0}">
                                Back ordered
                            </c:if>
                            <c:if test="${sessionScope.item.quantity > 0}">
                                ${sessionScope.item.quantity} In stock
                            </c:if>
                        </span>
                        </div>

                    </div>

                    <div class="container-details">
                        <hr>
                        <span class="text-secondary-emphasis text-uppercase">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                 class="bi bi-info-circle me-2" viewBox="0 0 16 16">
  <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
  <path d="m8.93 6.588-2.29.287-.082.38.45.083c.294.07.352.176.288.469l-.738 3.468c-.194.897.105 1.319.808 1.319.545 0 1.178-.252 1.465-.598l.088-.416c-.2.176-.492.246-.686.246-.275 0-.375-.193-.304-.533L8.93 6.588zM9 4.5a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
</svg>Product Info</span>

                    </div>
                    <div>

                        <small class="text-secondary">Item ID <%= item.getItemId() %>
                        </small>
                    </div>
                    <div>

                        <small class="text-secondary">Product ID  <%= item.getProduct().getProductId() %>
                        </small>
                    </div>

                    <div class="container-details">
                        <hr>
                        <span class="text-secondary-emphasis text-uppercase">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                 class="bi bi-book me-2" viewBox="0 0 16 16">
  <path d="M1 2.828c.885-.37 2.154-.769 3.388-.893 1.33-.134 2.458.063 3.112.752v9.746c-.935-.53-2.12-.603-3.213-.493-1.18.12-2.37.461-3.287.811V2.828zm7.5-.141c.654-.689 1.782-.886 3.112-.752 1.234.124 2.503.523 3.388.893v9.923c-.918-.35-2.107-.692-3.287-.81-1.094-.111-2.278-.039-3.213.492V2.687zM8 1.783C7.015.936 5.587.81 4.287.94c-1.514.153-3.042.672-3.994 1.105A.5.5 0 0 0 0 2.5v11a.5.5 0 0 0 .707.455c.882-.4 2.303-.881 3.68-1.02 1.409-.142 2.59.087 3.223.877a.5.5 0 0 0 .78 0c.633-.79 1.814-1.019 3.222-.877 1.378.139 2.8.62 3.681 1.02A.5.5 0 0 0 16 13.5v-11a.5.5 0 0 0-.293-.455c-.952-.433-2.48-.952-3.994-1.105C10.413.809 8.985.936 8 1.783z"/>
</svg>Description</span>

                    </div>
                    <div>
                        <small class="text-secondary"><%= item.getProduct().getDescription()%>
                        </small>
                    </div>

                    <div class="container-details">
                        <hr>
                        <div class="row p-0">
                            <div class="col-6 justify-content-start align-content-center">


                             <span class="badge bg-primary p-3 ps-3 pe-3 rounded-pill" id="badge-price">
                            <fmt:formatNumber value="${sessionScope.item.listPrice}" pattern="$#,##0.00" />
                        </span>

                            </div>

                            <div class="col-6 d-flex justify-content-end align-content-center">
                                <ul class="pagination">
                                    <li class="page-item"><a class="page-link" href="#"
                                                             onclick="decrementNumber()">-</a></li>
                                    <li class="page-item"><a class="page-link disabled" href="#">1</a></li>
                                    <li class="page-item"><a class="page-link" href="#"
                                                             onclick="incrementNumber()">+</a></li>
                                </ul>
                            </div>
                        </div>


                    </div>

                    <div class="flex-grow-1"></div>

                    <button class="w-100 btn btn-primary btn-lg mt-5 mb-2 rounded-5 text-uppercase" id="buttonPurchase">

                        Purchase
                    </button>


                </div>
            </div>
        </main>
    </div>

</div>


<div id="container-footer">
    <footer class="text-body-secondary mt-5 text-center text-small">
        <p class="mb-1">&copy; 2023–2023 JPetStore, Developed by Daniel and 蔡雅韵</p>
    </footer>

</div>


</body>
</html>
