<%-- 
    Document   : BlogAdd
    Created on : Jun 4, 2023, 3:50:09 AM
    Author     : toden
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>SALE - Bootstrap Admin Template</title>
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
        <script src="https://cdn.ckeditor.com/4.21.0/standard/ckeditor.js"></script>
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
                        <a href="productSettings" class="nav-item nav-link">Product Management</a>
                        <a href="OrderList" class="nav-item nav-link">Order List</a>


                        <!--                        <div class="nav-item dropdown">
                                                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="far fa-file-alt me-2"></i>Pages</a>
                                                    <div class="dropdown-menu bg-transparent border-0">
                                                        <a href="signin.html" class="dropdown-item">Sign In</a>
                                                        <a href="signup.html" class="dropdown-item">Sign Up</a>
                                                        <a href="404.html" class="dropdown-item">404 Error</a>
                                                        <a href="blank.html" class="dropdown-item">Blank Page</a>
                                                    </div>
                                                </div>-->
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
                    <div class="bg-light rounded p-4">
                        <div class="d-flex align-items-center justify-content-between mb-4">
                            <h6 class="mb-0">Add Product</h6>
                        </div>
                        <div class="table-responsive">
                            <form method="post" action="productSettings" enctype="multipart/form-data">
                                <div class="form-outline">
                                    <label class="form-label" for="formControlLg">Product Name</label>

                                    <input required name="title"  type="text" id="formControlLg" class="form-control form-control-lg" />
                                </div>
                                <div class="md-form">
                                    <label for="form7">Detail</label>
                                    <textarea id="content" required name="detail" id="detail" class="md-textarea form-control" rows="3"></textarea>

                                </div>
                                <div class="md-form">
                                    <label for="form7">Price</label>
                                    <input required name="price"  type="number" id="formControlLg" class="form-control form-control-lg" />

                                </div>
                                <br>
                                <select required name="category" class="select">
                                    <c:forEach items="${sessionScope.categories}" var="b">
                                        <option value="${b.getCategoryID()}">${b.getCategoryName()}</option> 
                                    </c:forEach>
                                </select>
                                <br>
                                <div class="form-outline">
                                    <label for="formFileMultiple" class="form-label">Images</label>
                                    <input required name="images" class="form-control" type="file" id="formFileMultiple" />
                                </div>
                                <span style="color: red">${requestScope.err}</span>
                                <br>
                                <button type="submit" class="btn btn-primary">Upload</button>
                            </form>
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
            CKEDITOR.replace('detail');
        </script>

    </body>
</html>
