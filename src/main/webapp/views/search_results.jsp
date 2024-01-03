
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<html>

<body>
  <%--                forEach loop creates cards for every Product.class available in the database --%>
  <c:forEach var="item" items="${requestScope.searchItems}">

    <%--                Card view contains information about Product.class --%>
    <div class="col" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
      <div class="card shadow-sm">
<%--        <svg class="bd-placeholder-img card-img-top image-holder" width="100%" height="225"--%>
<%--             xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail"--%>
<%--             preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title>--%>
<%--          <rect width="100%" height="100%" fill="#55595c"/>--%>
<%--          <text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text>--%>
<%--        </svg>--%>
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



</body>
</html>
