<%-- 
    Document   : BlogSettings
    Created on : Jun 4, 2023, 3:34:11 AM
    Author     : toden
--%>

<jsp:useBean id="helper" class="helper.helper"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Product Management</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">

        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

        <!-- Customized Bootstrap Stylesheet -->
        <link href="dashmincss/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="dashmincss/style.css" rel="stylesheet">

    </head>
    <body>

        <div class="container-xxl position-relative bg-white d-flex p-0">
            <!-- Spinner Start -->
            <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
                <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                    <span class="sr-only">Loading...</span>
                </div>
            </div>
            <!-- Spinner End -->

            <!-- Sidebar Start -->
            <div class="sidebar pe-4 pb-3" >
                <nav class="navbar bg-light navbar-light">
                    <a href="index.html" class="navbar-brand mx-4 mb-3">
                        <h3 class="text-primary"><i class="fa fa-hashtag me-2"></i>SALE</h3>
                    </a>
                    <div class="d-flex align-items-center ms-4 mb-4">
                        <div class="position-relative">
                            <img class="rounded-circle" src="https://t4.ftcdn.net/jpg/05/49/98/39/360_F_549983970_bRCkYfk0P6PP5fKbMhZMIb07mCJ6esXL.jpg" alt="" style="width: 40px; height: 40px;">
                            <div class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"></div>
                        </div>
                        <div class="ms-3">
                            <h6 class="mb-0">${sessionScope.acc.getFullName()}</h6>
                            <span>Sale</span>
                        </div>
                    </div>
                    <div class="navbar-nav w-100">
                        <a href="SaleDashboard" class="nav-item nav-link">Dashboard</a>
                        <a href="productSettings" class="nav-item nav-link active">Product Management</a>
                        <a href="OrderList" class="nav-item nav-link">Order List</a>
                    </div>
                </nav>
            </div>
            <!-- Sidebar End -->

            <!-- Content Start -->
            <div class="content">
                <!-- Navbar Start -->
                <nav class="navbar navbar-expand bg-light navbar-light sticky-top px-4 py-0">
                    <a href="index.html" class="navbar-brand d-flex d-lg-none me-4">
                        <h2 class="text-primary mb-0"><i class="fa fa-hashtag"></i></h2>
                    </a>
                    <a href="#" class="sidebar-toggler flex-shrink-0">
                        <i class="fa fa-bars"></i>
                    </a>
                    <form id="orderByFrm" action="productSettings" method="get" class="d-none d-md-flex ms-4">
                        <input class="form-control border-0" name="search" value="${search}" type="search" placeholder="Search">

                        Category:<select id="mySelect" name="category">
                            <option >All</option>
                            <c:forEach items="${categories}" var="c">
                                <option value="${c.getCategoryID()}" ${selectedCate==c.getCategoryID()?"selected":""} >${c.getCategoryName()}</option>
                            </c:forEach>
                        </select>
                    </form>
                    <div class="navbar-nav align-items-center ms-auto">
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                                <img class="rounded-circle me-lg-2" src="https://t4.ftcdn.net/jpg/05/49/98/39/360_F_549983970_bRCkYfk0P6PP5fKbMhZMIb07mCJ6esXL.jpg" alt="" style="width: 40px; height: 40px;">
                                <span class="d-none d-lg-inline-flex">${sessionScope.acc.getFullName()}</span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                                <a href="profile" class="dropdown-item">Hello-${acc.getFullName()}</a>
                                <a href="logout" class="dropdown-item">Log Out</a>
                            </div>
                        </div>
                    </div>
                </nav>
                <!-- Navbar End -->

                <!-- Recent Sales Start -->
                <div class="container-fluid pt-4 px-4">
                    <div class="bg-light text-center rounded p-4">
                        <div class="d-flex align-items-center justify-content-between mb-4">
                            <h6 class="mb-0">Product Manager</h6>
                            <a href="productSettings?add=1" class="btn btn-primary">Add Product</a>
                            
                        </div>
                        <div class="table-responsive">
                            <table class="table text-start align-middle table-bordered table-hover mb-0">
                                <thead>
                                    <tr>
                                        <td>#</td>
                                        <td>Name</td>
                                        <td>Image</td>
                                        <td>Price</td> 
                                        <td>Category</td>  
                                        <td></td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${sessionScope.products}" var="p" begin="${(pagination.getCurrentPage()-1)*pagination.getPerPage()}" end="${(pagination.getCurrentPage()*pagination.getPerPage()-1)<0?0:(pagination.getCurrentPage()*pagination.getPerPage()-1)}">
                                        <c:if test="${p.isStatus()}">
                                            <tr>
                                                <td>${p.getProductID()}</td>
                                                <td>${p.getProductName()}</td>
                                                <td><img src="images/productImage/${p.getProductImage().getUrl()}" width="300px" height="300px"></td>
                                                <td>${helper.convertToUSDollar(p.getPrice())}</td>
                                                <td>${p.getCategory().getCategoryName()}</td>
                                                <td><a href="ProductUpdate?id=${p.getProductID()}"><button style="margin: 1px" class="btn btn-primary">Update</button></a>
                                                    <a href=productSettings?id=${p.getProductID()}&del=1"><button style="margin: 1px" class="btn btn-danger">Delete</button></a></td>
                                            </tr>
                                        </c:if>

                                    </c:forEach>
                                </tbody>
                                <nav aria-label="Page navigation example">
                                    <ul class="pagination">
                                        <c:if test="${pagination.getCurrentPage()>1}" >
                                            <li class="page-item"><a class="page-link" href="productSettings?currentpage=1">First</a></li>
                                            <li class="page-item"><a class="page-link" href="productSettings?currentpage=${pagination.getCurrentPage()-1}">${pagination.getCurrentPage()-1}</a></li>
                                            </c:if>

                                        <li class="page-item active"><a class="page-link" href="productSettings?currentpage=${pagination.getCurrentPage()}">${pagination.getCurrentPage()}</a></li>
                                            <c:if test="${pagination.getCurrentPage()<pagination.getPageCount()}">
                                            <li class="page-item"><a class="page-link" href="productSettings?currentpage=${pagination.getCurrentPage()+1}">${pagination.getCurrentPage()+1}</a></li>
                                            <li class="page-item"><a class="page-link" href="productSettings?currentpage=${pagination.getPageCount()}">Last</a></li>
                                            </c:if>

                                    </ul>
                                </nav>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Content End -->
        </div>
        <c:set value="${orders}" var="OrderList" />

        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="lib/chart/chart.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/waypoints/waypoints.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>
        <script src="lib/tempusdominus/js/moment.min.js"></script>
        <script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
        <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

        <script>
            document.getElementById("mySelect").addEventListener("change", function () {
                document.getElementById("orderByFrm").submit();
            });

            var date = [];
            var data = [];
            (function ($) {
                "use strict";
                // Now you can use the JavaScript variable "myList"

                // Spinner
                var spinner = function () {
                    setTimeout(function () {
                        if ($('#spinner').length > 0) {
                            $('#spinner').removeClass('show');
                        }
                    }, 1);
                };
                spinner();


                // Back to top button
                $(window).scroll(function () {
                    if ($(this).scrollTop() > 300) {
                        $('.back-to-top').fadeIn('slow');
                    } else {
                        $('.back-to-top').fadeOut('slow');
                    }
                });
                $('.back-to-top').click(function () {
                    $('html, body').animate({scrollTop: 0}, 1500, 'easeInOutExpo');
                    return false;
                });


                // Sidebar Toggler
                $('.sidebar-toggler').click(function () {
                    $('.sidebar, .content').toggleClass("open");
                    return false;
                });


                // Progress Bar
                $('.pg-bar').waypoint(function () {
                    $('.progress .progress-bar').each(function () {
                        $(this).css("width", $(this).attr("aria-valuenow") + '%');
                    });
                }, {offset: '80%'});


                // Calender
                $('#calender').datetimepicker({
                    inline: true,
                    format: 'L'
                });


                // Testimonials carousel
                $(".testimonial-carousel").owlCarousel({
                    autoplay: true,
                    smartSpeed: 1000,
                    items: 1,
                    dots: true,
                    loop: true,
                    nav: false
                });


            })(jQuery);


        </script>

        
        <script>
            document.getElementById("mySelect").addEventListener("change", function () {
                document.getElementById("orderByFrm").submit();
            });
        </script>
    </body>
</html>
