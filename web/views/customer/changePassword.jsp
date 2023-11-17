
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet">
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/login.css">
        <title>Change Password</title>
    </head>
    <body>
        <div class="container">
            <div class="title">Change Password</div>
            <br>
            <div style="color: red">${error}</div>
            <div class="content">
                <form action="changePassword" method="post">
                    <div class="user-details">
                        <div class="col-md-12">
                            <ol class="breadcrumb">
                                <li><a href="home">Home </a></li>
                                <li> / </li>
                                <li><a href="profile">Profile </a></li>
                                <li> / </li>
                                <li class="active">Change Password</li>
                            </ol>
                        </div>
                    </div>
                    <div class="user-details">
                        <div class="input-box">
                            <c:if test="${sc ne null}" >
                                <p style="color: red; font-size: 20px">${sc}</p>
                            </c:if>
                            <p class="details">Email<span style="color: red"> *</span></p>
                            <input type="email" id="email" name="email" required><br><br>
                            <c:if test="${ms2 ne null}" >
                                <p style="color: red; font-size: 20px">${ms2}</p>
                            </c:if>
                            <p class="details">Current Password<span style="color: red"> *</span></p>
                            <input type="password" id="currentPassword" name="currentPassword" required><br><br>
                            <c:if test="${ms1 ne null}" >
                                <p style="color: red; font-size: 20px">${ms1}</p>
                            </c:if>
                            <p class="details">New Password<span style="color: red"> *</span></p>
                            <input type="password" id="newPassword" name="newPassword" required><br><br>
                            <c:if test="${ms3 ne null}" >
                                <p style="color: red; font-size: 20px">${ms3}</p>
                            </c:if>
                            <p class="details">Confirm New Password<span style="color: red"> *</span></p>
                            <input type="password" id="confirmNewPassword" name="confirmNewPassword" required><br><br>

                        </div>
                    </div>
                    <div class="button">
                        <input type="submit" value="Change Password">
                    </div>
                </form>
            </div>
        </div>
        <script src="javascript/validate.js"></script>
        <script>
            Validator({
                form: "#form-5",
                errorSelector: ".form-message",
                rule: [
                    Validator.isEmail('#email')
                ]
            });
        </script>


    </body>
</html>
