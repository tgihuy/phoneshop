//const form = document.querySelector('#myForm');
const usernameInput = document.querySelector('.name');
const emailInput = document.querySelector('.email');
const phonenumInput = document.querySelector('.phonenum');
const addressInput = document.querySelector('.address');

//form.addEventListener('submit', (event)=>{
//    
//    validateForm();
//    console.log(isFormValid());
//    if(isFormValid()===true){
//        form.submit();
//     }else {
//         event.preventDefault();
//     }
//
//});
//
//function isFormValid(){
//    const inputContainers = form.querySelectorAll('.input-group');
//    let result = true;
//    inputContainers.forEach((container)=>{
//        if(container.classList.contains('error')){
//            result = false;
//        }
//    });
//    return result;
//}
//
//function validateForm() {
//    //USERNAME
//    if(usernameInput.value.trim().length < 2 || usernameInput.value.trim().length > 20){
//        setError(usernameInput, 'Name must be min 2 and max 20 charecters');
//    }else {
//        setSuccess(usernameInput);
//    }
//    //EMAIL
//    if(isEmailValid(emailInput.value)){
//        setSuccess(emailInput);
//    }else{
//        setError(emailInput, 'Provide valid email address');
//    }
//
//    if(phonenumInput.value.trim().length !== 10){
//        setError(phonenumInput, 'Phone number length must be 10!');
//    }else {
//        setSuccess(phonenumInput);
//    }
//    //CONFIRM PASSWORD
//    if(addressInput.value.length < 10 ){
//        setError(addressInput, 'Please input detailed address like this: số 18 Lạc Long Quân, Hồ Tây, Hà Nội');
//    }else {
//        setSuccess(addressInput);
//    }
//}

usernameInput.addEventListener("input", function() {
  // Kiểm tra tính hợp lệ của tên
  if (usernameInput.value.trim().length < 2 || usernameInput.value.trim().length > 20) {
    setError(usernameInput, 'Name must be min 2 and max 20 characters');
  } else {
    setSuccess(usernameInput);
  }
});

// Sự kiện "text change" cho emailInput
emailInput.addEventListener("input", function() {
  // Kiểm tra tính hợp lệ của email
  if (isEmailValid(emailInput.value)) {
    setSuccess(emailInput);
  } else {
    setError(emailInput, 'Provide valid email address');
  }
});

// Sự kiện "text change" cho phonenumInput
phonenumInput.addEventListener("input", function() {
  // Kiểm tra tính hợp lệ của số điện thoại
  if (phonenumInput.value.trim().length !== 10) {
    setError(phonenumInput, 'Phone number length must be 10!');
  } else {
    setSuccess(phonenumInput);
  }
});

// Sự kiện "text change" cho addressInput
addressInput.addEventListener("input", function() {
  // Kiểm tra tính hợp lệ của địa chỉ
  if (addressInput.value.length < 10) {
    setError(addressInput, 'Please input detailed address like this:\n\
    số 18 Lạc Long Quân, Hồ Tây, Hà Nội');
  } else {
    setSuccess(addressInput);
  }
});

function setError(element, errorMessage) {
    const parent = element.parentElement;
    if(parent.classList.contains('success')){
        parent.classList.remove('success');
    }
    parent.classList.add('error');
    const paragraph = parent.querySelector('p');
    paragraph.textContent = errorMessage;
}

function setSuccess(element){
    const parent = element.parentElement;
    if(parent.classList.contains('error')){
        parent.classList.remove('error');
    }
    parent.classList.add('success');
}

function isEmailValid(email){
    const reg =/^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;

    return reg.test(email);
}



