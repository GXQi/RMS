<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
     <link href="/RMS/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="/RMS/css/login.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="/RMS/js/jquery-3.1.0.min.js"></script>
    <script type="text/javascript" src="/RMS/js/login.js"></script>
    <title>sign</title>
</head>
<body class="signBody">
<div class="loginTiele">简历管理平台</div>
<br>
<#if warnEmployee?exists>
   <div class="loginwarn">帐号已存在</div>
</#if>
<form class="form-horizontal" role="form" method="POST" action="/RMS/submitUser">
    <div class="form-group ">
        <div class="col-sm-4">
            <input type="text" class="form-control" id="registerPhone" name="phoneNumber" placeholder="手机号" onblur="checkRegisterPhone()">
        </div>
         <label id="registerNumberwarn" class="loginwarn"><span class="warn"><img src="/RMS/images/error.png"></span></label>
    </div>   
    
       <div class="form-group">
        <div class="col-sm-2">
            <input type="text" class="form-control" id="registerFont" placeholder="验证码"
                   onblur="checkRegisterFont()">
        </div>
        <div >
            <span class="registerfont">获取验证码</span>
            <label id="registerFonewarn" class="loginwarn"><span class="warn"><img src="/RMS/images/error.png"></span></label>
        </div>
    </div>
     
    <div class="form-group ">
        <div class="col-sm-4">
            <input type="text" class="form-control" id="registerName" name="nickName" placeholder="昵称"
                   onblur="checkRegisterName()">
        </div>
        <label id="registerNamewarn" class="loginwarn"><span class="warn"><img src="/RMS/images/error.png"></span></label>
    </div>
    
    <div class="form-group ">
        <div class="col-sm-4">
            <input type="password" class="form-control" id="registerPassword" name="passWord" placeholder="密码"
                   onblur="checkRegisterpassword()">
        </div>
        <label id="registerpasswarn" class="loginwarn"><span class="warn"><img src="/RMS/images/error.png"></span></label>
    </div>
    <div class="form-group ">
        <div class="col-sm-4">
            <input type="password" class="form-control" id="registerPasswordAgain" placeholder="确认密码"
                   onblur="checkRegisterPasswordAgain()">
        </div>
        <label id="registerpassAgainwarn" class="loginwarn"><span class="warn"><img src="/RMS/images/error.png"></span></label>
    </div>

  <button type="submit" class="loginSure">注册</button>

</form>
<div class="signAsk">已有帐号？<span class="loginSign"><a href="/RMS/login">登录</a></span></div>
</body>
</html>