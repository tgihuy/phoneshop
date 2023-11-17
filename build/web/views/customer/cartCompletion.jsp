
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/cartCompletion.css">
        <link rel="stylesheet" href="css/cart.css">
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
    </head>
    <body>
        <header>
            <div class="navbar">
                <h1 class="logo"><a href="home">Mobile Shop</a></h1>
                <nav class="header-link">
                    <ul class="navigation">
                        <li><a href="ProductList">Product List</a></li>
                        <li><a href="BlogController">Blog</a></li>
                        <li><a href="#">Contact</a></li>
                        <li><a href="#">About Us</a></li>
                    </ul>
                    <c:if test="${not empty acc.accountID}">
                        <a href="home/cart" class="cart-button">My Cart</a>
                        <div class="login">
                            <a href="profile" class="login-link">Hello ${acc.getFullName()}</a>
                        </div>
                        <a href="logout" class="cart-button">Logout</a>
                    </c:if>
                    <c:if test="${empty acc.accountID}">
                        <a href="login" class="cart-button">My Cart</a>
                        <div class="login">
                            <a href="login" class="login-link">Sign in</a>
                        </div>
                    </c:if>
                </nav>
            </div>
        </header>

        <div class="sidebar">
            <button class="close-button">&times;</button>
            <h2>Category</h2>
            <ul>
                <c:forEach items="${requestScope.categories}" var="c">
                    <li><a href=""><h3>${c.categoryName} ></h3></a></li>
                    </c:forEach>
            </ul>
        </div>
        <h1 class="thank">Thank you for using my service</h1>
        <h3>Order of: ${requestScope.order.customerName} - Date: ${requestScope.order.date}</h3>
        <h3>The order will be delivered to you as soon as possible - ${requestScope.order.orderStatus.orderStatusName}...</h3>
        <table class="order" border="1px">
            <thead>
                <tr>
                    <th></th>
                    <th>Name</th>
                    <th>Unit Price</th>
                    <th>Quantity</th>
                    <th>Into Money</th>
                </tr>
            </thead>
            <tbody>
            <tbody>
                <c:forEach items="${requestScope.ois}" var="ois">
                    <tr>
                        <td><img src="images/productImage/${ois.product.productImage.url}" alt="alt"/></td>
                        <td>${ois.product.productName}</td>
                        <td><fmt:formatNumber type="currency" value="${ois.product.price}" pattern="$#,##0.00" /></td>
                        <td>${ois.quantity}</td>
                        <c:set  var="totalprice" value="${ois.product.price * ois.quantity}"/>
                        <td><fmt:formatNumber type="currency" value="${totalprice}" pattern="$#,##0.00" /></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <h3>Total: <fmt:formatNumber type="currency" value="${requestScope.order.total}" pattern="$#,##0.00" /></h3>

        <footer>
            <h2 class="col-md-8">2023 Mobile Shop. All rights reserved.</h2>
            <!--            <div class="col-md-4 links">
                            <a href="">
                                <h2>About Us</h2>
                            </a>
                            <a href="">
                                <h2>Contact Us</h2>
                            </a>
                        </div>-->
            <p class="col-md-4"> FPT University, Thach That, Ha Noi</br>
                Tel: (028) 38489828 </br>
                Email: shopphonefptno1@gmail.com </br>
                Date of issue: Oct 1 2023 by Group 2
            </p>
        </footer>
        <script src="../../javascript/home.js"></script>
    </body>
</html>
