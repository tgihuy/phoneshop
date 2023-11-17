<%-- 
    Document   : Order
    Created on : Jun 17, 2023, 1:03:31 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/home.css">
        <link rel="stylesheet" href="css/cart.css">
        <link rel="stylesheet" href="css/order.css">
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
                        <li><a href="component/contact.jsp">Contact</a></li>
                        <li><a href="component/aboutUs.jsp">About Us</a></li>
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
                <c:forEach items="${sessionScope.categories}" var="c">
                    <li><a href=""><h3>${c.categoryName} ></h3></a></li>
                </c:forEach>
            </ul>
        </div>            
        <main>
            <div class="Orders">
                <h1>MY ORDERS</h1>
                <div class="line"></div>
            </div>
            <div class="tool">
                <form action="myOrder" method="GET">
                    <input type="text" name="name" placeholder="Search by name of product">
                    Or <input type="date" name="date">
                    <input type="submit" value="Search">
                </form>
                <select id="mySelect" name="value">
                    <option>Sort order by:</option>
                    <option value="0">Sort by price:high to low</option>
                    <option value="1">Sort by price:low to high</option>
                    <option value="2">Sort by date</option>
                </select>
            </div>
            <div class="orderStatus">
                    <a href="myOrder?status=0"><h4>All</h4></a>
                    <a href="myOrder?status=1"><h4>Preparing</h4></a>
                    <a href="myOrder?status=2"><h4>Delivering</h4></a>
                    <a href="myOrder?status=3"><h4>Delivered</h4></a>
                    <a href="myOrder?status=4"><h4>Fail To Delivery</h4></a>
                    <a href="myOrder?status=5"><h4>Cancel</h4></a>
            </div>
            <div id="container">
                <div class="title">                    
                    <h4>Customer Name</h4>
                    <h4>Payment method</h4>
                    <h4>Total</h4>
                    <h4>Date</h4>
                    <h4>Status</h4>
                </div>
                <c:forEach items="${requestScope.orders}" var="o" varStatus="loop">
                    <div class="order-content">
                        <div class="order-info">
                            <h4>${loop.index + 1}</h4>
                            <h4>${o.getCustomerName()}</h4>
                            <h4>${o.getPaymentMethod()}</h4>
                            <h4><span class="formattedTotal">${o.getTotal()} $</span></h4>
                            <h4>${o.getDate()}</h4>
                            <h4>${o.orderStatus.getOrderStatusName()}</h4>
                        </div>
                        <a href="myOrder/orderDetail?id=${o.getOrderID()}"><img src="images/icon/eye.png" alt="alt"/></a>
                    </div>
                </c:forEach>
                <script>
                    const formattedTotalElements = document.querySelectorAll(".formattedTotal");
                    formattedTotalElements.forEach(element => {
                        element.textContent = formatPrice(element.textContent);
                    });

                    function formatPrice(price) {
                        return price.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                    }
                </script>
            </div>
            <c:if test="${not empty requestScope.orders}">
                <button id="viewMoreBtn" onclick="showMoreDivs()">View more</button>
            </c:if>
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
    <script src="javascript/home.js"></script>
    </body>
</html>
