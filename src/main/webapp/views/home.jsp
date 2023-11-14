<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=2">
  <title>JPetStore Home</title>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/home.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
  <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"
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

        <button class="btn btn-outline-secondary rounded-5 m-1" type="button" id="button-cart" onclick="window.location.href='${pageContext.request.contextPath}/cart'">
          <svg class="bi pe-none me-2" width="16" height="16">
            <use xlink:href="#cart"/>
          </svg>Cart</a>
          <span class="badge rounded-pill ms-2 badge-counter">0</span>
        </button>


      </ul>


      <div class="dropdown">
        <a href="#" class="d-flex align-items-center link-dark rounded-5 text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-globe-americas me-2" viewBox="0 0 16 16">
            <path d="M8 0a8 8 0 1 0 0 16A8 8 0 0 0 8 0ZM2.04 4.326c.325 1.329 2.532 2.54 3.717 3.19.48.263.793.434.743.484-.08.08-.162.158-.242.234-.416.396-.787.749-.758 1.266.035.634.618.824 1.214 1.017.577.188 1.168.38 1.286.983.082.417-.075.988-.22 1.52-.215.782-.406 1.48.22 1.48 1.5-.5 3.798-3.186 4-5 .138-1.243-2-2-3.5-2.5-.478-.16-.755.081-.99.284-.172.15-.322.279-.51.216-.445-.148-2.5-2-1.5-2.5.78-.39.952-.171 1.227.182.078.099.163.208.273.318.609.304.662-.132.723-.633.039-.322.081-.671.277-.867.434-.434 1.265-.791 2.028-1.12.712-.306 1.365-.587 1.579-.88A7 7 0 1 1 2.04 4.327Z"/>
          </svg>
          English
        </a>
        <ul class="dropdown-menu dropdown-menu-dark text-small shadow">
          <li><a class="dropdown-item" href="#">English</a></li>
          <li><a class="dropdown-item" href="#">汉语</a></li>
        </ul>
      </div>

      <div class="dropdown">
        <a onclick="window.location.href='${pageContext.request.contextPath}/login'" class="d-flex align-items-center link-body-emphasis text-decoration-none dropdown-toggle ms-4" data-bs-toggle="dropdown" aria-expanded="false">
          <img src="https://github.com/mdo.png" alt="" width="32" height="32" class="rounded-circle me-2">
          Log In
        </a>
        <ul class="dropdown-menu dropdown-menu-dark text-small shadow">
          <li><a class="dropdown-item" href="#">Settings</a></li>
          <li><a class="dropdown-item" href="#">Profile</a></li>
          <li><hr class="dropdown-divider"></li>
          <li><a class="dropdown-item" href="#">Sign out</a></li>
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

    <symbol id="store" viewBox="0 0 16 16">
      <path d="M8 1a2.5 2.5 0 0 1 2.5 2.5V4h-5v-.5A2.5 2.5 0 0 1 8 1zm3.5 3v-.5a3.5 3.5 0 1 0-7 0V4H1v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4h-3.5z"/>
    </symbol>
  </svg>


</main>

<div class="container">


  <div id="shape-one"></div>
  <div id="shape-two"></div>
  <div id="shape-three"></div>
  <div id="shape-four"></div>
  <div id="shape-five"></div>
  <div id="shape-six"></div>
  <div id="shape-seven"></div>
  <div id="shape-eight"></div>
  <img id="image-cat" src="${pageContext.request.contextPath}/images/cat-home.png"></img>
  <img id="image-fish" src="${pageContext.request.contextPath}/images/fish-home.png"></img>
  <img id="image-dog" src="${pageContext.request.contextPath}/images/dog-home.png"></img>
</div>

<div class="container mt-1 center-content">
  <div class="row-cols-1">
    <h1 class="text-center display-2">Find your new friend here</h1>

  </div>
  <div class="row-cols-1 mt-5">
    <div class="d-flex justify-content-center">
        <button class="btn-primary btn rounded-5 text-uppercase ps-2 pe-2 m-1" id="button-explore" onclick="window.location.href='${pageContext.request.contextPath}/store'"><svg class="bi pe-none me-2" width="16" height="16">
          <use xlink:href="#store"/>
        </svg>Explore</button>
    </div>
  </div>

  <div class="row-cols-1 align-bottom">
    <div class="d-flex justify-content-center">
      <p class="mt-5 mb-3 text-body-secondary">&copy; 2023–2023 JPetStore, Created by Daniel and 蔡雅韵 for Web Development Class</p>
    </div>
  </div>

</div>

</body>
</html>
