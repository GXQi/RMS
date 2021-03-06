<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>简历查找</title>
    <link rel="stylesheet" type="text/css" href="/RMS/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/RMS/css/search.css">
    <link rel="stylesheet" type="text/css" href="/RMS/css/base.css">
    <script type="text/javascript" src="/RMS/js/jquery-3.1.0.min.js"></script>
    <script type="text/javascript" src="/RMS/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/RMS/js/jquery-3.2.1.js"></script>
    <style>
    body{
		background-image:url("/RMS/images/background.jpg");  
		background-repeat: no-repeat; 
		background-attachment:fixed; 
		background-size: cover; 
	}
   		.selected{
    		color:#ffffff;
    		background-color:/*#f60*/#CCC;
		}
		
		.selected1{
    		color:#ffffff;
    		background-color:/*#f60*/#CCC;
		}
		
    </style>
    <script>
    	var a = ${workTime};
    	var b = ${degree};
    	var total=${total};
		var totalPage=${totalPage};
    	var currentPage=${currentPage};
   		function a0() {
        	a = -1;
        	currentPage=1;
        	send();
    	}
    	function a1() {
        	a = 0;
        	currentPage=1;
        	send();
    	}
    	function a2() {
       		a = 1;
        	currentPage=1;
        	send();
    	}
    	function a3() {
        	a = 2;
      		currentPage=1;     
        	send();
    	}
    	function a4() {
       		a = 3;
        	currentPage=1; 
        	send();
    	}
    	function a5() {
       	 	a = 4;
        	currentPage=1; 
        	send();
    	}
    	function a6() {
        	a = 5;
       	 	currentPage=1; 
       	 	send();
    	}
    	function b0() {
        	b = -1;
        	send();
    	}
    	function b1() {
        	b = 0;
        	currentPage=1; 
        	send();
    	}
    	function b2() {
        	b = 1;
        	currentPage=1; 
        	send();
    	}
    	function b3() {
        	b = 2;
        	currentPage=1; 
        	send();
    	}
    	function b4() {
        	b = 3;
       	 	currentPage=1; 
        	send();
    	}
		function paging(event){
			var id=event.id;
			if(id=="first"){
				currentPage=1;
			}else if(id=="pre"){
				if(currentPage>1){
					currentPage-=1;
				}
			}else if(id=="next"){
				if(currentPage<totalPage){
					currentPage+=1;
				}else{
					currentPage=totalPage;
				}
			}else if(id.substring(0,8)=="page-num"){
				currentPage=parseInt(id.substring(8, 9));
			}else{
				currentPage=totalPage;
			}
			send();
		}
    	function send(){
    		var data={"degree":b,"workTime":a,"currentPage":currentPage};
   			var temp = document.createElement("form");
  			temp.action = "/RMS/select";
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
    $(document).ready(function(){
    	var cookie=document.cookie;
    	var name=decodeURI(cookie.split("=")[1]);
    	$("#username").text(name);
    	document.getElementById("username").innerHTML+="<b class='caret'></b> ";
    	for(var i = 1; i <= totalPage; i++){
			(function(arg){
				$("#next").before("<a id='page-num" + i + "' onclick='paging(this)'>" + i + "</a>");
			})(i);
		}
    	$("#select1 dd").click(function () {
			$(this).addClass("selected1").siblings().removeClass("selected1");
		});
		$("#select2 dd").click(function () {
			$(this).addClass("selected").siblings().removeClass("selected");
		});
    	var degree=${degree};
    	var workTime=${workTime};
    	switch(degree){
    		case -1:
    		$("#b0").addClass("selected");
    			break;
    		case 0:
    		$("#b1").addClass("selected");
    			break;
    		case 1:
    		$("#b2").addClass("selected");
    			break;
    		case 2:
    		$("#b3").addClass("selected");
    			break;
    		case 3:
    		$("#b4").addClass("selected");
    			break;	
    	}
    	switch(workTime){
    		case -1:
    		$("#a0").addClass("selected1");
    			break;
    		case 0:
    		$("#a1").addClass("selected1");
    			break;
    		case 1:
    		$("#a2").addClass("selected1");
    			break;
    		case 2:
    		$("#a3").addClass("selected1");
    			break;
    		case 3:
    		$("#a4").addClass("selected1");
    			break;	
    		case 4:
    		$("#a5").addClass("selected1");
    			break;	
    		case 5:
    		$("#a6").addClass("selected1");
    			break;	
    				
    	}
    	
    });
    
    function skip(){
    	if($("#find").val()==""){
    		currentPage=1;
    	}else{
    		if($("#find").val()>totalPage){
    			currentPage=1;;
    		}else{
    			currentPage=$("#find").val();
    		}
    	}
    	send();
    	
    }
    
    function details(e){
		var s=e.id.split("+")[1];
		var data={"phone":s};
		var temp = document.createElement("form");
		temp.action = "/RMS/show";
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
	
	function edit(e){
		var data={"phone":e.id};
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
	}
	
    
    
    

</script>
</head>
<body>
<!-- 导航栏 -->
<div class="search-nav">
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
                        Username<b class="caret"></b> 
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

<div class="search-content mar-auto">
    
    <hr/>
    <!-- 分类选择 -->
    <div class="search-select">
    <ul class="select mar-auto">
            <li class="select-list">
                <dl id="select1">
                    <dt>工作年限：</dt>
                    <dd id="a0"><a  onclick="a0(this)">不限</a></dd>
                    <dd id="a1"><a  onclick="a1(this)">应届毕业生</a></dd>
                    <dd id="a2"><a  onclick="a2(this)">1年以下</a></dd>
                    <dd id="a3"><a  onclick="a3(this)">1-3年</a></dd>
                    <dd id="a4"><a  onclick="a4(this)">3-5年</a></dd>
                    <dd id="a5"><a  onclick="a5(this)">5-10年</a></dd>
                    <dd id="a6"><a  onclick="a6(this)">10年以上</a></dd>
                </dl>
            </li>
            <li class="select-list">
                <dl id="select2">
                    <dt>最高学历：</dt>
                    <dd><a  onclick="b0(this)" id="b0">不限</a></dd>
                    <dd><a  onclick="b1(this)" id="b1">大专及以上</a></dd>
                    <dd><a  onclick="b2(this)" id="b2">本科及以上</a></dd>
                    <dd><a  onclick="b3(this)" id="b3">硕士及以上</a></dd>
                    <dd><a  onclick="b4(this)" id="b4">博士及以上</a></dd>
                </dl>
            </li>
           
        </ul>
    </div>

    <div class="hr-up clear-float">
        <div class="total-resume float-l font-size-16">共${total}份简历&nbsp;&nbsp;&nbsp;共${totalPage}页</div>
        <div class="new-resume float-r font-size-16"><a href="/RMS/type-in">录入新简历</a></div>
    </div>
    <hr/>
    <!-- 显示信息列表 -->
	<#if (resumeList?size <= 0)>
		 <div class="no-resume font-size-16 mar-auto">简历库中还没有简历哦<br/><a href="/RMS/type-in">开始录入新简历</a></div>
	</#if>
    
    
    <#if (resumeList?size >0)>
    	<div>
    	<table class="table table-striped" style="text-align:center;" border="1" id="table">
    	<thead>
    		<tr>
        		<th style="text-align:center;">姓名</th>
        		<th style="text-align:center;">关键技能</th>
        		<th style="text-align:center;">学历</th>
        		<th style="text-align:center;">性别</th>
        		<th style="text-align:center;">工作年限</th>       	
        		<th style="text-align:center;">公司</th>
        		<th style="text-align:center;">邮箱</th>
        		<th style="text-align:center;">手机号</th>
        		<th style="text-align:center;">操作</th>
    		</tr>
    	<thead>
   		<tbody id="table">
   			<#list resumeList as resume>
    		<tr>
        		<th style="text-align:center;"><a id=${resume.name}+${resume.phonenumber} onclick="details(this)">${resume.name}</a></th>
        		<th style="text-align:center;">${resume.skill}</th>
        		<th style="text-align:center;">${resume.degree}</th>
        		<th style="text-align:center;">${resume.sex}</th>
        		<th style="text-align:center;">${resume.workTime}</th>
        		<th style="text-align:center;">${resume.company}</th>
        		<th style="text-align:center;">${resume.email}</th>
        		<th style="text-align:center;">${resume.phonenumber}</th>
        		<th style="text-align:center;"><a id=${resume.phonenumber} onclick="edit(this)">编辑</a></th>
    		</tr>
    	</#list>	
   		</tbody>
    	
    </table>
    </div>
    </#if>
    
</div>
<div id="paging">
	
	
	<#if (resumeList?size > 0)>
		<center>
			<a id="first" onclick="paging(this)">首页</a>
			<a id="pre" onclick="paging(this)"><<</a>
			<a id="next" onclick="paging(this)">>></a>
			<a onclick="paging(this)" id="end">末页</a>
			<input type="text" id="find" placeholder="页码" class="page-num" />
			<a onclick="skip()">跳转</a>
		</center>
	</#if>
	
	
	
</div>
</body>
</html>