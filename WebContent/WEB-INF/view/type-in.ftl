<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link href="/RMS/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="/RMS/css/nav-style.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="/RMS/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/RMS/js/jquery-3.1.0.min.js"></script>
    <script type="text/javascript" src="/RMS/js/type-in.js"></script>
    <title>Title</title>
    <style>
    body{
		background-image:url("/RMS/images/background.jpg");  
		background-repeat: no-repeat; 
		background-attachment:fixed; 
		background-size: cover; 
	}
    .the_title{
		font-size:150%;
		font-weight:900;
	}
    </style>
</head>
<body>
<div class="header">
    <div class="title">
        <a onclick="toMain()">简历管理平台</a>
    </div>
    <div class="title repo">
        简历库
    </div>
    <div class="username">
        UserName | <a onclick="logout()">Log Out</a>
    </div>
</div>
<div class="content">
    <div class="putin">
        录入新简历
    </div>
    <hr/>
    <div>
        <div class="label">
            <span class="the_title"><img src="/RMS/images/basic_info.png" width="30" height="30"/>&nbsp;&nbsp;基本信息</span>
        </div>

        <div class="basic">
            <table width="700" height="150">
                <tr>
                    <td class="td1">姓名</td>
                    <td class="td2"><input type="text" required id="name"/></td>
                    <td class="td3"></td>
                    <td class="td4">电话</td>
                    <td class="td5"><input type="text" required id="phone" onblur="versify()"/>
                        <span id="tip1"></span>
                    </td>
                </tr>
                <tr>
                    <td class="td1">性别</td>
                    <td class="td2"><input type="radio" name="sex" id="sex1" value="男"/>&nbsp;男&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="radio" name="sex" id="sex2" value="女"/>&nbsp;女
                    </td>
                    <td class="td3"></td>
                    <td class="td4">邮箱</td>
                    <td class="td5"><input type="text" required id="mail" onblur="check()"/>
                        <span id="tip2"></span>
                    </td>
                </tr>
                <tr>
                    <td class="td1">关键技能</td>
                    <td class="td2"><input type="text" required id="key-kill"/></td>
                    <td class="td3"></td>
                    <td class="td4">工作年限</td>
                    <td class="td5"><input type="text" required id="workExperience"/></td>
                </tr>
            </table>
        </div>
        </form>
        <hr/>
        <div id="info2">
            <div class="label">
             <span class="the_title"><img src="/RMS/images/work_experience.png" width="30" height="30"/>&nbsp;&nbsp;工作经历</span>
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
            <span class="the_title"><img src="/RMS/images/pro_experience.png" width="30" height="30"/>&nbsp;&nbsp;项目经验</span>
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
            <span class="the_title"><img src="/RMS/images/edu_experience.png" width="30" height="30"/>&nbsp;&nbsp;教育经历</span>
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
            <button class="btn btn-primary" onclick="submit('light')">提交</button>
        </div>
        <div id="light" class="white_content">
            <div class="con">
                提交失败！
                <button class="btn btn-default" id="myBtn">关闭</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>
