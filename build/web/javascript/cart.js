//function updatePrice() {
//  var quantity = document.getElementsByClassName('number-input').value;
//  var price = document.getElementsByClassName('price').value;
//  var totalPrice = price * quantity;
//  document.getElementsByClassName('price').innerHTML = totalPrice + "VND";
//}

//function updatecart() {
//  var cart_item = document.getElementsByTagName("form")[0];
//  var cart_rows = cart_item.getElementsByClassName("cart-content");
//  var total = 0;
//  for (var i = 0; i < cart_rows.length; i++) {
//    var cart_row = cart_rows[i];
//    var price_item = cart_row.getElementsByClassName("price")[0];
//    var quantity_item = cart_row.getElementsByClassName("number-input")[0];
//    var price = parseInt(price_item.innerText);// chuyển một chuổi string sang number để tính tổng tiền.
//    var quantity = quantity_item.value; // lấy giá trị trong thẻ input
//    total = total + (price * quantity);
//  }
//  document.getElementsByClassName("cart-total-price")[0].innerText = total + 'VND';
//  // Thay đổi text = total trong .cart-total-price. Chỉ có một .cart-total-price nên mình sử dụng [0].
//}

//  document.addEventListener('DOMContentLoaded', function() {
//        function unpdatecart(){
//            var cart_item = document.getElementsByTagName("form")[0];
//            var cart_rows = cart_item.getElementsByClassName("cart-content");
//            var total = 0;
//            for (var i = 0; i < cart_rows.length; i++) {
//              var cart_row = cart_rows[i];
//              var price_item = cart_row.getElementsByClassName("price")[0];
//              var quantity_item = cart_row.getElementsByClassName("number-input")[0];
//              var price = parseInt(price_item.innerText);// chuyển một chuổi string sang number để tính tổng tiền.
//              var quantity = quantity_item.value; // lấy giá trị trong thẻ input
//              total = total + (price * quantity);
//            }
//            document.getElementsByClassName("cart-total-price")[0].innerText = total + 'VND';
//            document.getElementsByClassName("cart-total-price").value = total;
//            // Thay đổi text = total trong .cart-total-price. Chỉ có một .cart-total-price nên mình sử dụng [0].
//        }
//});
//
//var quantity_input = document.getElementsByClassName("number-input");
//for (var i = 0; i < quantity_input.length; i++) {
//  var input = quantity_input[i];
//  input.addEventListener("change", function (event) {
//    updatecart();
//  });
//}




