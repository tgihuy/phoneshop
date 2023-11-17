<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">

    <head>
        <meta charset="UTF-8">
        <title>Login Page</title>
        <!---<title> Responsive Registration Form | CodingLab </title>--->
        <link rel="stylesheet" href="css/login.css">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="javascript/register.js"></script>
    </head>

    <body>
        <div class="container">
            <div class="title">Login</div>
            <br>
            <div style="color: red;">${error}</div>
            <div style="color: green;">${mess}</div>
            <div class="content">
                <form id="form-1" action="login" method="post">
                    <div class="user-details">
                        <div class="input-box">
                            <span class="details">Email<span style="color: red"> *</span></span>
                            <input id="email" type="text" name="email" placeholder="Enter your email" class="form-control"required>
                            <span class="form-message"></span>
                        </div>
                        <div class="input-box">
                            <span class="details">Password<span style="color: red"> *</span></span>
                            <input id="pass" type="password" name="password" placeholder="Enter your password" class="form-control"required>
                            <span class="form-message"></span>
                        </div>
                    </div>

                    <div class="button">
                        <input type="submit" value="Login">
                    </div>

                    <div>
                        <a href="forgotpassword" style="color:#0000ee;">Forgot Your Password?</a>
                        <p>Don't have account ? <a href="register">Register</a> 
                            <a href="home"><button type="button" class="color-button">Cancel</button> </a></p>
                    </div>
                </form>
            </div>
        </div>
            <script src="../../javascript/validate.js"></script>
        <script>
            Validator({
                form: "#form-1",
                errrorSelector: ".form-message",
                rule: [
                    Validator.isEmail("#email"),
                    Validator.isPassword('#pass')
                ]
            });
        </script>

    </body>

</html>