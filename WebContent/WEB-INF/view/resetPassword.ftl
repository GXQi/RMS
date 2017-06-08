<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
  <link href="/RMS/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="/RMS/css/login.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="/RMS/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/RMS/js/jquery-3.1.0.min.js"></script>
    <title>resetPassword</title>
    <script>
        function finishd() {
            var newpassword=document.getElementById('newpassword').value;
            var confirmPassword=document.getElementById('confirmPassword').value;
            if(newpassword===''){
                document.getElementById('warning').innerHTML = '请输入密码！';
                document.getElementById('newpassword').focus()
            }else if(confirmPassword===''){
                document.getElementById('warning').innerHTML = '请输入确认密码！';
                document.getElementById('confirmPassword').focus()
            }else if(newpassword!=confirmPassword){
                document.getElementById('warning').innerHTML = '两次输入不同！';
                document.getElementById('newpassword').focus()
            }
        }
    </script>
</head>
<body>

<div class="findPasswordReturn">返回登录页</div>
<div class="loginTiele">简历管理平台</div>
<div class="findPasswordTiele">密码重置</div>
<div id="warning"><span id="warn">提示</span></div>
<form class="form-horizontal" role="form">
    <div class="form-group ">
        <div class="col-sm-4">
            <input type="password" class="form-control" id="newpassword" placeholder="新密码" required>
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-4">
            <input type="password" class="form-control" id="confirmPassword"
                   placeholder="确认密码">
        </div>
    </div>
</form>

<div class="loginSure" onclick="finishd()">
    <span class="loginSpan">完成</span>
</div>

</body>
</html>