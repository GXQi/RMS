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
    <script>
    	function submits(tag){
    		var data = {"flag":1,"prephone":{},"basic": {}, "work": {}, "project": {}, "edu": {}};
    	
    		const prephone = ${resumeBasic.phonenumber};
    		const name = document.getElementById("name").value;
            const phone = document.getElementById("phone").value;
            const email = document.getElementById("email").value;
            const kill = document.getElementById("skill").value;
            const work = document.getElementById("workTime").value;
            
            data.prephone = prephone;
            data.basic[0] = name;
            data.basic[1] = phone;
            data.basic[2] = $("input[name='sex']:checked").val();
            data.basic[3] = email;
            data.basic[4] = kill;
            data.basic[5] = work;
            
            var nodes2 = $(".text");
            var nodes3 = $(".text1");
            var nodes4 = $(".text2");
            
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
            console.log(json);
            
             $.ajax({
                type: "POST",
                url: "/RMS/insert",
                contentType: "application/json; charset=utf-8",
                data: json,
                dataType: "json",
                success: function (result) {
                    if (result.message === "success") {
                       window.location.href = "/RMS/main";
                    }
                    else if(result.message === "error"){
                        var light = document.getElementById(tag);
                        light.style.display = 'block';
                        document.getElementById("close2").addEventListener("click", function () {
                            var light = document.getElementById('light');
                            light.style.display = 'none';
                        });
                    }
                }
            });
    	}
    	function upload(){
    		var formData=new FormData($('#uploadForm')[0]); 
    		const phonenumber=document.getElementById("phone").value;
    		formData.append("phonenumber",phonenumber);
    		$.ajax({
    			url: '/RMS/upload',
    			type: 'POST',
    			cache: false,
    			data: formData,
    			processData: false,
    			contentType: false
				}).done(function(res) {
					if(res=="true"){
						alert("上传成功");
					}else{
						alert("上传失败");
					}
				}).fail(function(res) {});
    	}
    	function deleteFile(){
    		const phonenumber=document.getElementById("phone").value;
    		var data={"phonenumber":phonenumber};
   			var temp = document.createElement("form");
  			temp.action = "/RMS/deleteFile";
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
    	}
    
    </script>
</head>
<body>
<div class="header">
    <div class="title">
       <span><a onclick="toMain()">简历管理平台</a></span>
    </div>
    <div class="title repo">
        简历库
    </div>
    <nav class="username">
        UserName | <a onclick = "logout()">Log Out</a>
    </nav>
</div>
<div class="content">
   		<#if (path ??)>
   			${path}<img src="/RMS/images/img_delete.png" onclick="deleteFile()" />
   			<#else>
   			<form id="uploadForm" enctype="multipart/form-data" class="username" >
    		<input id="file" type="file" name="file" class="title"/>
    		<br>
    		<button onclick="upload()" type="button">上传简历附件</button>
			</form>
   		</#if>
   		
    <hr/>
    <div>
        <div class="label">
            基本信息
        </div>
            <div class="basic">
                <table width="700" height="150">
                    <tr>
                        <td class="td1">姓名</td>
                        <td class="td2"><input type="text" required id="name" value=${resumeBasic.name} /></td>
                        <td class="td3"></td>
                        <td class="td4">电话</td>
                        <td class="td5"><input type="text" required id="phone" onblur="versify()" value=${resumeBasic.phonenumber} /></td>
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
                        <td class="td5"><input type="text" required onblur="check()" id="email" value=${resumeBasic.email} /></td>
                    </tr>
                    <tr>
                        <td class="td1">关键技能</td>
                        <td class="td2"><input type="text" required id="skill" value=${resumeBasic.skill} /></td>
                        <td class="td3"></td>
                        <td class="td4">工作年限</td>
                        <td class="td5"><input type="text" required id="workTime" value=${resumeBasic.workTime} /></td>
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
                        <td class=""><input type="text" required style="width: 300px" class="text" value=${work.company} /></td>
                    </tr>
                    <tr>
                        <td class="td-left">职位</td>
                        <td class=""><input type="text" required class="text" value=${work.position} /></td>
                    </tr>
                    <tr>
                        <td class="td-left">在职时间</td>
                        <td class=""><input type="date" class="text" value=${work.workTimeStart} />至<input type="date" class="text" value=${work.workTimeEnd} /></td>
                        <td class=""></td>

                    </tr>
                    <tr>
                        <td style="vertical-align: top" class="td-left">工作内容</td>
                        <td><textarea rows="5" cols="60" class="text">${work.workContent}</textarea></td>
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
                        <td class=""><input type="text" required style="width: 300px" class="text1" value=${project.projectName} /></td>
                    </tr>
                    <tr>
                        <td class="td-left">项目角色</td>
                        <td class=""><input type="text" required class="text1" value=${project.projectRole} />
                    </tr>
                    <tr>
                        <td class="td-left">项目时间</td>
                        <td class=""><input type="date" class="text1" value=${project.projectTimeStart} />至<input type="date" class="text1" value=${project.projectTimeEnd} /></td>
                        <td class=""></td>

                    </tr>
                    <tr>
                        <td style="vertical-align: top" class="td-left">项目描述</td>
                        <td><textarea rows="5" cols="60" class="text1">${project.workContent} </textarea></td>
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
                        <td class=""><input type="text" required class="text2" value=${eduction.school} /></td>
                        <td class="td-fourth">所学专业</td>
                        <td class=""><input type="text" required class="text2" value=${eduction.major} /></td>
                    </tr>
                    <tr>
                        <td class="td-fourth">学位</td>
                        <td class=""><input type="text" required class="text2" value=${eduction.degree} /></td>
                        <td class="td-fourth">毕业年份</td>
                        <td class=""><input type="date" class="text2" value=${eduction.graduationTime} /></td>
                    </tr>                  
                </table>
               
                
            </div>
             </#list>
             </#if>
        </div>
    </div>
    <div class="footer">
        <button class="btn btn-default" onclick="submits('light2')">确定</button>
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
    <div id="light2" class="white_content">
            <div class="con">
                提交失败！
                <button class="btn btn-default" id="close2">关闭</button>
            </div>
        </div>
</div>
</body>
</html>