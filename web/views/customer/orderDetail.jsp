<%-- 
    Document   : orderDetail
    Created on : Jun 24, 2023, 10:26:54 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/orderDetail.css">
        <link rel="stylesheet" href="../css/cartCompletion.css">
        <link rel="stylesheet" href="../css/cart.css">
        <link rel="stylesheet" href="../css/bootstrap.css">
        <link rel="stylesheet" href="../css/bootstrap.min.css">
    </head>
    <body>
        <header>
            <div class="navbar">
                <h1 class="logo"><a href="../home">Mobile Shop</a></h1>
                <nav class="header-link">
                    <ul class="navigation">
                        <li><a href="../ProductList">Product List</a></li>
                        <li><a href="../BlogController">Blog</a></li>
                        <li><a href="#">Contact</a></li>
                        <li><a href="#">About Us</a></li>
                    </ul>
                    <c:if test="${not empty acc.accountID}">
                        <a href="../home/cart" class="cart-button">My Cart</a>
                        <div class="login">
                            <a href="../profile" class="login-link">Hello ${acc.getFullName()}</a>
                        </div>
                        <a href="../logout" class="cart-button">Logout</a>
                    </c:if>
                    <c:if test="${empty acc.accountID}">
                        <a href="../login" class="cart-button">My Cart</a>
                        <div class="login">
                            <a href="../login" class="login-link">Sign in</a>
                        </div>
                    </c:if>
                </nav>
            </div>
        </header>
        <main>
            <h3>Order of: ${requestScope.order.customerName} - Date: ${requestScope.order.date}</h3>
            <h3>Order Status: ${requestScope.order.orderStatus.getOrderStatusName()} <span style="margin-left: 15px;"> </span>  <c:if test="${requestScope.order.orderStatus.getOrderStatusID()==1}">
                    <a href="<c:url value='/CancelOrder?id=${requestScope.order.getOrderID()}&ss=5'/>"  class="btn btn-danger">Cancel</a> 
                </c:if>
                <table class="order" border="1px" style="margin: 0px">
                    <thead>
                        <tr>
                            <th></th>
                            <th>Name</th>
                            <th><span class="formattedUnitPrice">Unit Price</span></th>
                            <th>Quantity</th>
                            <th>Into Money</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${requestScope.ois}" var="ois">
                            <tr>
                                <td><img src="../images/productImage/${ois.product.productImage.url}" alt=""/></td>
                                <td>${ois.product.productName}</td>
                                <td><span class="formattedUnitPrice">${ois.product.price}</span> $</td>
                                <td>${ois.quantity}</td>
                                <c:set var="totalprice" value="${ois.product.price * ois.quantity}"/>
                                <td><span class="formattedTotal">${totalprice}</span> $</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <h3>Total: <span class="formattedTotal">${requestScope.order.total}</span> $</h3>

                <script>
                    const formattedTotalElements = document.querySelectorAll(".formattedTotal");
                    const formattedUnitPriceElements = document.querySelectorAll(".formattedUnitPrice");

                    formattedTotalElements.forEach(element => {
                        element.textContent = formatPrice(element.textContent);
                    });

                    formattedUnitPriceElements.forEach(element => {
                        element.textContent = formatPrice(element.textContent);
                    });

                    function formatPrice(price) {
                        // Xóa ký tự "$" và định dạng lại số
                        price = price.replace("$", "");
                        price = parseFloat(price).toLocaleString("en-US", {style: "decimal"});
                        return price;
                    }
                </script>
        </main>
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
        <script src="javascript/myOrder.js"></script>
    </body>
</html>
