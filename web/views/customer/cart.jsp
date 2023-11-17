<jsp:useBean id="helper" class="helper.helper"/>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="../css/cart.css">
        <link rel="stylesheet" href="../css/bootstrap.css">
        <link rel="stylesheet" href="../css/bootstrap.min.css">

    </head>
    <div id="myModal" class="modal">
        <div class="modal-content">
            <img src="../images/icon/close.jpg" alt="Close" class="close" id="closeModal">
            <p>You need add to cart before purchase. </p>
        </div>
    </div>


    <style>
        /* CSS cho modal */
        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            font-family: Arial, sans-serif;
        }

        .modal-content {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: #fff;
            padding: 20px;
            border: 1px solid #ccc;
            text-align: center;
            font-size: 18px;
        }

        .close {
            width: 24px; /* Kích thước hình ảnh */
            height: 24px;
            cursor: pointer;
        }

        .cross-out {
            text-decoration: line-through;
        }
    </style>


</style>

</div>

<body>
    <header>
        <div class="navbar">
            <h1 class="logo"><a href="../">Mobile Shop</a></h1>
            <nav class="header-link">
                <ul class="navigation">
                    <li><a href="../ProductList">Product List</a></li>
                    <li><a href="../BlogController">Blog</a></li>
                    <li><a href="#">Contact</a></li>
                    <li><a href="#">About Us</a></li>
                </ul>
                <c:if test="${not empty acc.accountID}">
                    <a href="../home/cart" class="cart-button">My Cart</a>
                    <div class="login">
                        <a href="../profile" class="login-link">Hello ${acc.getFullName()}</a>
                    </div>
                    <a href="../logout" class="cart-button">Logout</a>
                </c:if>
                <c:if test="${empty acc.accountID}">
                    <a href="login" class="cart-button">My Cart</a>
                    <div class="login">
                        <a href="login" class="login-link">Sign in</a>
                    </div>
                </c:if>
            </nav>
        </div>
    </header>
    <main>
        <div class="sidebar">
            <button class="close-button">&times;</button>
            <h2>Category</h2>
            <ul>
                <c:forEach items="${requestScope.categories}" var="c">
                    <c:if test="${c.categoryID == 7}">
                        <li><a href="combo"><h3>${c.categoryName} ></h3></a></li>
                        </c:if>
                        <c:if test="${c.categoryID != 7}">
                        <li><a href="ProductList?cateID=${c.categoryID}"><h3>${c.categoryName} ></h3></a></li>
                        </c:if>
                    </c:forEach>
            </ul>
        </div>

        <div class="cart-detail">
            <h1>CART DETAIL</h1>
            <div class="line"></div>
        </div>
        <div class="cart-titles">
            <h2>Product</h2>
            <h2>Name</h2>
            <h2>Quantity</h2>
            <h2>Price</h2>
        </div>
        <form action="cart" method="post">
            <c:forEach items="${requestScope.cds}" var="cds">        
        <div class="cart-content">
            <img src="../images/productImage/${cds.p.productImage.url}">
            <input type="hidden" name="productID" value="${cds.p.productID}">
            <h3 class="cart-name">${cds.p.productName}</h3>
            <input type="number" class="number-input" min="1" name="quantity" value="${cds.quantity}" onchange="updatePrice()">
            <h3 class="price" name="price" data-price="${cds.p.price}">${cds.p.price}</h3>
            <a class="delete-button" onchange="updatecart()" href="../delete?pid=${cds.p.productID}">
                <img src="../images/icon/delete.png">
            </a>
        </div>
    </c:forEach>
     
    <div class="button">
        <a href="../">Cancel</a>
        <button class="buy" type="submit">Buy now</button>
    </div>
</form>

<script>
    function updatePrice() {
        const priceElements = document.querySelectorAll(".price");
        let total = 0;
        priceElements.forEach(function(element) {
            const priceInUSD = parseFloat(element.getAttribute("data-price"));
            const quantity = parseFloat(element.parentElement.querySelector(".number-input").value);
            total += priceInUSD * quantity;
            const formattedPrice = new Intl.NumberFormat('en-US', { style: 'currency', currency: 'USD' }).format(priceInUSD * quantity);
            element.textContent = formattedPrice;
        });
        
        const totalElement = document.querySelector(".cart-total-price");
        const formattedTotal = new Intl.NumberFormat('en-US', { style: 'currency', currency: 'USD' }).format(total);
        totalElement.textContent = formattedTotal;
    }
    
    updatePrice();
</script>
            <script>
                function updatecart() {
                    var cart_item = document.getElementsByTagName("form")[0];
                    var cart_rows = cart_item.getElementsByClassName("cart-content");
                    var total = 0;
                    for (var i = 0; i < cart_rows.length; i++) {
                        var cart_row = cart_rows[i];
                        var price_item = cart_row.getElementsByClassName("price")[0];
                        var quantity_item = cart_row.getElementsByClassName("number-input")[0];
                        var price = parseInt(price_item.innerText);
                        var quantity = quantity_item.value;
                        total = total + (price * quantity);
                    }
                    document.getElementsByClassName("cart-total-price")[0].innerText = '$' + total;
                    document.getElementsByClassName("cart-total").value = total;
                }

                document.addEventListener('DOMContentLoaded', function () {
                    updatecart();
                });

                var quantity_input = document.getElementsByClassName("number-input");
                for (var i = 0; i < quantity_input.length; i++) {
                    var input = quantity_input[i];
                    input.addEventListener("change", function (event) {
                        updatecart();
                    });
                }

                document.addEventListener("DOMContentLoaded", function () {
                    const buyButton = document.querySelector(".buy");
                    const modal = document.getElementById("myModal");
                    const closeModal = document.getElementById("closeModal");

                    buyButton.addEventListener("click", function (event) {
                        const cartContents = document.querySelectorAll(".cart-content");
                        if (cartContents.length === 0) {
                            modal.style.display = "block"; // Hiển thị modal
                            event.preventDefault(); // Ngăn chặn hành động mua hàng mặc định
                        } else {
                            // Nếu có sản phẩm trong giỏ, tiến hành gửi form để mua hàng
                            document.querySelector("form").submit();
                        }
                    });

                    closeModal.addEventListener("click", function () {
                        modal.style.display = "none"; // Tắt modal khi người dùng nhấp vào nút đóng (x)
                    });
                });
            </script>

        </form> 

    </main>
    <footer>
        <h2 class="col-md-8">2023 Mobile Shop. All rights reserved.</h2>
        <!--            <div class="col-md-4 links">
                        <a href="">
                            <h2>About Us</h2>
                        </a>
                        <a href="">
                            <h2>Contact Us</h2>
                        </a>
                    </div>-->
        <p class="col-md-4"> FPT University, Thach That, Ha Noi</br>
            Tel: (028) 38489828 </br>
            Email: shopphonefptno1@gmail.com </br>
            Date of issue: Oct 1 2023 by Group 2
        </p>
    </footer>       

    <script src="../javascript/home.js"></script>

</body>

</html>
