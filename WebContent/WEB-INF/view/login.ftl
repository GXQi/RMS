<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="login.css" type="text/css">
    <title>login</title>
</head>
<script>
    function input() {
        var loginPhone = document.getElementById("loginPhone").value;
        var loginPassword = document.getElementById("loginPassword").value;
        var reg = /^1[3|4|5|8][0-9]\d{4,8}$/;
        if (!reg.test(loginPhone)) {
            document.getElementById('warning').innerHTML = '请先输入您的正确手机号！';
            document.getElementById('loginPhone').focus();
        } else if(loginPassword === ''){
            document.getElementById('warning').innerHTML = '请先输入您的正确密码！';
            document.getElementById('loginPassword').focus();
        }
    }
</script>
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
        <div class="col-sm-4">
            <input type="password" class="form-control" id="loginPassword"
                   placeholder="密码">
        </div>
    </div>
</form>

<span class="loginFind">找回密码</span>

<div class="loginSure" onclick="input()">
    <span class="loginSpan">登录</span>
</div>
<div class="loginAsk">还没有帐号？<span class="loginSign">注册</span></div>

</body>
</html>