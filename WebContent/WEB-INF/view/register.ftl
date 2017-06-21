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
<body style="background-color: #e2e6ff" onload="creatCode()">
<canvas id="root" width="1200" height="600">
</canvas>
<div style="position: absolute;left: 42%; top: 18%">
<div class="loginTiele">简历管理平台</div>
<br>
<#if warnEmployee?exists>
   <div class="loginwarn">帐号已存在</div>
</#if>
<#if warnInforLank?exists>
   <div class="loginwarn">信息填写不完整</div>
</#if>
</div>
<form class="form-horizontal" role="form" method="POST" action="/RMS/submitUser" style="position: absolute;top: 35%;width: 700px">
    <div class="form-group ">
        <div class="col-sm-4">
            <input type="text" class="form-control" id="registerPhone" name="phoneNumber" placeholder="手机号" onblur="checkRegisterPhone()">
        </div>
         <label id="registerNumberwarn" class="loginwarn"><span class="warn"><img src="/RMS/images/error.png"></span></label>
    </div>   
    
    <div class="form-group">
        <div class="col-sm-4">
            <input type="text" class="form-control" id="registerFont" name="registerFont" placeholder="验证码"
                   onblur="checkRegisterFont()">
        </div>
  
        <label id="registerFonewarn" class="loginwarn"><span class="warn"><img src="/RMS/images/error.png"></span></label>
    </div>

    <div>
 
        <span class="code" id="checkCode" onclick="creatCode()"style="margin-left:60px; border-style: solid;border-width: 2px;font-size: 20px;"></span>


        <a href="#" onclick="creatCode()" class="changeFont" style="margin-left:30px">看不清换一张</a>
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
            <input type="password" class="form-control" id="registerPasswordAgain" placeholder="确认密码" name="againPassword"
                   onblur="checkRegisterPasswordAgain()">
        </div>
        <label id="registerpassAgainwarn" class="loginwarn"><span class="warn"><img src="/RMS/images/error.png"></span></label>
    </div>
	<div>
    	<input type="hidden" name="Isregister" id="Isregister" value=0>
    </div>
  <button type="submit" class="loginSure">注册</button>

