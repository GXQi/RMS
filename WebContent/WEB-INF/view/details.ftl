<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>简历详情</title>
    <link rel="stylesheet" type="text/css" href="/RMS/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/RMS/css/details.css">
    <link rel="stylesheet" type="text/css" href="/RMS/css/base.css">
    <script type="text/javascript" src="/RMS/js/jquery-3.1.0.min.js"></script>
    <script type="text/javascript" src="/RMS/js/jquery-3.2.1.js"></script>
    <script type="text/javascript" src="/RMS/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/RMS/js/details.js"></script>
  
    <style>
    body{
		background-image:url("/RMS/images/background.jpg");  
		background-repeat: no-repeat; 
		background-attachment:fixed; 
		background-size: cover; 
	}
    	.export {
    		float:right;
    		margin-right:15%;
    		margin-top:2%;
    	}
    	.the_title{
		font-size:150%;
		font-weight:900;
	}
    	
    </style>
    <script type="text/javascript">
    	function post(){
			//获取电话
			var phonenumber=$("#phonenumber").text();
			var data={"phone":phonenumber};
			var temp = document.createElement("form");
			temp.action = "/RMS/edit";
			temp.method = "post";
			temp.style.display = "none";
			for (var x in data) {
				var opt = document.createElement("textarea");
				opt.name = x;
				opt.value = data[x];
				temp.appendChild(opt);
			}
			document.body.appendChild(temp);
			temp.submit();
			return temp;
		};
		 $(document).ready(function(){
    		var cookie=document.cookie;
    		var name=decodeURI(cookie.split("=")[1]);
    		$("#username").text(name);
    		document.getElementById("username").innerHTML+="<b class='caret'></b> ";
    	});
    </script>
</head>
<body>
<!-- 导航栏 -->
<div class="details-nav">
    <nav class="navbar navbar-inverse nav-size mar-auto" class="" role="navigation">
        <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="/RMS/main">简历管理平台</a>
        </div>
        <div>
            <p class="navbar-text navbar-left">简历库</p>
            <!--向右对齐-->
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a  class="dropdown-toggle" data-toggle="dropdown" id="username">
                        UserName <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="/RMS/login">登出</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        </div>
    </nav>
</div>
<div class="export"><a onclick="post()">编辑</a>&nbsp;<a onclick="downloadResume()">导出</a></div>
<!-- 主体部分，即简历查看页面的显示 -->
<div class="details-look mar-auto">
	
    <!-- 基本信息 -->
    <div class="info-base">
        <p class="base-name">${resumeBasic.name}</p>
        <ul class="clear-float">
        	<li class="float-l"><img src="/RMS/images/img_sex.png"> ${resumeBasic.sex}</li>
            <li class="float-l"><img src="/RMS/images/img_skill.png"> ${resumeBasic.skill}</li>  
        </ul>
        <ul class="clear-float">
         	<li class="float-l"><img src="/RMS/images/img_phonenumber.png"> <span id="phonenumber">${resumeBasic.phonenumber}</span></li>
            <li class="float-l"><img src="/RMS/images/img_workTime.png"> ${resumeBasic.workTime}年</li>
        
        </ul>
        <ul class="clear-float">
            
            <li class="float-l"><img src="/RMS/images/img_email.png"> ${resumeBasic.email}</li> 
        </ul>
    </div>
    <!-- <div class="float-r"><a href="#">编辑</a></div>
    <div style="clear: both;"> -->
    <hr/>
    <!-- 工作经历 -->
    <div class="info-work clear-float">
        <div class="work-title float-l"><span class="the_title"><img src="/RMS/images/work_experience.png" width="30" height="30"/>&nbsp;&nbsp;工作经历</span>
	</div>
	<br/>
        <div class="work-content float-l">
          	<#list workExperienceList as workExperience>
          		<ul class="clear-float font-size-16">
                	<li class="float-l"><img src="/RMS/images/img_name.png"> ${workExperience.company}</li>
                	<li class="float-r"><img src="/RMS/images/img_workTime.png"> ${workExperience.workTimeStart}至${workExperience.workTimeEnd}</li>
            	</ul>
            	<br/>
            	<span ><img src="/RMS/images/img_position.png"> ${workExperience.position}</span>
            	<p>
            	<br/>
                	<img src="/RMS/images/img_content.png"> ${workExperience.workContent}
            	</p>
          	</#list>
        </div>
    </div>
    <hr/>
    <!-- 项目经验 -->
    <div class="info-project clear-float">
        <div class="project-title float-l"><span class="the_title"><img src="/RMS/images/pro_experience.png" width="30" height="30"/>&nbsp;&nbsp;项目经验</span>
</div>
<br/>
        <div class="project-content float-l">
            <#list  projectExperienceList as projectExperience>
          		<ul class="clear-float font-size-16">
                	<li class="float-l"><img src="/RMS/images/img_name.png"> ${projectExperience.projectName}</li>
                	<li class="float-r"><img src="/RMS/images/img_workTime.png"> ${projectExperience.projectTimeStart}至${projectExperience.projectTimeEnd}</li>
            	</ul>
            	<br/>
            	<span><img src="/RMS/images/img_role.png"> ${projectExperience.projectRole}</span>
            	<p>
            	<br/>
                	<img src="/RMS/images/img_content.png"> ${projectExperience.workContent}
            	</p>
          	</#list>
        </div>
    </div>
    <hr/>
    <!-- 教育经历 -->
    <div class="info-education clear-float">
        <div class="education-title float-l"><span class="the_title"><img src="/RMS/images/edu_experience.png" width="30" height="30"/>&nbsp;&nbsp;教育经历</span>
</div>
<br/>
        <div class="education-content float-l">
        
            <#list  eductionExperienceList as eductionExperience>
          		<ul class="clear-float font-size-16">
                	<li class="float-l"><img src="/RMS/images/img_school.png"> ${eductionExperience.school}</li>
                	<li class="float-r"><img src="/RMS/images/img_workTime.png"> ${eductionExperience.graduationTime}</li>
            	</ul>
            	<br/>
            	<span ><img src="/RMS/images/img_major.png"> ${eductionExperience.major}</span>
            	<p>
            		<br/>
                	<img src="/RMS/images/img_degree.png"> ${eductionExperience.degree}
            	</p>
          	</#list>
        </div>
    </div>
</div>
</body>
</html>