<%-- 
    Document   : ProductDetail
    Created on : Jun 11, 2023, 10:44:10 PM
    Author     : toden
--%>

<jsp:useBean id="helper" class="helper.helper"/>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>

        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Product Detail</title>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700" rel="stylesheet">
        <link rel="stylesheet" href="../css/productdetail.css">
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
        <div class="container">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="home">Home </a></li>
                    <li class="breadcrumb-item"><a href="ProductList">Product List</a></li>
                    <li class="breadcrumb-item active">Product detail</li>
                </ol>   
            </nav>    
            <div class="card" style="margin-top: 20px">
                <div class="container-fliud">
                    <div class="wrapper row">
                        <div class="preview col-md-6">

                            <div class="preview-pic tab-content">
                                <div class="tab-pane active" id="pic-1"><img id="mainImg" width="370px" height="350px" src="images/productImage/${requestScope.p.getProductImage().getUrl()}" /></div>
                            </div>
                        </div>
                        <div class="details col-md-6">
                            <h3 id="name" class="product-title">${requestScope.p.getProductName()}</h3>
                            <span id="brand" class="product-title">${requestScope.p.getCategory().getCategoryName()}</span>
                            <!--                                                        <div class="rating">
                                                                                        <div class="stars">
                                                                                            <span class="fa fa-star checked"></span>
                                                                                            <span class="fa fa-star checked"></span>
                                                                                            <span class="fa fa-star checked"></span>
                                                                                            <span class="fa fa-star"></span>
                                                                                            <span class="fa fa-star"></span>
                                                                                        </div>
                                                                                        <span class="review-no">${requestScope.feedbacks.size()} reviews</span>
                                                                                    </div>-->
                            <c:if test="${p.status==true}">
                                <h4 class="price">Current price: <span id="price">${helper.convertToUSDollar(requestScope.p.getPrice())}</span></h4>
                                </c:if>
                                <c:if test="${p.status==false}">
                                <span class="price">Price: Sold Out</span> 
                            </c:if>
                            <form action="home" method="post">
                                <h4 class="price" for="quantity">Quantity:
                                    <span class="btn" onclick="decrement(event)">-</span>
                                    <input name="quantity" size="3" type="number" id="quantity" value="1" min="1" max="99">
                                    <span class="btn" onclick="increment(event)">+</span>
                                </h4>
                                <input hidden name="productID" value="${requestScope.p.getProductID()}" />
                                <div class="action">
                                    <c:if test="${p.status==true}">
                                        <c:if test="${sessionScope.acc.getRole().getRoleID()==1}">
                                            <button type="submit" name="home" id="addBtn" class="add-to-cart btn btn-default" type="button" onclick="showMessage()">Add To Cart</button>
                                            <button type="submit" name="buyNow" value="1" class="like btn btn-default" type="button"><span class="">Buy Now</span></button>
                                        </c:if>
                                    </c:if>
                                    <c:if test="${p.status==false}">
                                        <span class="title">Out of Stock</span> 
                                    </c:if>

                                </div>
                            </form>

                        </div>

                        <div class="col-md-6">
                            <h2 style="padding: 10px; border-bottom: 1px solid lightgray; margin-top: 20px;">Overall Information</h2>
                            ${requestScope.p.getDetails()}
                        </div>        

                        <!--<!-- comment -->
                        <div class="row d-flex justify-content-center mb-4">
                            <div class="col-md-12 col-lg-12">
                                <div class="card shadow-0 border" style="background-color: #f0f2f5;">
                                    <div class="card-body p-4">
                                        <div class="form-outline mb-4">
                                            <c:if test="${sessionScope.acc == null}">
                                                <label class="form-label" for="addANote"><s>+ Comment</s><p style="color: red">Sigin in to comment</p></label>
                                                    </c:if>
                                                    <c:if test="${sessionScope.acc != null}">
                                                <form action="ProductDetail" method="post">
                                                    <input name="content" type="text" id="addANote" class="form-control" placeholder="Type comment..." required/>
                                                    <label class="form-label" for="addANote">+ Comment</label>
                                                    <button class="btn btn-primary " type="submit">Post commment</button>
                                                    <input hidden value="${requestScope.p.getProductID()}" name="id" />
                                                </form> 
                                            </c:if>    

                                        </div>

                                        <c:forEach items="${requestScope.detailfeedbacks}" var="f" >
                                            <c:if test="${!f.isIsDeleted()}">
                                                <c:set var="isLike" value="false"/>
                                                <div class="card mb-4">
                                                    <div class="card-body">
                                                        <p>${f.getFcontent()}</p>

                                                        <div class="d-flex justify-content-between">
                                                            <div class="d-flex flex-row align-items-center">
                                                                <img src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/img%20(32).webp" alt="avatar" width="25"
                                                                     height="25" />
                                                                <p class="small mb-0 ms-2">${f.getAccount().getFullName()}</p>
                                                            </div>
                                                            <div class="d-flex flex-row align-items-center">

                                                                <c:if test="${sessionScope.acc == null}">
                                                                    <label class="form-label" for="addANote"><s>Reply</s></label>
                                                                        </c:if>
                                                                        <c:if test="${sessionScope.acc != null}">
                                                                    <form action="ProductDetail" method="post">
                                                                        <input name="reply" type="text" id="addANote" class="form-control" placeholder="Your Reply..." required/>

                                                                        <button class="btn btn-primary " type="submit">Post Reply</button>
                                                                        <input hidden value="${f.getFeedbackID()}" name="fid" />
                                                                        <input hidden value="${requestScope.p.getProductID()}" name="id" />
                                                                    </form> 
                                                                </c:if> 


                                                                <c:forEach items="${f.getLikes()}" var="like">
                                                                    <c:if test="${sessionScope.acc.getAccountID()==like.getAccountID()}">
                                                                        <c:set var="isLike" value="true"/>
                                                                        <a href="ProductDetail?fid=${f.getFeedbackID()}&id=${requestScope.p.getProductID()}" class="fas fa-thumbs-up mx-2 fa-xs text-black" style="margin-top: -0.16rem; "></a>
                                                                    </c:if>
                                                                </c:forEach>
                                                                <c:if test="${!isLike}">
                                                                    <a href="ProductDetail?action=addlike&fid=${f.getFeedbackID()}&id=${requestScope.p.getProductID()}" class="far fa-thumbs-up mx-2 fa-xs text-black" style="margin-top: -0.16rem;"></a>
                                                                </c:if>

                                                                <p class="small text-muted mb-0">${f.getLikes().size()}</p>
                                                            </div>

                                                        </div>
                                                        <c:if test="${sessionScope.acc.getRole().getRoleID()==4||f.getAccount().getAccountID()==sessionScope.acc.getAccountID()}">
                                                            <div><a href="ProductDetail?fid=${f.getFeedbackID()}&delf=1&id=${requestScope.p.getProductID()}">Delete</a></div>
                                                        </c:if>
                                                        <!-- Reply -->
                                                        <c:forEach items="${f.getReplys()}" var="rep">
                                                            <c:if test="${!rep.isIsDeleted()}">
                                                                <div class="card mb-4">
                                                                    <div class="card-body">
                                                                        <p>${rep.getContent()}</p>

                                                                        <div class="d-flex justify-content-between">
                                                                            <div class="d-flex flex-row align-items-center">
                                                                                <img src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/img%20(32).webp" alt="avatar" width="25"
                                                                                     height="25" />
                                                                                <p class="small mb-0 ms-2">${rep.getAccount().getFullName()}</p>
                                                                            </div>


                                                                        </div>
                                                                        <c:if test="${sessionScope.acc.getRole().getRoleID()==4||rep.getAccount().getAccountID()==sessionScope.acc.getAccountID()}">
                                                                            <div><a href="ProductDetail?delr=1&id=${requestScope.p.getProductID()}&rid=${rep.getReplyID()}">Delete</a></div>
                                                                        </c:if>
                                                                    </div>
                                                                </div>
                                                            </c:if>

                                                        </c:forEach>                                                       

                                                        <!-- Reply -->

                                                    </div>
                                                </div>
                                            </c:if>


                                        </c:forEach>

                                    </div>
                                </div>
                            </div>

                        </div>
                        <c:if test="${sessionScope.acc.getRole().getRoleID()==4}">
                            <div><a href="${pageContext.request.contextPath}/FeedbackList" class="btn btn-primary">Back</a></div>
                        </c:if>
                    </div>
                    <section class="py-5 bg-light">
                        <div class="container px-4 px-lg-5 mt-5">
                            <h2 class="fw-bolder mb-4">Related products</h2>
                            <section class="section2">
                                <c:forEach items="${requestScope.listLast}" var="p">
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
                                        <a href="ProductDetail?id=${p.getProductID()}" class="btn btn-primary">Show more</a>
                                    </div>
                                </c:forEach>
                            </section> 
                        </div>
                    </section>
                </div>
            </div>
        </div>
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
        <script src="javascript/home.js"></script>
        <script>
                                                function showMessage() {
                                                    alert("Add successfull!");
                                                    ;
                                                }
                                                let name = document.getElementById("name")
                                                let brand = document.getElementById("brand")
                                                let type = document.getElementById("type")
                                                let description = document.getElementById("description")
                                                let price = document.getElementById("price")
                                                let color = document.getElementById("color")
                                                let sale = document.getElementById("sale")
                                                let guarantee = document.getElementById("guarantee")



                                                function increment(e) {
                                                    var quantityField = document.getElementById('quantity');
                                                    var quantity = parseInt(quantityField.value);
                                                    if (quantity < 99)
                                                        quantityField.value = quantity + 1;
                                                    if (quantity >= 99)
                                                        quantityField.value = 99
                                                }

                                                function decrement(e) {
                                                    var quantityField = document.getElementById('quantity');
                                                    var quantity = parseInt(quantityField.value);
                                                    if (quantity > 1) {
                                                        quantityField.value = quantity - 1;
                                                    }
                                                    if (quantity < 1)
                                                        quantityField.value = 1
                                                }

                                                function changeImg(event) {
                                                    var newhref = event.target.getAttribute("src");
                                                    document.getElementById("mainImg").setAttribute("src", newhref);
                                                }

        </script>
    </body>
</html>
