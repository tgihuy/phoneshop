<%-- 
    Document   : pagination
    Created on : Jul 14, 2023, 3:20:03?AM
    Author     : toden
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav aria-label="Page navigation example">
    <ul class="pagination">
        <c:if test="${pagination.getCurrentPage()>1}">
            <li class="page-item"><a class="page-link" href="OrderList?currentpage=1">First</a></li>
            <li class="page-item"><a class="page-link" href="OrderList?currentpage=${pagination.getCurrentPage()-1}">${pagination.getCurrentPage()-1}</a></li>
        </c:if>

        <li class="page-item active"><a class="page-link" href="OrderList?currentpage=${pagination.getCurrentPage()}">${pagination.getCurrentPage()}</a></li>
        <c:if test="${pagination.getCurrentPage()<pagination.getPageCount()}">
            <li class="page-item"><a class="page-link" href="OrderList?currentpage=${pagination.getCurrentPage()+1}">${pagination.getCurrentPage()+1}</a></li>
            <li class="page-item"><a class="page-link" href="OrderList?currentpage=${pagination.getPageCount()}">Last</a></li>
        </c:if>

    </ul>
</nav>
