<%-- 
    Document   : AddNewUser
    Created on : Jun 26, 2023, 12:01:13 AM
    Author     : ngxso
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!----======== CSS ======== -->
        <link rel="stylesheet" href="css/admin.css">

        <!----===== Iconscout CSS ===== -->
        <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">

        <title>Admin Dashboard Panel</title>
        <style>
            .form-container {
                display: flex;
                flex-direction: column;
                gap: 10px;
            }

            input[type="text"],
            input[type="password"],
            select {
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }

            .status-container {
                display: flex;
                gap: 10px;
            }

            .status-container label {
                display: flex;
                align-items: center;
            }

            input[type="radio"] {
                appearance: none;
                -webkit-appearance: none;
                -moz-appearance: none;
                width: 15px;
                height: 15px;
                vertical-align: middle;
                margin-right: 5px;
                border: 1px solid #ccc;
                border-radius: 50%;
            }

            input[type="radio"]:checked {
                background-color: #337ab7;
                border-color: #337ab7;
            }

            label {
                font-weight: bold;
            }
            .submit-button {
                padding: 10px 20px;
                background-color: #337ab7;
                color: #fff;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }

            .submit-button:hover {
                background-color: #23527c;
            }

        </style>
    </head>

    <body>
        <nav>
            <div class="logo-name">
                <span class="logo_name">Admin Dashboard</span>
            </div>

            <div class="menu-items">
                <ul class="nav-links">
                    
                    <li><a href="manageacc">
                            <i class="uil uil-files-landscapes"></i>
                            <span class="link-name">Account List</span>
                        </a></li>
                </ul>

                <ul class="logout-mode">
                    <li><a href="logout">
                            <i class="uil uil-signout"></i>
                            <span class="link-name">Logout</span>
                        </a></li>


                </ul>
            </div>
        </nav>

        <section class="dashboard">
            <div class="top">
                <i class="uil uil-bars sidebar-toggle"></i>

            </div>

            <div class="dash-content">


                <div class="activity">
                    <div class="title">
                        <span class="text">Add Account</span>
                    </div>
                    <form method="post" action="addaccount">
                        <div class="form-container">
                            <span class="details">Email<span style="color: red"> *</span></span>
                            <input type="text" name="email" placeholder="Email" required>

                            <span class="details">Password<span style="color: red"> *</span></span>
                            <input type="password" name="password" placeholder="Password" required>

                            <span class="details">Role<span style="color: red"> *</span></span>
                            <div class="status-container">
                                <select name="roleid" required>
                                    <option value="0">Select Role</option>
                                    <c:forEach items="${requestScope.listR}" var="r">
                                        <option value="${r.roleID}">${r.roleName}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <span class="details">Name<span style="color: red"> *</span></span>
                            <input type="text" name="fullname" placeholder="Full Name" required>

                            <span class="details">Phone Number<span style="color: red"> *</span></span>
                            <input type="text" name="phonenum" placeholder="Phone Number" required>

                            <span class="details">Address</span>
                            <input type="text" name="address" placeholder="Address">
                            <br>
                            
                            
                            <button type="submit" class="submit-button">Submit</button>
                        </div>
                    </form>

                </div>

            </div>
        </section>

        <script src="javascript/admin.js"></script>
    </body>
</html>
