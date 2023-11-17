<%-- 
    Document   : BlogDetail
    Created on : May 29, 2023, 4:04:36 AM
    Author     : toden
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../css/blogdetail.css">
        <link rel="stylesheet" href="css/style2.css">
        <%@include file="../component/head.jsp" %>
    </head>
    <body>
        <%@include file="../component/navbar.jsp" %>
        <!-- ...:::: Start Blog List Section:::... -->
        <div class="blog-section">
            <div class="container">

                <div class="row flex-column-reverse flex-lg-row">
                    <div class="col-lg-3">
                        <!-- Start Sidebar Area -->
                        <div class="siderbar-section" data-aos="fade-up" data-aos-delay="0">

                            

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
                <!-- start blog list -->
                <div class="blog-list">
                    <div class="blog-detail">
                        <div class="product-item" style="height: 90%;width: 90%">
                                <a title="product thumbnail" ><img src="images/blogImage/${blog.blogImage.url}" alt="" width="100%"></a>
                                <div class="product-info">
                                    <div class="title">
                                    <h4 class="product-title "><a class="product-name blog-cate">Author: ${blog.account.fullName}</a></h4>
                                    <h4 class="product-title "><a class="product-name mid">Post Date: ${blog.date.toString()}</a></h4>                                   
                                    <br>
                                    <h4 class="product-title"><a class="product-name">${blog.blogTitle}</a></h4>
                                    </div>
                                    <div class="product-description">
                                        <span>${blog.blogDetail}</span>
                                    </div>

                                </div>
                            </div>
                    </div>
                </div>

                <!-- end blog list -->
            </div>
        </div>
        <%@include file="../component/footer.jsp" %>
    </body>
</html>
