<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link href="./css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="./css/nav-style.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="./js/bootstrap.min.js"></script>
    <script type="text/javascript" src="./js/jquery-3.1.0.min.js"></script>
    <title>Title</title>
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
        UserName
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
        <form method="post" action="" >
            <div class="basic">
                <table width="700" height="150">
                    <tr>
                        <td class="td1">姓名</td>
                        <td class="td2"><input type="text" required path="name"/></td>
                        <td class="td3"></td>
                        <td class="td4">电话</td>
                        <td class="td5"><input type="text" required/></td>
                    </tr>
                    <tr>
                        <td class="td1">性别</td>
                        <td class="td2"><input type="radio" checked name="sex"/>&nbsp;男&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" required name="sex"/>&nbsp;女
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
            <div><span><img src=""></span>添加更多工作经历</div>
        </div>
        <form method="post" action="">
            <div class="basic">
                <table width="700" height="250">
                    <tr>
                        <td class="td-left">公司名称 &nbsp;&nbsp;</td>
                        <td class=""><input type="text" required style="width: 300px"/></td>
                    </tr>
                    <tr>
                        <td class="td-left">职位</td>
                        <td class=""><input type="text" required/>
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
        </form>
    </div>
    <hr/>
    <div>
        <div class="label">
            项目经验
            <div><span><img src=""></span>添加更多项目经验</div>
        </div>
        <form method="post" action="/RMS/string">
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
            <input type="submit" class="btn btn-default value ="确定">
        </form>
    </div>
    <hr/>
    <div>
        <div class="label">
            教育经历
            <div><span><img src=""></span>添加更多教育经历</div>
        </div>
        <form method="post" action="">
            <div class="basic">
                <table width="700" height="100" >
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
        </form>
    </div>
    <div class="footer">
        <input type="submit" class="btn btn-default value ="确定">
        <button class="btn btn-default">取消</button>
    </div>
</div>
</body>
</html>