</form>
<div style="position: absolute;top: 90%;width: 700px;left: 23%">
<div class="signAsk">已有帐号？<span class="loginSign"><a href="/RMS/login">登录</a></span></div>
</div>
<script>
    function CanvasAnimate(Dom, options) {
        options = options || {};
        this.Element = Dom;
        this.cvs = Dom.getContext("2d");
        this.off_cvs = document.createElement("canvas");
        this.off_cvs.width = Dom.width;
        this.off_cvs.height = Dom.height;
        this.Dom = this.off_cvs.getContext("2d");
        this.width = Dom.width;
        this.height = Dom.height;
        this.length = options.length || 100;
        this.RoundColor = options.RoundColor || "#999";
        this.RoundDiameter = options.RoundDiameter || 2;
        this.LineColor = options.LineColor || "#ccc";
        this.LineWeight = options.LineWeight || 1;
        this.clicked = options.clicked || false;
        this.moveon = options.moveon || false;
        this.list = [];
        this.paused = true;
    }
    CanvasAnimate.prototype.Run = function () {
        if (this.clicked) {
            this.Element.addEventListener("click", this.Clicked.bind(this))
        }
        if (this.moveon) {
            this.Element.addEventListener("mousemove", this.moveXY.bind(this))
            this.Element.addEventListener("mouseout", this.moveoutXY.bind(this))
        }
        this.Draw(this.getLength())
    }
    CanvasAnimate.prototype.getLength = function () {
        let arr = []
        for (let i = 0; i < this.length; i++) {
            let obj = {}
            obj.x = parseInt(Math.random() * this.width)
            obj.y = parseInt(Math.random() * this.height)
            obj.r = parseInt(Math.random() * 10)
            obj.controlX = parseInt(Math.random() * 10) > 5 ? "left" : "right"
            obj.controlY = parseInt(Math.random() * 10) > 5 ? "bottom" : "top"
            arr.push(obj)
        }
        return arr
    }
    CanvasAnimate.prototype.Draw = function (list) {
        let new_arr = []
        let line_arr = []

        list.map((item, index)=> {
            let xy = this.ControlXY(item)
            let obj = this.ControlRound(xy)
            new_arr.push(obj)
        });

        new_arr.map((item1, index1)=> {
            new_arr.map((item2, index2)=> {
                if (item1 !== item2) {
                    let x = item1.x - item2.x
                    let y = item1.y - item2.y
                    if (Math.abs(x) < 100 && Math.abs(y) < 100) {
                        let obj = {
                            x1: item1.x,
                            y1: item1.y,
                            x2: item2.x,
                            y2: item2.y,
                        }
                        line_arr.push(obj)
                    }
                }
            })
        })

        this.drawLine(line_arr)

        new_arr.map((item)=> {
            this.drawRound(item)
        })

        this.list = new_arr

        this.cvs.drawImage(this.off_cvs, 0, 0, this.width, this.height)

        setTimeout(()=> {
            if (this.paused) {
                this.next()
            }
        }, 50)
    }
    CanvasAnimate.prototype.next = function () {
        this.cvs.clearRect(0, 0, this.width, this.height)
        this.Dom.clearRect(0, 0, this.width, this.height)
        this.Draw(this.list)
    }
    CanvasAnimate.prototype.drawRound = function (obj) {
        let {x, y, r} = obj
        this.Dom.beginPath()
        this.Dom.arc(x, y, r, 0, 2 * Math.PI)
        this.Dom.fillStyle = this.RoundColor
        this.Dom.fill()
        this.Dom.closePath()
    }
    CanvasAnimate.prototype.drawLine = function (list) {
        list.map((item)=> {
            this.Dom.beginPath()
            this.Dom.moveTo(item.x1, item.y1)
            this.Dom.lineTo(item.x2, item.y2)
            this.Dom.lineWidth = this.LineWeight
            this.Dom.strokeStyle = this.LineColor
            this.Dom.stroke()
            this.Dom.closePath()
        })
    }
    CanvasAnimate.prototype.ControlXY = function (obj) {
        if (obj.x >= (this.width - obj.r)) {
            obj.controlX = 'left'
        } else if (obj.x <= parseInt(obj.r / 2)) {
            obj.controlX = "right"
        }

        if (obj.y >= (this.height - obj.r)) {
            obj.controlY = "bottom"
        } else if (obj.y <= parseInt(obj.r / 2)) {
            obj.controlY = "top"
        }
        return obj
    }
    CanvasAnimate.prototype.ControlRound = function (obj) {
        switch (obj.controlX) {
            case "right":
                obj.x++;
                break;
            case "left":
                obj.x--;
                break;
        }
        switch (obj.controlY) {
            case "top":
                obj.y++;
                break;
            case "bottom":
                obj.y--;
                break;
        }
        return obj
    }
    CanvasAnimate.prototype.Clicked = function (event) {
        let obj = {}
        obj.x = event.clientX
        obj.y = event.clientY
        obj.r = parseInt(Math.random() * 10)
        obj.controlX = parseInt(Math.random() * 10) > 5 ? 'left' : 'right'
        obj.controlY = parseInt(Math.random() * 10) > 5 ? 'bottom' : 'top'
        this.list.push(obj)
    }
    CanvasAnimate.prototype.moveXY = function (event) {
        let obj = {}
        obj.x = event.clientX
        obj.y = event.clientY
        obj.r = 0
        obj.move = true
        if (this.list[0]["move"]) {
            this.list[0]["x"] = obj.x
            this.list[0]["y"] = obj.y
            this.list[0]["r"] = 1
        } else {
            this.list.unshift(obj)
        }
    }
    CanvasAnimate.prototype.moveoutXY = function (event) {
        this.list.shift()
    }
    CanvasAnimate.prototype.pause = function () {
        this.paused = !this.paused
        if (this.paused) {
            this.Draw(this.list)
        }
    }
    var root = document.querySelector("#root")
    var a = new CanvasAnimate(root, {length: 50, clicked: true, moveon: true})
    a.Run()
</script>

</body>
</html>