<%-- 
    Document   : newpassword
    Created on : May 17, 2023, 10:18:40 PM
    Author     : admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
                            <form action="resetpassword" method="post">
                                <div class="form-group first">
                                    <label for="password">New password</label>
                                    <input type="password" class="form-control" placeholder="Your New Password" name="password" id="password">
                                </div>
                                <c:if test="${ not empty requestScope.message2}">
                                <div class="alert alert-danger alert-dismissible">
                                    <button type="button" class="close" data-dismiss="alert">×</button>
                                    ${requestScope.message2}
                                </div>
                                </c:if>
                                <div class="form-group last mb-3">
                                    <label for="confpassword">Confirm New Password</label>
                                    <input type="password" class="form-control" placeholder="Confirm New Password" name="confpassword" id="confpassword">
                                </div>
                                <c:if test="${ not empty requestScope.message3}">
                                <div class="alert alert-danger alert-dismissible">
                                    <button type="button" class="close" data-dismiss="alert">×</button>
                                    ${requestScope.message3}
                                </div>
                                </c:if>
                                <input type="submit" value="Reset" class="btn btn-block py-2 btn-primary">
                            </form>

                        </div>
                    </div>
                </div>
            </div>


        </div>



        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>
