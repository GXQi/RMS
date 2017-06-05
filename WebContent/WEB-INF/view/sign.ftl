<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link href="./css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<link href="./css/login.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="./js/jquery-3.1.0.min.js"></script>
    <title>sign</title>

    <script>
        function getCode() {
            var loginPhone = document.getElementById('loginPhone').value;
            var reg = /^1[3|4|5|8][0-9]\d{4,8}$/;
            if (!reg.test(loginPhone)) {
                document.getElementById('warning').innerHTML = '请先输入您的正确手机号！';
                document.getElementById('loginPhone').focus();
            }

            var paras = "loginPhone=" + loginPhone;
            //jquery post方法同步提交
            //（提交地址；   data：返回值）
//            $.post('<%=basePath%>mobile/sendCode?'+paras,function(data) {
            var data = 1;//
            if (data != null && typeof(data) != "undefined") {
//                    var msg = data.msg;  //返回值为json格式
                var msg = "SUCCESS";
                if (msg != null && typeof(msg) != "undefined" && msg == "SUCCESS") {
                    get_code_time();
                } else {
                    alert("短信验证码发送失败！请重新获取。");
                }
            } else {
                alert("短信验证码发送失败！请重新获取。");
            }
//            },"json");
        }
        var wait = 60;
        function get_code_time() {
            if (wait == 0) {
                document.getElementById('time').innerHTML = '获取验证码';
                wait = 60;
            } else {
                document.getElementById('time').innerHTML = '剩余（' + wait + ')秒';
                wait--;
                setTimeout("get_code_time()", 1000);
            }
        }

        function sign() {

            var loginPhone = document.getElementById('loginPhone').value;
            var reg = /^1[3|4|5|8][0-9]\d{4,8}$/;
            var checkNumber = document.getElementById('checkNumber').value;
            var name = document.getElementById('name').value;
            var password = document.getElementById('password').value;
            var passwordAgain = document.getElementById('passwordAgain').value;

            if (!reg.test(loginPhone)) {
                document.getElementById('warning').innerHTML = '请先输入您的正确手机号！';
                document.getElementById('loginPhone').focus();
            } else if (checkNumber === '') {
                document.getElementById('warning').innerHTML = '验证码错误';
                document.getElementById('checkNumber').focus();
            } else if (name.length < 6 || name.length > 21) {
                document.getElementById('warning').innerHTML = '请输入6～20位的昵称';
                document.getElementById('name').focus();
            } else if (password.length < 6 || password.length > 21) {
                document.getElementById('warning').innerHTML = '请输入6～20位的密码';
                document.getElementById('password').focus();
            } else if (passwordAgain != password) {
                document.getElementById('warning').innerHTML = '两次密码不一致';
                document.getElementById('password').focus();
            }
        }

    </script>

</head>
<body>
<div class="loginTiele">简历管理平台</div>
<div id="warning"><span id="warn">提示</span></div>
<form class="form-horizontal" role="form">
    <div class="form-group ">
        <div class="col-sm-4">
            <input type="text" class="form-control" id="loginPhone" placeholder="手机号" required>
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-2 findPasswordInput">
            <input type="text" class="form-control" id="checkNumber"
                   placeholder="验证码">
        </div>
        <div class="findPasswordget" id="time" onclick="getCode()">
            <span class="findPasswordgetfont">获取验证码</span>
        </div>
    </div>
    <div class="form-group ">
        <div class="col-sm-4">
            <input type="text" class="form-control" id="name" placeholder="昵称" required>
        </div>
    </div>
    <div class="form-group ">
        <div class="col-sm-4">
            <input type="password" class="form-control" id="password" placeholder="密码" required>
        </div>
    </div>
    <div class="form-group ">
        <div class="col-sm-4">
            <input type="password" class="form-control" id="passwordAgain" placeholder="确认密码" required>
        </div>
    </div>
</form>
<div class="loginSure" onclick="sign()">
    <span class="loginSpan">注册</span>
</div>
<div class="signAsk">已有帐号？<span class="loginSign">登录</span></div>
</body>
</html>