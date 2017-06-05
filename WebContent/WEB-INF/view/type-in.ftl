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
        
    </style>
    <script>
        function appendWork() {
            const table =
                    '<div class="basic">' +
                    '<table width="700" height="250">' +
                    '<tr>' +
                    '<td class="td-left">公司名称 &nbsp;&nbsp;</td>' +
                    '<td class=""><input type="text" required style="width: 300px"/></td>' +
                    '</tr>' +
                    '<tr>' +
                    '<td class="td-left">职位</td>' +
                    '<td class=""><input type="text" required/>' +
                    '</tr>' +
                    '<tr>' +
                    '<td class="td-left">在职时间</td>' +
                    '<td class=""><input type="date"/>至<input type="date"/></td>' +
                    '<td class=""></td>' +
                    '</tr>' +
                    '<tr>' +
                    '<td style="vertical-align: top" class="td-left">工作内容</td>' +
                    '<td class=""><textarea rows="5" cols="60"></textarea></td>' +
                    '</tr>' +
                    '</table></div>';

            $("#content").append(table);
        }

        function appendProject() {
            const table = '<div class="basic"><table width="700" height="250"> <tr>' +
                    '<td class="td-left">项目名称</td> <td class=""><input type="text" required style="width: 300px"/></td>' +
                    '</tr><tr> <td class="td-left">项目角色</td><td class=""><input type="text" required/>' +
                    '</tr><tr><td class="td-left">项目时间</td><td class=""><input type="date"/>至<input type="date"/></td>' +
                    '<td class=""></td></tr><tr><td style="vertical-align: top" class="td-left">项目描述</td>' +
                    '<td class=""><textarea rows="5" cols="60"></textarea></td></tr></table></div>';
            $("#project").append(table);
        }
        function appendEdu() {
            const table = '<div class="basic"><table width="700" height="100" ><tr><td class="td-fourth">学校名称</td>' +
                    '<td class=""><input type="text" required/></td> <td class="td-fourth">所学专业</td>' +
                    '<td class=""><input type="text" required/></td> </tr><tr><td class="td-fourth">学位</td>' +
                    '<td class=""><input type="text" required/></td><td class="td-fourth">毕业年份</td><td class=""><input type="date"/></td>' +
                    '</tr></table></div>';
            $("#edu").append(table);
        }

        function submit(tag) {
            var data = {}, nodes = document.querySelectorAll("input");//可能所有文本框都是有用的
            var textNodes = document.querySelectorAll("textarea");//可能所有文本框都是有用的
            for (let i = 0, l = nodes.length; i < l; i++) {
                data[i] = nodes[i].value;//如果有不符合条件的文本框 这里也可以过滤掉
            }

            let index = nodes.length + 1;
            for (let i = 0, l = textNodes.length; i < l; i++) {
                data[index++] = textNodes[i].value;//如果有不符合条件的文本框 这里也可以过滤掉
            }



            var json = JSON.stringify(data);
            $.ajax({
                type: "POST",
                url: " ",
                contentType: "application/json; charset=utf-8",
                data: json,
                dataType: "json",
                success: function (message) {
                    if (message > 0) {
                        var light = document.getElementById(tag);
                        var fade = document.getElementById('fade');
                        light.style.display = 'block';
                        fade.style.display = 'block';
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
        <form method="post" action="">
            <div class="basic">
                <table width="700" height="150">
                    <tr>
                        <td class="td1">姓名</td>
                        <td class="td2"><input type="text" required/></td>
                        <td class="td3"></td>
                        <td class="td4">电话</td>
                        <td class="td5"><input type="text" required/></td>
                    </tr>
                    <tr>
                        <td class="td1">性别</td>
                        <td class="td2"><input type="radio" name="sex"/>&nbsp;男&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="sex"/>&nbsp;女
                        </td>
                        <td class="td3"></td>
                        <td class="td4">邮箱</td>
                        <td class="td5"><input type="text" required/></td>
                    </tr>
                    <tr>
                        <td class="td1">关键技能</td>
                        <td class="td2"><input type="text" required/></td>
                        <td class="td3"></td>
                        <td class="td4">工作年限</td>
                        <td class="td5"><input type="text" required/></td>
                    </tr>
                </table>
            </div>
        </form>
    </div>
    <hr/>
    <div>
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
                        <td class=""><input type="text" required style="width: 300px"/></td>
                    </tr>
                    <tr>
                        <td class="td-left">职位</td>
                        <td class=""><input type="text" required/></td>
                    </tr>
                    <tr>
                        <td class="td-left">在职时间</td>
                        <td class=""><input type="date"/>至<input type="date"/></td>
                        <td class=""></td>

                    </tr>
                    <tr>
                        <td style="vertical-align: top" class="td-left">工作内容</td>
                        <td class=""><textarea rows="5" cols="60"></textarea></td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    <hr/>
    <div>
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
                        <td class=""><input type="text" required style="width: 300px"/></td>
                    </tr>
                    <tr>
                        <td class="td-left">项目角色</td>
                        <td class=""><input type="text" required/>
                    </tr>
                    <tr>
                        <td class="td-left">项目时间</td>
                        <td class=""><input type="date"/>至<input type="date"/></td>
                        <td class=""></td>

                    </tr>
                    <tr>
                        <td style="vertical-align: top" class="td-left">项目描述</td>
                        <td class=""><textarea rows="5" cols="60"></textarea></td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    <hr/>
    <div>
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
                        <td class=""><input type="text" required/></td>
                        <td class="td-fourth">所学专业</td>
                        <td class=""><input type="text" required/></td>
                    </tr>
                    <tr>
                        <td class="td-fourth">学位</td>
                        <td class=""><input type="text" required/></td>
                        <td class="td-fourth">毕业年份</td>
                        <td class=""><input type="date"/></td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    <div class="footer">
        <button class="btn btn-default" onclick="submit('light')">确定</button>
        <button class="btn btn-default">取消</button>
    </div>

    <div id="light" class="white_content">
        <div id="close">
            <button>关闭</button>
        </div>
        <div class="con">
            提交成功！
        </div>
    </div>
</div>
</body>
</html>