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
                    <dd class="select-all selected"><a href="#">不限</a></dd>
                    <dd><a href="#">应届毕业生</a></dd>
                    <dd><a href="#">1年以下</a></dd>
                    <dd><a href="#">1-3年</a></dd>
                    <dd><a href="#">3-5年</a></dd>
                    <dd><a href="#">5-10年</a></dd>
                    <dd><a href="#">10年以上</a></dd>
                </dl>
            </li>
            <li class="select-list">
                <dl id="select2">
                    <dt>最高学历：</dt>
                    <dd class="select-all selected"><a href="#">不限</a></dd>
                    <dd><a href="#">大专及以上</a></dd>
                    <dd><a href="#">本科及以上</a></dd>
                    <dd><a href="#">硕士及以上</a></dd>
                    <dd><a href="#">博士及以上</a></dd>
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
        <div class="total-resume float-l font-size-16">共？份简历</div>
        <div class="new-resume float-r font-size-16"><a href="#">录入新简历</a></div>
    </div>
    <hr/>
    <!-- 显示信息列表 -->

    <div class="no-resume font-size-16 mar-auto">简历库中还没有简历哦<br/><a href="">开始录入新简历</a></div>
</div>
</body>
</html>