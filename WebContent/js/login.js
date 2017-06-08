function checkLoginPhone() {

            var loginPhone=document.getElementById('loginPhone').value;
            var reg = /^1[3|4|5|8][0-9]\d{4,8}$/;
            
            if (!reg.test(loginPhone)) {
                document.getElementById('warning').innerHTML = '请先输入您的正确手机号！';
                document.getElementById('loginPhone').focus();
            }
}

function checkFont() {
            
            var getfont=document.getElementById('findPasswordgetfont').value;

            if(getfont===undefined){
                document.getElementById('warning').innerHTML = '请输入验证码！';
                document.getElementById('findPasswordgetfont').focus()
            }
}

function checkPhone() {
    var loginPhone = document.getElementById("phoneNumber").value;
    var reg = /^1[3|4|5|8][0-9]\d{4,8}$/;
    if (!reg.test(loginPhone)) {
        document.getElementById('warning').innerHTML = '请先输入您的正确手机号！';
        document.getElementById('phoneNumber').focus();
    }
}

 function checkPassword() {
    var loginPassword = document.getElementById("loginPassword").value;
    if(loginPassword === ''){
        document.getElementById('warning').innerHTML = '请先输入您的正确密码！';
        document.getElementById('loginPassword').focus();
    }
}

 function checkRegisterPhone() {
     var Phone = document.getElementById('registerPhone').value;
     var reg = /^1[3|4|5|8][0-9]\d{4,8}$/;
     if (!reg.test(Phone)) {
         document.getElementById('warning').innerHTML = '请先输入您的正确手机号！';
         document.getElementById('registerPhone').focus();
     }
 }

 function checkRegisterFont() {
     var Font = document.getElementById('registerFont').value;
     if (Font.length<1) {
         document.getElementById('warning').innerHTML = '验证码错误';
         document.getElementById('registerFont').focus();
     }
 }

 function checkRegisterName() {
     var name = document.getElementById('registerName').value;
     if (name.length < 6 || name.length > 21) {
         document.getElementById('warning').innerHTML = '请输入6～20位的昵称';
         document.getElementById('registerName').focus();
     }
 }

 function checkRegisterpassword() {
     var password = document.getElementById('registerPassword').value;
     if (password.length < 6 || password.length > 21) {
         document.getElementById('warning').innerHTML = '请输入6～20位的密码';
         document.getElementById('registerPassword').focus();
     }
 }

 function checkRegisterPasswordAgain() {
     var password = document.getElementById('registerPassword').value;
     var passwordAgain = document.getElementById('registerPasswordAgain').value;
     console.log(password,passwordAgain);
     if (passwordAgain.length < 6 || passwordAgain.length > 21) {
         document.getElementById('warning').innerHTML = '请再次输入6～20位的密码';
         document.getElementById('registerPasswordAgain').focus();
     } else if (passwordAgain != password) {
         document.getElementById('warning').innerHTML = '两次密码不一致';
         document.getElementById('registerPassword').focus();
     }
 }
 
 function checkNewPassword() {
     var newpassword = document.getElementById('newpassword').value;
     if (newpassword === '') {
         document.getElementById('warning').innerHTML = '请输入密码！';
         document.getElementById('newpassword').focus()
     }
 }

 function checkFirmPassword() {
     var newpassword = document.getElementById('newpassword').value;
     var confirmPassword = document.getElementById('confirmPassword').value;
     if (confirmPassword === '') {
         document.getElementById('warning').innerHTML = '请输入确认密码！';
         document.getElementById('confirmPassword').focus()
     } else if (newpassword != confirmPassword) {
         document.getElementById('warning').innerHTML = '两次输入不同！';
         document.getElementById('newpassword').focus()
     }
 }
