<%-- 
    Document   : home.jsp
    Created on : May 27, 2023, 6:05:55 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="helper" class="helper.helper"/>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/home.css">
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <title>Home</title>
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

        
        <div id="banner">
                <div class="box-left">
                    <h2>
                        <span>QUALITY</span>
                        <br>
                        <span>SMART PHONE</span>
                    </h2>
                    <p>Specializing in providing quality products to users, serving users in the most perfect way.</p>
                    <a href="ProductList">
                    <button>Buy Now</button>
                    </a>
                </div>
                <div class="box-right">
                    <img src="img/img_1.png" alt="">
                    <img src="assets/img_2.png" alt="">
                    <img src="assets/img_3.png" alt="">
                </div>
                <div class="to-bottom">
                    <a href="">
                        <img src="assets/to_bottom.png" alt="">
                    </a>
                </div>
            </div>


            <h1 class="title section2-header">NEWEST BLOG <span id="timer"><i class="fa fa-clock-o"></i></span></h1>
            <section class="section1">
                <c:forEach items="${requestScope.blogs}" var="b">
                    <div class="add-card" style="background: linear-gradient(rgba(1,1,1,.5), rgba(1,1,1,.5)), url(images/blogImage/${b.blogImage.url});">
                        <section>
                            <span class="title">${b.blogTitle}</span>
        <!--                    <span class="sub-title">${b.blogDetail}</span>-->
                            <a href="BlogDetail?id=${b.blogID}" class="btn1">Read Now</a>
                        </section>
                    </div>
                </c:forEach>
            </section>


            <h1 class="title section2-header">DEALS OF THE DAY <span id="timer"><i class="fa fa-clock-o"></i></span></h1>
            <section class="section2">
                <c:forEach items="${requestScope.cheapProduct}" var="rd">
                    <div class="deal-card">
                        <a href="ProductDetail?id=${rd.getProductID()}">
                            <img src="images/productImage/${rd.productImage.url}" alt="Deals">
                        </a>
                        <!--            <span class="discount"><i class="fa fa-percentage"></i> 20% OFF</span>-->
                        <c:if test="${rd.status==false}">
                            <span class="tag-2"><i class="fa fa-times"></i>Sold Out</span>
                        </c:if>
                        <c:if test="${rd.status==true}">
                            <span class="tag-2"><i class="fa fa-times"></i>Available</span>
                        </c:if>
                        <span class="title">${rd.productName}</span>
                        <c:if test="${rd.status==true}">
                            <a href="#" class="btn1">${helper.convertToUSDollar(rd.getPrice())}</a>
                        </c:if>
                        <c:if test="${rd.status==false}">
                            <a href="#" class="btn1 soldout">Sold Out</a>
                        </c:if>
                    </div>
                </c:forEach>

                <div class="deal-card advertise-card"></div>
            </section>
            <div class="section3-header">
                <h1 class="title">PRODUCTS YOU MAY LIKE</h1>
                <a href="ProductList" class="btn1 viewmore">View More</a>
                <button class="next" onclick='scrollright()'>><i class="fa fa-angle-right"></i></button>
                <button class="previous" onclick='scrollleft()'><<i class="fa fa-angle-left"></i></button>
            </div>
            <section class="section3" id="section3">
                <c:forEach items="${requestScope.recProduct}" var="rd">    
                    <div class="discount-card">
                        <a href="ProductDetail?id=${rd.getProductID()}">
                            <img src="images/productImage/${rd.productImage.url}" alt="Product">
                        </a>
                        <a href="#" class="like-button"><i class="fa fa-heart-o"></i></a>
                        <span class="title">${rd.productName}</span>
                        <!--        <span class="rating">
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star"></span>
                                    <span class="fa fa-star"></span>
                                (1,030)
                                </span>-->
                        <c:if test="${rd.status==true}">
                        <span class="btn1"><i class="fa fa-rupee"></i>${helper.convertToUSDollar(rd.getPrice())}</span> <!--<strike><i class="fa fa-rupee"></i>${rd.price}</strike>-->
                            </c:if>
                            <c:if test="${rd.status==false}">
                            <span class="btn1"><i class="fa fa-rupee"></i>Sold out</span> <!--<strike><i class="fa fa-rupee"></i>${rd.price}</strike>-->
                        </c:if>
                    </div>
                </c:forEach>


            </section>
            
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
            <script>
                document.addEventListener("click", closeAllSelect);
                    function scrollright(){
                      document.getElementById("section3").scrollLeft += 400;
                    }
                    function scrollleft(){
                      document.getElementById("section3").scrollLeft -= 400;
                    }
            </script>
    </body>
</html>
