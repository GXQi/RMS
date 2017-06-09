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
    <script type="text/javascript" src="/RMS/js/select.js"></script>
    <script>
    var a = -1;
    var b = -1;

    function a0() {
        a = -1;
        send();
    }
    function a1() {
        a = 0;
        send();
    }
    function a2() {
        a = 1;
        send();
    }
    function a3() {
        a = 2;
        send();
    }
    function a4() {
        a = 3;
        send();
    }
    function a5() {
        a = 4;
        send();
    }
    function a6() {
        a = 5;
        send();
    }
    function b0() {
        b = -1;
        send();
    }
    function b1() {
        b = 0;
        send();
    }
    function b2() {
        b = 1;
        send();
    }
    function b3() {
        b = 2;
        send();
    }
    function b4() {
        b = 3;
        send();
    }

    function send(){
    	var data={"degree":b,"workTime":a};
   		 $.ajax({
        	type:"POST",
        	contentType:"application/json;charset=utf-8",
        	url:"/RMS/resumemanage/select",
        	dataType:"json",
        	data:JSON.stringify(data)
        
    	})
    }

</script>
</head>
<body>
<!-- 导航栏 -->
<div class="search-nav">
    <nav class="navbar navbar-inverse nav-size mar-auto" class="" role="navigation">
        <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">简历管理平台</a>
        </div>
        <div>
            <p class="navbar-text navbar-left">简历库</p>
            <!--向右对齐-->
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        UserName <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="#">登出</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        </div>
    </nav>
</div>

<div class="search-content mar-auto">
    <!-- 搜索框 -->
    <div class="search-input mar-auto">
        <form>
            <input type="text" name="search" placeholder="关键技能/姓名/手机/邮箱/公司等" />
            <button type="submit" value="">搜索</button>
        </form>
    </div>
    <hr/>
    <!-- 分类选择 -->
    <div class="search-select">
    <ul class="select mar-auto">
            <li class="select-list">
                <dl id="select1">
                    <dt>工作年限：</dt>
                    <dd class="select-all selected"><a  onclick="a0(this)">不限</a></dd>
                    <dd><a  onclick="a1(this)">应届毕业生</a></dd>
                    <dd><a  onclick="a2(this)">1年以下</a></dd>
                    <dd><a  onclick="a3(this)">1-3年</a></dd>
                    <dd><a  onclick="a4(this)">3-5年</a></dd>
                    <dd><a  onclick="a5(this)">5-10年</a></dd>
                    <dd><a  onclick="a6(this)">10年以上</a></dd>
                </dl>
            </li>
            <li class="select-list">
                <dl id="select2">
                    <dt>最高学历：</dt>
                    <dd class="select-all selected"><a  onclick="b0(this)">不限</a></dd>
                    <dd><a  onclick="b1(this)">大专及以上</a></dd>
                    <dd><a  onclick="b2(this)">本科及以上</a></dd>
                    <dd><a  onclick="b3(this)">硕士及以上</a></dd>
                    <dd><a  onclick="b4(this)">博士及以上</a></dd>
                </dl>
            </li>
            <li class="select-result">
                <dl>
                    <dt>已选条件：</dt>
                    <dd class="select-no">暂时没有选择过滤条件</dd>
                </dl>
            </li>
        </ul>
    </div>

    <div class="hr-up clear-float">
        <div class="total-resume float-l font-size-16">共${total}份简历</div>
        <div class="new-resume float-r font-size-16"><a href="/RMS/type-in">录入新简历</a></div>
    </div>
    <hr/>
    <!-- 显示信息列表 -->
	<#if (resumeList?size <= 0)>
		 <div class="no-resume font-size-16 mar-auto">简历库中还没有简历哦<br/><a href="/RMS/type-in">开始录入新简历</a></div>
	</#if>
    
    
    <#if (resumeList?size >0)>
    	<div>
    	<table class="table table-striped" style="text-align:center;">
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
   		<tbody>
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
</body>
</html>