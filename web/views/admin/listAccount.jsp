<%-- 
    Document   : AdminDashboard
    Created on : Jun 25, 2023, 4:18:41 PM
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
            table {
                width: 100%;
                border-collapse: collapse;
            }

            th, td {
                padding: 8px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }

            th {
                background-color: #f2f2f2;
            }
            .add-account-btn {
                display: inline-block;
                padding: 10px 20px;
                background-color: #337ab7;
                color: #fff;
                text-decoration: none;
                border-radius: 5px;
            }

            .add-account-btn:hover {
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

                <div class="search-box">
                    <i class="uil uil-search"></i>
                    <input type="text" placeholder="Search here...">
                </div>

                
            </div>

            <div class="dash-content">
                <div class="activity">
                    <div class="title">                       
                        <a href="addaccount" class="add-account-btn">Add Account</a>
                    </div>


                    <table>
                        <thead>
                            <tr>
                                <th>Account Id</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Role</th>
                                <th>Address</th>
                                <th>Phone</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${requestScope.acclist}" var="a">
                                <tr>
                                    <td value="${a.accountID}" name="accid">${a.accountID}</td>
                                    <td>${a.fullName}</td>
                                    <td>${a.email}</td>
                                    <td>${a.role.getRoleName()}</td>
                                    <td>${a.address}</td>
                                    <td>${a.phoneNumber}</td>
                                    <td>
                                        <span id="status_${a.accountID}">
                                            <c:choose>
                                                <c:when test="${a.status}">
                                                    True
                                                </c:when>
                                                <c:otherwise>
                                                    False
                                                </c:otherwise>
                                            </c:choose>
                                        </span>
                                    </td>
                                    <td>
                                        <a href="changestatus?accountID=${a.accountID}&status=${a.status}" onclick="toggleStatus(${a.accountID})"style="text-decoration: none">Toggle</a>
                                    </td>
                                </tr>
                            </c:forEach>


                        </tbody>
                    </table>
                    <script>
                        function toggleStatus(accountId) {
                            var statusElement = document.getElementById("status_" + accountId);
                            var currentStatus = statusElement.textContent;
                            var newStatus = (currentStatus === "True") ? "False" : "True";
                            statusElement.textContent = newStatus;

                            // Sử dụng fetch để gửi yêu cầu AJAX đến máy chủ
                            fetch('changestatus?accountID=' + accountId + '&status=' + newStatus)
                                .then(response => {
                                    if (response.ok) {
                                        // Xử lý thành công
                                        console.log("Account " + accountId + ": status updated successfully");
                                    } else {
                                        // Xử lý khi gặp lỗi
                                        console.error("Error updating status for account " + accountId);
                                    }
                                })
                                .catch(error => {
                                    console.error("An error occurred: " + error);
                                });
                        }
                    </script>
                </div>
            </div>
        </div>
    </section>

    <script src="javascript/admin.js"></script>
</body>
</html>
