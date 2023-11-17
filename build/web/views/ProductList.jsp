<jsp:useBean id="helper" class="helper.helper"/>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/style3.css">
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="font/font-awesome.min.css">
        <title>Product List</title>

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

        <div class="container">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="home">Home </a></li>
                    <li class="breadcrumb-item" active>Product List</li>
                </ol>
            </nav>
            <div class="category">
                <h1>CATEGORIES</h1>
                <div class="line"></div>
            </div>

            <!--Show category--> 
            <div class="category-content">
                <c:forEach items="${requestScope.listCategories}" var="c">
                    <div class="col-md-3">
                        <input type="hidden" name="categoryID" value="${tag == c.categoryID ? 'active' : ''}"/>                        
                        <a href="category?categoryId=${c.categoryID}"><img src="${c.catImage}"></a>    
                        <a class="categoryName" href=""><h3>${c.categoryName}</h3></a>
                    </div>
                </c:forEach>
            </div>

            <!--Start product list-->
            <div class="recommend-phone">
                <h1>PRODUCT LISTS</h1>
                <div class="line"></div>
            </div>

            <!--Search product by name-->
            <div class="sider">
                <form action="search" class="d-flex mx-auto">
                    <input
                        value="${key}"
                        class="form-search me-2"
                        type="search"
                        placeholder="Search product here ..."
                        aria-label="Search"
                        name="keyword"
                        />
                    <button class="btn btn-outline-success" type="submit">
                        Search
                    </button>
                </form>                      
            </div>

            <section class="section2">
                <c:forEach items="${requestScope.listProducts}" var="p">
                    <div class="deal-card">
                        <a href="ProductDetail?id=${p.getProductID()}">
                            <img src="images/productImage/${p.productImage.url}" alt="">
                        </a>
                        <span class="title">${p.productName}</span>
                        <c:if test="${p.status==true}">
                            <span class="title">${helper.convertToUSDollar(p.getPrice())}</span>
                        </c:if>
                        <c:if test="${p.status==false}">
                            <span class="title">Sold Out</span> 
                        </c:if>
                        <div style="text-align: center;">
                            <a href="ProductDetail?id=${p.getProductID()}" class="btn btn-primary">Show more</a>
                        </div>
                    </div>
                </c:forEach>
                <div class="Pagination">
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
            </section>
        </div>
        <footer>
            <h2 class="col-md-8">2023 Mobile Shop. All rights reserved.</h2>
            <p class="col-md-4"> FPT University, Thach That, Ha Noi</br>
                Tel: (028) 38489828 </br>
                Email: shopphonefptno1@gmail.com </br>
                Date of issue: Oct 1 2023 by Group 2
            </p>
        </footer>        
        <script src="javascript/home.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>
