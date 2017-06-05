<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="./css/bootstrap.min.css" type="text/css">
    <script type="text/javascript" src="./js/bootstrap.min.js"></script>
    <script type="text/javascript" src="./js/jquery-3.1.0.min.js"></script>
    <link rel="stylesheet" href="./css/login.css.css" type="text/css">
    <script type="text/javascript" src="login.js"></script>
    <title>login</title>
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
        <div class="col-sm-4">
            <input type="password" class="form-control" id="longinPassword"
                   placeholder="密码">
        </div>
    </div>
</form>

<span class="loginFind">找回密码</span>

<div class="loginSure">
    <span class="loginSpan">登录</span>
</div>
<div class="loginAsk">还没有帐号？<span class="loginSign">注册</span></div>

</body>
</html>