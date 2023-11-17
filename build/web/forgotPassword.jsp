<%-- 
    Document   : forgotpassword
    Created on : May 17, 2023, 3:57:25 PM
    Author     : admin
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!doctype html>
<html>
    <head>
        <meta charset='utf-8'>
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
        <link href="css/forgotpassword.css" rel="stylesheet" type="text/css"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="login/fonts/icomoon/style.css">

        <link rel="stylesheet" href="css/owl.carousel.min.css">

        <link rel="stylesheet" href="css/style_1.css">

        <title>Phoneshop</title>
        <link rel="icon" href="img/favicon.png" />   


    </head>
    <body>



        <div style="border: 1px solid #ccc; display: flex; justify-content: center; align-items: center; height: 50vh;">
            <div style="width: 70%; display: flex; flex-direction: column; align-items: center;">
                <div style="text-align: center;">
                    <h3 class="text-uppercase">Forgot Password <a class="text-uppercase" style="color: red;"><strong>Mobile Shop</strong></a></h3>
                </div>
                <div class="d-md-flex half" style="width: 50%;">
                    <div class="container" style="width: 50%;">
                        <div class="forgot" style="width: 100%;">
                            <form action="forgotpassword" method="POST">
                                <div class="form-group last mb-3">
                                    <label for="email-for-pass">Enter your email address</label>
                                    <input class="form-control" type="text" name="email" id="email-for-pass" required="" value="${sessionScope.email}">
                                </div>
                                <c:if test="${ not empty requestScope.warning}">
                                    <div class="alert alert-danger alert-dismissible">
                                        <button type="button" class="close" data-dismiss="alert">×</button>
                                        ${requestScope.warning}
                                    </div>
                                </c:if>
                                <input type="submit" value="Get New Password" class="btn btn-block py-2 btn-primary">

                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>





    <script type='text/javascript'
    src='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js'></script>

</body>
</html>
