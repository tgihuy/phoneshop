<%-- 
    Document   : BlogList
    Created on : May 29, 2023, 4:04:26 AM
    Author     : toden
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/style2.css">
        <%@include file="../component/head.jsp" %>
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
        <!-- ...:::: Start Blog List Section:::... -->
        <div class="blog-section">
            <div class="container">

                <div class="row flex-column-reverse flex-lg-row">
                    <div class="col-lg-3">
                        <!-- Start Sidebar Area -->
                        <div class="siderbar-section" data-aos="fade-up" data-aos-delay="0">
                            <div class="sidebar-single-widget">
                                <h6 class="sidebar-title">Sort<div class="line-container"></div>
                                </h6>
                                <div class="sidebar-content">
                                <form action="BlogController" method="GET">
                                    <input type="radio" name="order" value="NTO" id="NTO" ${NTO}> New To Old
                                    <br>
                                    <input type="radio" name="order" value="OTN" id="OTN" ${OTN}> Old To New
                                    <br>
                                    <button type="submit" value="Find" class="submit-button">Find</button>
                                </form>
                                </div>
                            </div>
                            <!-- Start Single Sidebar Widget -->
                            <div class="sidebar-single-widget">
                                <h6 class="sidebar-title">Latest Post<div class="line-container"></div>
                                </h6>
                                <div class="sidebar-content">
                                    <c:forEach var="pro" items="${latestList}">
                                        <div class="tag-link">
                                            <img src="images/blogImage/${pro.blogImage.url}"
                                                 alt="">

                                            <div class="title">
                                                ${pro.blogTitle}
                                            </div>

                                            <a href="BlogDetail?id=${pro.blogID}">
                                                <p>Read more</p>
                                                <img src="https://cdn3.iconfinder.com/data/icons/arrow-outline-8/32/right_2-256.png"
                                                     alt="">
                                            </a>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div> <!-- End Single Sidebar Widget -->

                        </div> <!-- End Sidebar Area -->
                    </div>

                </div>
                <div class="container-right">
                    <!-- start blog list -->
                    <div class="blog-list">
                        <c:forEach var="p" items="${bloList}">
                            <div class="blog">
                                <a href="blogdetail?id=${p.blogID}">
                                    <img src="images/blogImage/${p.blogImage.url}"
                                         alt="">
                                </a>
                                <div class="content">
                                    <div class="blog-title">
                                        ${p.blogTitle}
                                    </div>
                                    <p class="info">
                                        ${p.blogDetail}
                                    </p>
                                    <a href="BlogDetail?id=${p.blogID}">Read more
                                        <img src="https://cdn3.iconfinder.com/data/icons/arrow-outline-8/32/right_2-256.png"
                                             alt="">
                                    </a>
                                </div>

                            </div>
                        </c:forEach>   

                    </div>

                    <!-- end blog list -->
                    <div class="pagination">
                        <c:if test="${currentPage > 1}">
                            <a href="?page=${currentPage - 1}" class="arror"><<</a>
                        </c:if>

                        <c:forEach var="page" begin="1" end="${totalPages}">
                            <c:choose>
                                <c:when test="${page == currentPage}">
                                    <a class="current-page">${page}</a>
                                </c:when>
                                <c:otherwise>
                                    <a href="?page=${page}">${page}</a>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>

                        <c:if test="${currentPage < totalPages}">
                            <a href="?page=${currentPage + 1}" class="arror" >>></a>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="../component/footer.jsp" %>
    </body>
</html>

