<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
   <link href="/RMS/css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<link href="/RMS/css/login.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="/RMS/js/jquery-3.1.0.min.js"></script>
    <script type="text/javascript" src="/RMS/js/login.js"></script>
    <title>findPassword</title>
</head>
<body>

<div class="findPasswordReturn">返回登录页</div>
<div class="loginTiele">简历管理平台</div>
<div class="findPasswordTiele">找回密码</div>
<div id="warning"><span id="warn">提示</span></div>

<form class="form-horizontal" role="form">
    <div class="form-group ">
        <div class="col-sm-4">
            <input type="text" class="form-control" id="loginPhone" placeholder="手机号" onblur="checkLoginPhone()">
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-2 findPasswordInput">
            <input type="password" class="form-control" id="longinPassword" placeholder="验证码" onblur="checkFont()">
        </div>
        <div  class="findPasswordget"><span class="findPasswordgetfont" id="findPasswordgetfont">获取验证码</span></div>
    </div>
</form>
<div class="loginSure">
    <span class="findpasswordspan">下一步</span>
</div>
</body>
</html>