<%-- 
    Document   : head
    Created on : Jun 3, 2023, 10:16:45?PM
    Author     : toden
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="../css/home.css">
<header>
    <div class="navbar">
        <button class="sidebar-button">&#9776; Menu</button>
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

<style>
    .dropdown {
        margin-left: 7px;
        margin-right: 7px;
    }

    .dropdown-toggle {
        display: block;
        padding: 8px;
        font-size: 16px;
        background-color: #f2f2f2;
        border: 1px solid #ccc;
        border-radius: 4px;
        text-decoration: none;
        color: #333;
    }

    .dropdown-toggle::after {
        content: "\25BE"; /* Unicode character for down arrow */
        margin-left: 5px;
    }

    .dropdown-menu {
        position: absolute;
        top: 100%;
        left: 0;
        z-index: 1;
        display: none;
        padding: 0;
        margin: 0;
        list-style: none;
        background-color: #f2f2f2;
        border: 1px solid #ccc;
        border-top: none;
        border-radius: 0 0 4px 4px;
    }

    .dropdown-menu li {
        padding: 8px;
    }

    .dropdown-menu li a {
        display: block;
        text-decoration: none;
        color: #333;
    }

    .dropdown:hover .dropdown-menu {
        display: block;
    }

</style>

