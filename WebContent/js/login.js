var code;
function creatCode() {
    code = '';
    var codeLength = 6;
    var checkCode = document.getElementById("checkCode");
    var codeChars = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9,
        'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
        'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'); //所有候选组成验证码的字符，当然也可以用中文的
    for (var i = 0; i < codeLength; i++) {
        var charNum = Math.floor(Math.random() * 52);
        code += codeChars[charNum];
    }
    if (checkCode) {
        checkCode.className = "code";
        checkCode.innerHTML = code;
    }
}
function checkRegisterFont() {
    var Font = document.getElementById('registerFont').value;
    console.log(Font.toUpperCase(), code.toUpperCase());
    if (Font.length <= 0) {
        document.getElementById('registerFonewarn').innerHTML = '请输入验证码';
        document.getElementById('registerFont').focus();

    }
    else if (Font.toUpperCase() != code.toUpperCase()) {
        document.getElementById('registerFonewarn').innerHTML = '验证码错误';
        document.getElementById('registerFont').focus();
        creatCode();
    }
    else {
        document.getElementById('registerFonewarn').innerHTML = '';
    }
}

function checkLoginPhone() {

            var loginPhone=document.getElementById('loginPhone').value;
            var reg = /^1[3|4|5|7|8][0-9]\d{4,8}$/;
            
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
    var loginPhone = document.getElementById('phoneNumber').value;
    var reg = /^1[3|4|5|7|8][0-9]\d{4,8}$/;

    if (!reg.test(loginPhone)) {
        document.getElementById('loginNamewarn').innerHTML = '请先输入您的正确手机号！';
        document.getElementById('phoneNumber').focus();
    } else {
        document.getElementById('loginNamewarn').innerHTML = '';

    }  
}

 function checkPassword() {
    var loginPassword = document.getElementById("loginPassword").value;
    if (loginPassword === '') {
        document.getElementById('loginPasswarn').innerHTML = '请先输入您的正确密码！';
        document.getElementById('loginPassword').focus();
    } else {
        document.getElementById('loginPasswarn').innerHTML = '';
    } 
}

 function checkRegisterPhone() {
     var Phone = document.getElementById('registerPhone').value;
     var reg = /^1[3|4|5|7|8][0-9]\d{4,8}$/;
     if (!reg.test(Phone)) {
         document.getElementById('registerNumberwarn').innerHTML = '请先输入您的正确手机号！';
         document.getElementById('registerPhone').focus();
     }else {
         document.getElementById('registerNumberwarn').innerHTML = '';
     }
     
     
 }

 function checkRegisterName() {
     var name = document.getElementById('registerName').value;
     if (name.length < 6 || name.length > 21) {
         document.getElementById('registerNamewarn').innerHTML = '请输入6～20位的昵称';
         document.getElementById('registerName').focus();
     }else {
         document.getElementById('registerNamewarn').innerHTML = '';
     }
 }

 function checkRegisterpassword() {
	 var password = document.getElementById('registerPassword').value;
	    if (password.length < 6 || password.length > 21) {
	        document.getElementById('registerpasswarn').innerHTML = '请输入6～20位的密码';
	        document.getElementById('registerpasswarn').focus();
	    }else {
	        document.getElementById('registerpasswarn').innerHTML = '';
	    }
 }

 function checkRegisterPasswordAgain() {
	 var password = document.getElementById('registerPassword').value;
	    var passwordAgain = document.getElementById('registerPasswordAgain').value;
	    console.log(password,passwordAgain);
	    if (passwordAgain.length < 6 || passwordAgain.length > 21) {
	        document.getElementById('registerpassAgainwarn').innerHTML = '请再次输入6～20位的密码';
	        document.getElementById('registerPasswordAgain').focus();
	    } else if (passwordAgain != password) {
	        document.getElementById('registerpassAgainwarn').innerHTML = '两次密码不一致';
	        document.getElementById('registerPassword').focus();
	    }else {
	        document.getElementById('registerpassAgainwarn').innerHTML = '';
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
