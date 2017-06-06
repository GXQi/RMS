<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link href="./css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="./css/nav-style.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="./js/bootstrap.min.js"></script>
    <script type="text/javascript" src="./js/jquery-3.1.0.min.js"></script>
    <script>
    	function loadInfo(){
    	console.log("get");
    		$.ajax({
    			type:"get",
    			url:"/rms/resumemanage/insert",
    			success:function(message){
    					console.log(message);
    				},
    			error:function(){
    					alert("error!");
    				}
    			})
    	}
    </script>
</head>
<body onload="loadInfo()">
</body>
</html>