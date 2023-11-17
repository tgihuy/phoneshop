var buttons = document.getElementsByClassName("color-button");

for (var i = 0; i < buttons.length; i++) {
  buttons[i].addEventListener("click", function() {
    // Xóa lớp "active" khỏi tất cả các button
    for (var j = 0; j < buttons.length; j++) {
      buttons[j].classList.remove("active");
    }
    
    // Thêm lớp "active" vào button được nhấn
    this.classList.add("active");
  });
}
