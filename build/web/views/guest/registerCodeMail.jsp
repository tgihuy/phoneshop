<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">

    <head>
        <meta charset="UTF-8">
        <title>Verification Register Page</title>
        <!---<title> Responsive Registration Form | CodingLab </title>--->
        <link rel="stylesheet" href="css/registerCodeMail.css">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="js/register.js"></script>
    </head>

    <body>
        <div class="container">          
            <div class="title">Please check code in your email</div>
            <br>
            <div style="color: red;">${error}</div>
            <div class="content">
                <form id="form-3" action="active" method="post">
                    <div class="user-details">
                        <div class="input-box">
                            <span class="details">Enter the code from your email</span>
                            <input id="code" type="text" name="validateCode" placeholder="Enter your code" class="form-control" required>
                            <span class="form-message"></span>
                        </div>
                    </div>

                    <div class="button">
                        <input type="submit" value="Active">
                    </div>
                    <div>
                        <p><a href="register"><button type="button" class="color-button">Cancel</button> </a></p>
                    </div>
                </form>
            </div>
        </div>

        <script src="javascript/validate.js"></script>
        <script>
            Validator({
                form: "#form-3",
                errrorSelector: '.form-message',
                rule: [
                    Validator.isRequired('#code')
                ]
            });
        </script>
    </body>

</html>