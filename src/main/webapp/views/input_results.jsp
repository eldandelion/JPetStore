<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<body>


        <c:forEach var="item" items="${requestScope.searchItems}">
            <li><a class="dropdown-item rounded-4" href="#">${item.product.name}</a></li>
        </c:forEach>

</body>


</html>
