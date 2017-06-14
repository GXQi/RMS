		$(document).ready(function (){
        	document.body.addEventListener("click", function (event) {
                var target = event.target;         
                if (target.nodeName === "A" && target.parentNode.nodeName === "DIV") {
                    var light = document.getElementById('light');//取到确定删除的提问框
                    var light1 = document.getElementById('light1');//取到删除成功框
                    light.style.display = 'block';//显示确定删除？提问框
                    document.getElementById("myBtn").addEventListener("click", function () {	
                    			target.parentNode.remove();//删除成功之后移除
                                light.style.display = 'none';//提示框确定删除？隐藏
                                light1.style.display = 'block';//提示删除成功显示
                    })
                   
                    document.getElementById("close").addEventListener("click", function () {
                        var light = document.getElementById('light');
                        light.style.display = 'none';
                    });

                    document.getElementById("close1").addEventListener("click", function () {
                        var light1 = document.getElementById('light1');
                        light1.style.display = 'none';
                    });

                }
            }, false);
        });  