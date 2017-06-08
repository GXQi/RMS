<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="login.css" type="text/css">
    <script type="text/javascript" src="bootstrap-3.3.7-dist/js/jquery-3.1.0.min.js"></script>
    <title>sign</title>

    <script>

        function checkPhone() {
            var Phone = document.getElementById('signPhone').value;
            var reg = /^1[3|4|5|8][0-9]\d{4,8}$/;
            if (!reg.test(Phone)) {
                document.getElementById('warning').innerHTML = '请先输入您的正确手机号！';
                document.getElementById('signPhone').focus();
            }
        }

        function checkFont() {
            var Font = document.getElementById('signFont').value;
            if (Font.length<1) {
                document.getElementById('warning').innerHTML = '验证码错误';
                document.getElementById('signFont').focus();
            }
        }

        function checkName() {
            var name = document.getElementById('signName').value;
            if (name.length < 6 || name.length > 21) {
                document.getElementById('warning').innerHTML = '请输入6～20位的昵称';
                document.getElementById('signName').focus();
            }
        }

        function checkpassword() {
            var password = document.getElementById('signPassword');
            if (password.length < 6 || password.length > 21) {
                document.getElementById('warning').innerHTML = '请输入6～20位的密码';
                document.getElementById('signPassword').focus();
            }
        }

        function checkPasswordAgain() {
            var password = document.getElementById('signPassword');
            var passwordAgain = document.getElementById('signPasswordAgain');
            if (passwordAgain.length < 6 || passwordAgain.length > 21) {
                document.getElementById('warning').innerHTML = '请输入6～20位的密码';
                document.getElementById('skgnPasswordAgain').focus();
            } else if (passwordAgain != password) {
                document.getElementById('warning').innerHTML = '两次密码不一致';
                document.getElementById('signPassword').focus();
            }
        }
    </script>

</head>
<body class="signBody">
<div class="loginTiele">简历管理平台</div>
<div id="warning"><span id="warn">提示</span></div>
<form class="form-horizontal" role="form">
    <div class="form-group ">
        <div class="col-sm-4">
            <input type="text" class="form-control" id="signPhone" placeholder="手机号" onblur="checkPhone()">
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-2 findPasswordInput">
            <input type="text" class="form-control" id="signFont" placeholder="验证码" onblur="checkFont()">
        </div>
        <div class="findPasswordget" id="time">
            <span class="findPasswordgetfont">获取验证码</span>
        </div>
    </div>
    <div class="form-group ">
        <div class="col-sm-4">
            <input type="text" class="form-control" id="signName" placeholder="昵称" onblur="checkName()">
        </div>
    </div>
    <div class="form-group ">
        <div class="col-sm-4">
            <input type="password" class="form-control" id="signPassword" placeholder="密码" onblur="checkpassword()">
        </div>
    </div>
    <div class="form-group ">
        <div class="col-sm-4">
            <input type="password" class="form-control" id="signPasswordAgain" placeholder="确认密码"
                   onblur="checkPasswordAgain()">
        </div>
    </div>
    <input type="submit" value="注册">

</form>
<div class="signAsk">已有帐号？<span class="loginSign"><a href="/RMS/login">登录</a></span></div>
</body>
</html>