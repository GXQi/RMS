<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link href="/RMS/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="/RMS/css/nav-style.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="/RMS/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/RMS/js/jquery-3.1.0.min.js"></script>
    <script type="text/javascript" src="/RMS/js/edit.js"></script>
    <script type="text/javascript" src="/RMS/js/type-in.js"></script>
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
    <nav class="username">
        UserName | <a onclick = "logout()">Log Out</a>
    </nav>
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
                        <td class="td2"><input type="text" required class="text" id="name" value=${resumeBasic.name} /></td>
                        <td class="td3"></td>
                        <td class="td4">电话</td>
                        <td class="td5"><input type="text" required class="text" id="phone" value=${resumeBasic.phonenumber} /></td>
                    </tr>
                    <tr>
                        <td class="td1">性别</td>
                        <#if (resumeBasic.sex=="男")>
                        	<td class="td2"><input type="radio" name="sex" id="boy" value="男" checked/>&nbsp;男&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="sex" id="girl" value="女"/>&nbsp;女
                        </td>
                        </#if>
                         <#if (resumeBasic.sex=="女")>
                        	<td class="td2"><input type="radio" name="sex" id="boy" value="男" />&nbsp;男&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="sex" id="girl" value="女" checked />&nbsp;女
                        </td>
                        </#if>
                        <td class="td3"></td>
                        <td class="td4">邮箱</td>
                        <td class="td5"><input type="text" required class="text" id="email" value=${resumeBasic.email} /></td>
                    </tr>
                    <tr>
                        <td class="td1">关键技能</td>
                        <td class="td2"><input type="text" required class="text" id="skill" value=${resumeBasic.skill} /></td>
                        <td class="td3"></td>
                        <td class="td4">工作年限</td>
                        <td class="td5"><input type="text" required class="text" id="workTime" value=${resumeBasic.workTime} /></td>
                    </tr>
                </table>
            </div>
    </div>
    <hr/>
    <div>
        <div class="label">
            工作经历
            <div><span><img src="/RMS/images/add.png" width="20px" height="20px" onclick="appendWork()"></span>添加更多工作经历
            </div>
        </div>
        <div id="content">
        	 <#if (workList?size > 0)>
              <#list workList as work>
              <#if (work_index > 0)>
                		<div><hr/><a class="delete" >x</a>
                	</#if>
            <div class="basic">
               
                	<table width="700" height="250">
                    
                    	<tr>
                        <td class="td-left">公司名称 &nbsp;&nbsp;</td>
                        <td class=""><input type="text" required style="width: 300px" class="text1" value=${work.company} /></td>
                    </tr>
                    <tr>
                        <td class="td-left">职位</td>
                        <td class=""><input type="text" required class="text1" value=${work.position} /></td>
                    </tr>
                    <tr>
                        <td class="td-left">在职时间</td>
                        <td class=""><input type="date" class="text1" value=${work.workTimeStart} />至<input type="date" class="text1" value=${work.workTimeEnd} /></td>
                        <td class=""></td>

                    </tr>
                    <tr>
                        <td style="vertical-align: top" class="td-left">工作内容</td>
                        <td class=""><textarea rows="5" cols="60" class="text1">${work.workContent}</textarea></td>
                    </tr>
                    
                </table>
                
               
            </div>
             </#list>
             </#if>
        </div>
    </div>
    <hr/>
    <div>
        <div class="label">
            项目经验
            <div><span><img src="/RMS/images/add.png" width="20px" height="20px" onclick="appendProject()"></span>添加更多项目经验
            </div>
        </div>
        <div id="project">
         <#if (projectList?size >0)>
                <#list projectList as project>
                <#if (project_index > 0)>
                		<div><hr/><a class="delete" >x</a>
                	</#if>
            <div class="basic">
               
                	<table width="700" height="250">
                    
                    	<tr>
                        <td class="td-left">项目名称</td>
                        <td class=""><input type="text" required style="width: 300px" class="text2" value=${project.projectName} /></td>
                    </tr>
                    <tr>
                        <td class="td-left">项目角色</td>
                        <td class=""><input type="text" required class="text2" value=${project.projectRole} />
                    </tr>
                    <tr>
                        <td class="td-left">项目时间</td>
                        <td class=""><input type="date" class="text2" value=${project.projectTimeStart} />至<input type="date" class="text2" value=${project.projectTimeEnd} /></td>
                        <td class=""></td>

                    </tr>
                    <tr>
                        <td style="vertical-align: top" class="td-left">项目描述</td>
                        <td class=""><textarea rows="5" cols="60" class="text2">${project.workContent} </textarea></td>
                    </tr>
                    
                </table>
                
                
            </div>
            </#list>
                </#if>
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
        <#if (eductionList?size >0)>
                	<#list eductionList as eduction>
                	<#if (eduction_index > 0)>
                		<div><hr/><a class="delete" >x</a>
                	</#if>
            <div class="basic">
                
                	<table width="700" height="100">
                    
                    	<tr>
                        <td class="td-fourth">学校名称</td>
                        <td class=""><input type="text" required class="text3" value=${eduction.school} /></td>
                        <td class="td-fourth">所学专业</td>
                        <td class=""><input type="text" required class="text3" value=${eduction.major} /></td>
                    </tr>
                    <tr>
                        <td class="td-fourth">学位</td>
                        <td class=""><input type="text" required class="text3" value=${eduction.degree} /></td>
                        <td class="td-fourth">毕业年份</td>
                        <td class=""><input type="date" class="text3" value=${eduction.graduationTime} /></td>
                    </tr>
                   
                </table>
               
                
            </div>
             </#list>
             </#if>
        </div>
    </div>
    <div class="footer">
        <button class="btn btn-default" onclick="submit()">确定</button>
    </div>
    <div id="light" class="white_content">
        <div class="con">
            确定要删除这一模块？
            <button class="btn btn-default" id="close">关闭</button>
            <button class="btn btn-default" id="myBtn">确定</button>
        </div>
    </div>

    <div id="light1" class="white_content" >
        <div class="con">
            删除成功！
            <button class="btn btn-default" id="close1">关闭</button>
        </div>
    </div>
</div>
</body>
</html>