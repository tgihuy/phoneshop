//    var container = document.getElementById('container');
//    var innerDivs = container.querySelectorAll('.order-content');
//    var totalDivs = innerDivs.length;
//    var visibleDivs = 5; // Số lượng thẻ div hiển thị ban đầu
//    var seeMoreBtn = document.getElementById('viewMoreBtn');
//
//    // Hiển thị số lượng thẻ div ban đầu
//    showDivs(visibleDivs);
//
//    // Hiển thị thêm 5 thẻ div khi nhấp vào nút "See more"
//    function showMoreDivs() {
//      visibleDivs += 5;
//      showDivs(visibleDivs);
//    }
//
//    // Hiển thị số lượng thẻ div được chỉ định
//    function showDivs(count) {
//      // Ẩn tất cả các thẻ div
//      var divs = document.getElementsByClassName('order-content');
//      for (var i = 0; i < divs.length; i++) {
//        divs[i].style.display = 'none';
//      }
//
//      // Hiển thị số lượng thẻ div được chỉ định
//      for (var j = 0; j < count; j++) {
//        if (j < totalDivs) {
//          divs[j].style.display = 'block';
//        }
//      }
//
//      // Ẩn nút "See more" nếu đã hiển thị tất cả thẻ div
//      if (count >= totalDivs) {
//        seeMoreBtn.style.display = 'none';
//      }
//    }

var seeMoreButton = document.getElementById('viewMoreBtn');
var orders = document.getElementsByClassName('order-content');
var orderContainer = document.getElementById('container');
//var container = document.getElementById('container');
//var innerDivs = container.querySelectorAll('.order-content');
// Số lượng thẻ div hiển thị ban đầu
var visibleOrders = 5;

// Ẩn các thẻ div từ visibleOrders+1 trở đi
hideOrdersAfter(visibleOrders);

// Xử lý sự kiện khi click vào nút "See More"
seeMoreButton.addEventListener('click', function() {
  // Hiển thị thêm 5 thẻ div
  visibleOrders += 5;
  showOrdersUpTo(visibleOrders);
  if (visibleOrders >= orders.length) {
    seeMoreButton.style.display = 'none'; // Ẩn nút "See More" nếu không còn item để hiển thị
  }
});

function hideOrdersAfter(index) {
  for (var i = index; i < orders.length; i++) {
    orders[i].style.display = 'none';
  }
}

function showOrdersUpTo(index) {
  for (var i = 0; i < orders.length; i++) {
    if (i < index) {
      orders[i].style.display = 'block';
    } else {
      orders[i].style.display = 'none';
    }
  }
}

const mySelect = document.getElementById("mySelect");
      mySelect.addEventListener("change", function() {
        const selectedValue = mySelect.value;
        const url = new URL(window.location.href);
        url.searchParams.set("value", selectedValue);
        window.history.replaceState({}, "", url.href);
        location.reload();
      });
