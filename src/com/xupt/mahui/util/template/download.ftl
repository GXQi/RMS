<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>简历详情</title>
    <style>  
		body{  
    		font-family: SimSun;  
		}  
		*{
    padding: 0;
    margin: 0;
}

a{
    color: #4C9ED9;
}

li{
    list-style: none;
}

hr{
    border: none;
    background-color: #9E9E9E;
    height: 1px;
}

.dis-block{
    display: block;
}

.mar-auto{
    margin: 0 auto;
}

.float-l{
    float: left;
}

.float-r{
    float: right;
    margin-right:100px;
}

.clear-float:after{
    display: block;
    clear: both;
    content: "";
    visibility: hidden;
    height: 0;
}

.font-size-16{
    font-size: 16px;
}

.font-size-14{
    font-size: 14px;
}
.details-nav{
    background-color: #222222;
}

.nav-size{
    width: 600px;
    border: 0;
}

.details-look{
    width: 600px;
    padding: 20px 30px;
}

.span-style{
    color: #9E9E9E;
}

/*基本信息*/
.info-base{
    text-align: center;
}

.base-name{
    font-size: 24px;
    text-align: center;
}

.info-base ul{
    display: table;
    margin: 0 auto;
}

.info-base li{
    padding: 5px 10px;
}

/*工作经历*/
.work-content{
    width: 500px;
    /*margin: 0 auto;*/
    margin-left: 150px;
}

/*项目经验*/
.project-content{
    width: 500px;
    margin-left: 150px;
}

/*教育经历*/
.education-content{
    width: 500px;
    margin-left: 150px;
}

.edit{
	float:right;
	
}
	</style> 
</head>
<body>
<!-- 主体部分，即简历查看页面的显示 -->
<div class="details-look mar-auto">
    <!-- 基本信息 -->
    <div class="info-base">
        <p class="base-name">${resumeBasic.name}</p>
        <ul class="clear-float">
        	<li class="float-l"><img src="images/img_sex.png" /> ${resumeBasic.sex}</li>
            <li class="float-l"><img src="images/img_skill.png"/> ${resumeBasic.skill}</li>
           
        </ul>
        <ul class="clear-float">
           
         	<li class="float-l"><img src="images/img_phonenumber.png"/> <span id="phonenumber">${resumeBasic.phonenumber}</span></li>
            <li class="float-l"><img src="images/img_workTime.png"/> ${resumeBasic.workTime}年</li>
        
        </ul>
        <ul class="clear-float">
            
            <li class="float-l"><img src="images/img_email.png"/> ${resumeBasic.email}</li> 
        </ul>
    </div>
    <br/>
    <hr/>
    <!-- 工作经历 -->
    <div class="info-work clear-float">
    	<br/>
        <div class="work-title float-l"><span class="span-style font-size-16">工作经历</span></div>
        <div class="work-content float-l">
          	<#list  workExperienceList as workExperience>
          		<ul class="clear-float font-size-16">
                	<li class="float-l"><img src="images/img_name.png"/> ${workExperience.company}</li>
                	<li class="float-r"><img src="images/img_workTime.png"/> ${workExperience.workTimeStart}至${workExperience.workTimeEnd}</li>
            	</ul>
            	<span class="span-style"><img src="images/img_position.png"/> ${workExperience.position}</span>
            	<p>
                	<img src="images/img_content.png"/> ${workExperience.workContent}
            	</p>
            	<br/>
          	</#list>
        </div>
    </div>
     <br/>
    <hr/>
    <!-- 项目经验 -->
    <div class="info-project clear-float">
    	<br/>
        <div class="project-title float-l"><span class="span-style">项目经验</span></div>
        <div class="project-content float-l">
            <#list  projectExperienceList as projectExperience>
          		<ul class="clear-float font-size-16">
                	<li class="float-l"><img src="images/img_name.png"/> ${projectExperience.projectName}</li>
                	<li class="float-r"><img src="images/img_workTime.png"/> ${projectExperience.projectTimeStart}至${projectExperience.projectTimeEnd}</li>
            	</ul>
            	<span class="span-style"><img src="images/img_role.png"/> ${projectExperience.projectRole}</span>
            	<p>
                	<img src="images/img_content.png"/> ${projectExperience.workContent}
            	</p>
            	<br/>
          	</#list>
        </div>
    </div>
     <br/>
    <hr/>
    <!-- 教育经历 -->
    <div class="info-education clear-float">
    	<br/>
        <div class="education-title float-l"><span class="span-style">教育经历</span></div>
        <div class="education-content float-l">
            <#list  eductionExperienceList as eductionExperience>
          		<ul class="clear-float font-size-16">
                	<li class="float-l"><img src="images/img_school.png"/> ${eductionExperience.school}</li>
                	<li class="float-r"><img src="images/img_workTime.png"/> ${eductionExperience.graduationTime}</li>
            	</ul>
            	<span class="span-style"><img src="images/img_major.png"/> ${eductionExperience.major}</span>
            	<p>
                	<img src="images/img_degree.png"/> ${eductionExperience.degree}
            	</p>
            	<br/>
          	</#list>
        </div>
    </div>
</div>
</body>
</html>