<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link href="./css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="./css/nav-style.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="./js/bootstrap.min.js"></script>
    <script type="text/javascript" src="./js/jquery-3.1.0.min.js"></script>
    <title>Title</title>
    <style>
        .white_content {
            display: none;
            position: fixed;
            top: 35%;
            left: 25%;
            width: 550px;
            height: 150px;
            text-align: center;
            font-weight: 400;
            padding: 40px;
            border: 12px solid #D6E9F1;
            background-color: white;
            font-size: larger;
            z-index: 1002;
            overflow: auto;
        }

        .delete {
            float: right;
        }

    </style>
    <script>
        function appendWork() {
            const table =
                    '<div><hr/><button class="delete btn btn-default" value="x">X</button>' +
                    '<div class="basic"> ' +
                    '<table width="650" height="250">' +
                    '<tr>' +
                    '<td class="td-left">公司名称 &nbsp;&nbsp;</td>' +
                    '<td><input type="text" required style="width: 300px" class="text"/></td>' +
                    '</tr><tr><td class="td-left">职位</td>' +
                    '<td><input type="text" required class="text"/>' +
                    '</tr>' +
                    '<tr>' +
                    '<td class="td-left">在职时间</td>' +
                    '<td><input type="date" class="text"/>至<input type="date" class="text"/></td>' +
                    '<td></td>' +
                    '</tr>' +
                    '<tr>' +
                    '<td style="vertical-align: top" class="td-left">工作内容</td>' +
                    '<td><textarea rows="5" cols="60" class="text"></textarea></td>' +
                    '</tr>' +
                    '</table></div class="basic"></div>';

            $("#content").append(table);
            document.body.addEventListener("click", function (event) {
                var target = event.target;
                if (target.nodeName === "BUTTON") {
                    target.parentNode.remove();
                }
            }, false);
        }

        function appendProject() {
            const table = '<div><hr/><button class="delete btn btn-default" value ="x1">X</button><div class="basic"><table width="650" height="250"> <tr>' +
                    '<td class="td-left">项目名称</td> <td><input type="text" class="text1" required style="width: 300px"/></td>' +
                    '</tr><tr> <td class="td-left">项目角色</td><td><input type="text" required class="text1"/>' +
                    '</tr><tr><td class="td-left">项目时间</td><td><input type="date" class="text1"/>至<input type="date" class="text1"/></td>' +
                    '<td></td></tr><tr><td style="vertical-align: top" class="td-left">项目描述</td>' +
                    '<td><textarea rows="5" cols="60" class="text1"></textarea></td></tr></table></div></div>';
            $("#project").append(table);
            document.body.addEventListener("click", function (event) {
                var target = event.target;
                if (target.nodeName === "BUTTON") {
                    target.parentNode.remove();
                }
            }, false);
        }
        function appendEdu() {
            const table = '<div><hr/><button class="delete btn btn-default" value="x2">X</button><div class="basic"><table width="700" height="100" ><tr><td class="td-fourth">学校名称</td>' +
                    '<td><input type="text" required class="text2"/></td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<td class="td-fourth">所学专业</td>' +
                    '<td><input type="text" required class="text2"/></td> </tr><tr><td class="td-fourth">学位</td>' +
                    '<td><input type="text" required class="text2"/></td><td class="td-fourth">毕业年份</td><td><input type="date" class="text2"/></td>' +
                    '</tr></table></div></div>';
            $("#edu").append(table);
            document.body.addEventListener("click", function (event) {
                var target = event.target;
                if (target.nodeName === "BUTTON") {
                    target.parentNode.remove();
                }
            }, false);
        }

        function submit(tag) {
            var data = {"basic": {}, "work": {}, "project": {}, "edu": {}};
            var nodes1 = $(".text3");
            var nodes2 = $(".text");
            var nodes3 = $(".text1");
            var nodes4 = $(".text2");
            for (let i = 0, l = nodes1.length; i < l; i++) {
                data.basic[i] = nodes1[i].value;
            }

            for (let i = 0, l = nodes2.length; i < l; i++) {
                data.work[i] = nodes2[i].value;
            }

            for (let i = 0, l = nodes3.length; i < l; i++) {
                data.project[i] = nodes3[i].value;
            }

            for (let i = 0, l = nodes4.length; i < l; i++) {
                data.edu[i] = nodes4[i].value;
            }

            var json = JSON.stringify(data);
            alert(json)
            $.ajax({
                type: "POST",
                url: "/RMS/resumemanage/insert",
                contentType: "application/json; charset=utf-8",
                data: json,
                dataType: "json",
                success: function (message) {
                    if (message > 0) {
                        var light = document.getElementById(tag);
                        light.style.display = 'block';
                        document.getElementById("myBtn").addEventListener("click", function () {
                            var light = document.getElementById('light');
                            light.style.display = 'none';
                        });
                    }
                },
                error: function (message) {
                    alert("提交失败！");
                }
            });
        }
    </script>
