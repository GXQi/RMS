<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link href="/RMS/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="/RMS/css/login.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="/RMS/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/RMS/js/jquery-3.1.0.min.js"></script>
    <script type="text/javascript" src="/RMS/js/login.js"></script>
    <title>resetPassword</title>
</head>
<body>

<div class="findPasswordReturn"><a href="/RMS/login">返回登录页</a></div>
<div class="loginTiele">简历管理平台</div>
<div class="findPasswordTiele">密码重置</div>
<div id="warning"><span id="warn">提示</span></div>
<form class="form-horizontal" role="form" method="POST" action="/RMS/login/resetPassword"  onsubmit="return check()">
    <div class="form-group ">
        <div class="col-sm-4">
            <input type="password" class="form-control" id="newpassword" name="newpassWord" placeholder="新密码"
                   onblur="checkRegisterpassword()">
        </div>
        <label id="resetpasswarn" class="loginwarn"><span class="warn"><img src="/RMS/images/error.png"></span></label>
    </div>
    <div class="form-group ">
        <div class="col-sm-4">
            <input type="password" class="form-control" id="confirmPassword" placeholder="确认密码" name="rePassword"
                   onblur="checkFirmPassword()">
        </div>
        <label id="resetpassAgainwarn" class="loginwarn"><span class="warn"><img src="/RMS/images/error.png"></span></label>
    </div>
    <div>
    	<div name="phoneNumber" class="resernumber" style="visibility: hidden;">${remphone}</div>
    </div>
    <button type="submit" class="loginSure" onclick="return check()">完成</button>  
</form>

</body>
</html>