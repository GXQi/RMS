<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link href="./css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<link href="./css/login.css" rel="stylesheet" type="text/css">
    <title>login</title>
</head>
<script>
    function input() {
        var loginPhone = document.getElementById("loginPhone").value;
        var loginPassword = document.getElementById("loginPassword").value;
        if (loginPhone === '' || loginPassword === '') {
            document.getElementById('warning').innerHTML = '帐号或密码有误';
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
<div class="loginAsk">还没有帐号？<span class="loginSign"><a href="/RMS/register">注册</a></span></div>

</body>
</html>