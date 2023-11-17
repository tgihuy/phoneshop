<%-- 
    Document   : SaleDashboard
    Created on : Jun 24, 2023, 8:19:46 PM
    Author     : toden
--%>
<jsp:useBean id="helper" class="helper.helper"/>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

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
                        <a href="SaleDashboard" class="nav-item nav-link active">Dashboard</a>
                        <a href="productSettings" class="nav-item nav-link">Product Management</a>
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
                    <form class="d-none d-md-flex ms-4">
                        <input class="form-control border-0" type="search" placeholder="Search">
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


                <!-- Sale & Revenue Start -->
                <div class="container-fluid pt-4 px-4">
                    <div class="row g-4">
                        <div class="col-sm-6 col-xl-3">
                            <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                                <i class="fa fa-chart-line fa-3x text-primary"></i>
                                <div class="ms-3">
                                    <p class="mb-2">Today Order</p>
                                    <h6 class="mb-0">${requestScope.ordertoday}</h6>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-xl-3">
                            <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                                <i class="fa fa-chart-bar fa-3x text-primary"></i>
                                <div class="ms-3">
                                    <p class="mb-2">Total Order</p>
                                    <h6 class="mb-0">${requestScope.orders.size()}</h6>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-xl-3">
                            <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                                <i class="fa fa-chart-area fa-3x text-primary"></i>
                                <div class="ms-3">
                                    <p class="mb-2">Today Revenue</p>
                                    <h6 class="mb-0">${helper.convertToUSDollar(requestScope.totaltoday)}</h6>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-xl-3">
                            <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                                <i class="fa fa-chart-pie fa-3x text-primary"></i>
                                <div class="ms-3">
                                    <p class="mb-2">Total Revenue</p>
                                    <h6 class="mb-0">${helper.convertToUSDollar(requestScope.total)}</h6>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Sale & Revenue End -->


                <!-- Sales Chart Start -->
                <div class="container-fluid pt-4 px-4">
                    <div class="row g-4">
                        <div class="col-sm-12 col-xl-12">
                            <div class="bg-light text-center rounded p-4">
                                <div class="d-flex align-items-center justify-content-between mb-4">
                                    <h6 class="mb-0">Sale & Revenue</h6>
                                </div>
                                <canvas id="sale-revenue"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Sales Chart End -->


                <!-- Recent Sales Start -->
                <div class="container-fluid pt-4 px-4">
                    <div class="bg-light text-center rounded p-4">
                        <div class="d-flex align-items-center justify-content-between mb-4">
                            <h6 class="mb-0">Recent Sale</h6>
                            <a href="OrderList">Show All</a>
                        </div>
                        <div class="table-responsive">
                            <table class="table text-start align-middle table-bordered table-hover mb-0">
                                <thead>
                                    <tr class="text-dark">
                                        <td scope="col">#</td>
                                        <td scope="col">Customer</td>
                                        <td scope="col">Total</td> 
                                        <td scope="col">Date</td>  
                                        <td scope="col">Note</td>
                                        <td scope="col">Address</td>
                                        <td scope="col">OrderStatus</td>
                                        <td></td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${requestScope.orders}" var="o" begin="0" end="4">
                                        <tr>
                                            <td></td>
                                            <td>${o.getCustomerName()}</td>
                                            <td>${helper.convertToUSDollar(o.getTotal())}</td>
                                            <td>${o.getDate()}</td>
                                            <td>${o.getNote()}</td>
                                            <td>${o.getAddress()}</td>
                                            <td>${o.getOrderStatus().getOrderStatusName()}</td>
                                            <td><a href="OrderDetail?id=${o.getOrderID()}" class="btn btn-sm btn-primary">Detail</a></td>
                                        </tr>
                                    </c:forEach>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Content End -->


            <!-- Back to Top -->
            <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
        </div>
        <c:set value="${jsonOrderList}" var="OrderList" />


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

        <!-- Template Javascript -->
        <script>
            var myOrder = ${OrderList};
            var date = [];
            var data = [];
            for (var i = myOrder.length - 1; i > myOrder.length - 7; i--) {
                console.log(myOrder[i]);
                if (myOrder[i] !== undefined) {
                    date.push(myOrder[i].date);
                    data.push(myOrder[i].total);
                }
            }
            ;
            (function ($) {
                "use strict";
                console.log(myOrder)
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


                

                // Sale & Revenue Chart
                var ctx2 = $("#sale-revenue").get(0).getContext("2d");
                var myChart2 = new Chart(ctx2, {
                    type: "line",
                    data: {
                        labels: date,
                        datasets: [
                            {
                                label: "Revenue",
                                data: data,
                                backgroundColor: "rgba(0, 156, 255, .3)",
                                fill: true
                            }
                        ]
                    },
                    options: {
                        responsive: true
                    }
                });
            })(jQuery);


        </script>
    </body>

</html>
