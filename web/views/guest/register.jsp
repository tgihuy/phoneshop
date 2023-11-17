<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
    <head>
        <meta charset="UTF-8">
        <title>Registration Page</title>
        <link rel="stylesheet" href="css/register.css">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="js/register.js"></script>
    </head>
    <body>
        <div class="container">
            <div class="title">Registration</div>
            <br>
            <div style="color: red">${error}</div>
            <div class="content">
                <form id="form-2" action="register" method="post">
                    <div class="user-details">
                        <div class="input-box">
                            <span class="details">Full Name<span style="color: red"> *</span></span>
                            <input id="name" type="text" name="fullname" placeholder="Enter your name"class="form-control" required>
                            <span class="form-message"></span>
                        </div>
                        <div class="input-box">
                            <span class="details">Address<span style="color: red"> *</span></span>
                            <input id="address" type="text" name="address" placeholder="Enter your address" class="form-control" required>
                            <span class="form-message"></span>
                        </div>
                        <div class="input-box">
                            <span class="details">Email<span style="color: red"> *</span></span>
                            <input id="email" type="email" name="email" placeholder="Enter your email"class="form-control" required>
                            <span class="form-message"></span>
                        </div>
                        <div class="input-box">
                            <span class="details">Phone Number<span style="color: red"> *</span></span>
                            <input id="phone" type="tel" name="phone" placeholder="Enter your phone number" class="form-control"required>
                            <span class="form-message"></span>
                        </div>
                        <div class="input-box">
                            <span class="details">Password<span style="color: red"> *</span></span>
                            <input id="pass" type="password" name="pass" placeholder="Enter your password" class="form-control"required>
                            <span class="form-message"></span>
                        </div>
                        <div class="input-box">
                            <span class="details">Confirm Password<span style="color: red"> *</span></span>
                            <input id="repass" type="password" name="repass" placeholder="Confirm your password" class="form-control"required>
                            <span class="form-message"></span>
                        </div>
                    </div>
                    <ul class="tds-s-list" style="color:#01175e;
                        display:list-item;
                        font-family:Red Hat Display;
                        font-size:15px;
                        line-height:23px;
                        margin:0px 0px 7px 16px;
                        text-align:left">
                        <li class="tds-s-list-item">must contain at least 8 characters in length</li>
                        <li class="tds-s-list-item">must contain at least one upper case (A..Z)</li>
                        <li class="tds-s-list-item">must contain at least one lower case (a..z)</li>
                        <li class="tds-s-list-item">must contain at least 1 number</li>
                    </ul>

                    <div class="button">
                        <input type="submit" value="Register">
                    </div>
                    <div>
                        <p>Already have account ? <a href="login">Login</a> 
                            <a href="login"><button type="button" class="color-button">Canncel</button> </a></p>
                    </div>

                </form>
            </div>
        </div>
        <script src="javascript/validate.js"></script>
        <script>
            Validator({
                form: "#form-2",
                errrorSelector: ".form-message",
                rule: [
                    Validator.isRequired('#name'),
                    Validator.isRequired('#address'),
                    Validator.isEmail('#email'),
                    Validator.isPhone('#phone'),
                    Validator.isPassword('#pass'),
                    Validator.isRequired('#repass')
                ]
            });
        </script>
    </body>

</html>
