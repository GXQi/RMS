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

<div class="findPasswordReturn"><a href="/RMS/login">返回登录页</a></div>
<div class="loginTiele">简历管理平台</div>
<div class="findPasswordTiele">找回密码</div>
<div id="warning"><span id="warn">提示</span></div>

<form class="form-horizontal" role="form">
 <div class="form-group ">
        <div class="col-sm-4">
            <input type="text" class="form-control" id="phoneNumber" placeholder="手机号" name="phoneNumber"
                   onBlur="checkPhone()">
        </div>
        <label id="loginNamewarn"><span class="warn"><img src="../images/error.png"></span></label>
    </div>
    <div class="form-group">
        <div class="col-sm-2">
            <input type="text" class="form-control" id="registerFont" placeholder="验证码"
                   onblur="checkRegisterFont()">
        </div>
        <div >
            <span class="registerfont">获取验证码</span>
            <label id="registerFonewarn" class="loginwarn"><span class="warn"><img src="../images/error.png"></span></label>
        </div>
      <button type="submit" class="findSure">下一步</button>
</form>
</body>
</html>