</head>
<body>
<div class="header">
    <div class="title">
        简历管理平台
    </div>
    <div class="title repo">
        简历库
    </div>
    <div class="username">
        UserName | <a>Log Out</a>
    </div>
</div>
<div class="content">
    <div class="putin">
        录入新简历
    </div>
    <hr/>
    <div>
        <div class="label">
            基本信息
        </div>
        <div class="basic">
            <table width="700" height="150">
                <tr>
                    <td class="td1">姓名</td>
                    <td class="td2"><input type="text" required class="text3"/></td>
                    <td class="td3"></td>
                    <td class="td4">电话</td>
                    <td class="td5"><input type="text" required class="text3"/></td>
                </tr>
                <tr>
                    <td class="td1">性别</td>
                    <td class="td2"><input type="radio" name="sex" class="text3"/>&nbsp;男&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="radio" name="sex" class="text3"/>&nbsp;女
                    </td>
                    <td class="td3"></td>
                    <td class="td4">邮箱</td>
                    <td class="td5"><input type="text" required class="text3"/></td>
                </tr>
                <tr>
                    <td class="td1">关键技能</td>
                    <td class="td2"><input type="text" required class="text3"/></td>
                    <td class="td3"></td>
                    <td class="td4">工作年限</td>
                    <td class="td5"><input type="text" required class="text3"/></td>
                </tr>
            </table>
        </div>
        </form>
        <hr/>
        <div id="info2">
            <div class="label">
                工作经历
                <div><span><img src="./images/add.png" width="20px" height="20px" onclick="appendWork()"></span>添加更多工作经历
                </div>
            </div>
            <div id="content">
                <div class="basic">
                    <table width="700" height="250">
                        <tr>
                            <td class="td-left">公司名称 &nbsp;&nbsp;</td>
                            <td><input type="text" required style="width: 300px" class="text"/></td>
                        </tr>
                        <tr>
                            <td class="td-left">职位</td>
                            <td><input type="text" required class="text"/></td>
                        </tr>
                        <tr>
                            <td class="td-left">在职时间</td>
                            <td><input type="date" class="text"/>至<input type="date" class="text"/></td>
                            <td></td>

                        </tr>
                        <tr>
                            <td style="vertical-align: top" class="td-left">工作内容</td>
                            <td><textarea rows="5" cols="60" class="text"></textarea></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <hr/>
        <div id="info3">
            <div class="label">
                项目经验
                <div><span><img src="./images/add.png" width="20px" height="20px" onclick="appendProject()"></span>添加更多项目经验
                </div>
            </div>
            <div id="project">
                <div class="basic">
                    <table width="700" height="250">
                        <tr>
                            <td class="td-left">项目名称</td>
                            <td><input type="text" required style="width: 300px" class="text1"/></td>
                        </tr>
                        <tr>
                            <td class="td-left">项目角色</td>
                            <td><input type="text" required class="text1"/>
                        </tr>
                        <tr>
                            <td class="td-left">项目时间</td>
                            <td><input type="date" class="text1"/>至<input type="date" class="text1"/></td>
                            <td></td>

                        </tr>
                        <tr>
                            <td style="vertical-align: top" class="td-left">项目描述</td>
                            <td><textarea rows="5" cols="60" class="text1"></textarea></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <hr/>
        <div id="info4">
            <div class="label">
                教育经历
                <div><span><img src="./images/add.png" width="20px" height="20px" onclick="appendEdu()"></span>添加更多教育经历
                </div>
            </div>
            <div id="edu">
                <div class="basic">
                    <table width="700" height="100">
                        <tr>
                            <td class="td-fourth">学校名称</td>
                            <td><input type="text" required class="text2"/></td>
                            <td class="td-fourth">所学专业</td>
                            <td><input type="text" required class="text2"/></td>
                        </tr>
                        <tr>
                            <td class="td-fourth">学位</td>
                            <td><input type="text" required class="text2"/></td>
                            <td class="td-fourth">毕业年份</td>
                            <td><input type="date" class="text2"/></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <div class="footer">
            <button class="btn btn-default" onclick="submit('light')">提交</button>
        </div>
        <div id="light" class="white_content">
            <div class="con">
                提交成功！<button class="btn btn-default" id="myBtn">关闭</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>
