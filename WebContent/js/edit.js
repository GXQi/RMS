        function appendWorks() {
            const table =
                    '<div><hr/><a class="delete">x</a>' +
                    '<div class="basic"> ' +
                    '<table width="700" height="250">' +
                    '<tr>' +
                    '<td class="td-left">公司名称 &nbsp;&nbsp;</td>' +
                    '<td><input type="text" required style="width: 300px" class="text1"/></td>' +
                    '</tr><tr><td class="td-left">职位</td>' +
                    '<td><input type="text" required class="text1"/>' +
                    '</tr>' +
                    '<tr>' +
                    '<td class="td-left">在职时间</td>' +
                    '<td><input type="date" class="text1"/>至<input type="date" class="text1"/></td>' +
                    '<td></td>' +
                    '</tr>' +
                    '<tr>' +
                    '<td style="vertical-align: top" class="td-left">工作内容</td>' +
                    '<td><textarea rows="5" cols="60" class="text1"></textarea></td>' +
                    '</tr>' +
                    '</table></div class="basic"></div>';

            $("#content").append(table);
            document.body.addEventListener("click", function (event) {
                var target = event.target;
                if (target.nodeName === "A" && target.parentNode.nodeName === "DIV") {
                    var light = document.getElementById('light');//取到确定删除的提问框
                    var light1 = document.getElementById('light1');//取到删除成功框
                    light.style.display = 'block';//显示确定删除？提问框
                    document.getElementById("myBtn").addEventListener("click", function () {
                    	
                        const remove = target.parentNode.getElementsByClassName('text1');
                        const phone = document.getElementById('phone').value;
                        var data = {"phone":phone,"removeElement":{}};

                        for (let i = 0, l = remove.length; i < l; i++) {
                            data.removeElement[i] = remove[i].value;
                        }
                        
                        $.ajax({
                            type: "POST",
                            url: "/RMS/resumemanage/remove",
                            contentType: "application/json; charset=utf-8",
                            data: data,
                            dataType: "json",
                            success: function (result) {
                                target.parentNode.remove();//删除成功之后移除
                                light.style.display = 'none';//提示框确定删除？隐藏
                                light1.style.display = 'block';//提示删除成功显示
                            }
                        });
                    });

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
        }

        function appendProjects() {
            const table = '<div><hr/><a class="delete">x</a><div class="basic"><table width="700" height="250"> <tr>' +
                    '<td class="td-left">项目名称</td> <td><input type="text" class="text1" required style="width: 300px"/></td>' +
                    '</tr><tr> <td class="td-left">项目角色</td><td><input type="text" required class="text1"/>' +
                    '</tr><tr><td class="td-left">项目时间</td><td><input type="date" class="text1"/>至<input type="date" class="text1"/></td>' +
                    '<td></td></tr><tr><td style="vertical-align: top" class="td-left">项目描述</td>' +
                    '<td><textarea rows="5" cols="60" class="text1"></textarea></td></tr></table></div></div>';
            $("#project").append(table);
            addRemove();
        }
        function appendEdus() {
            const table = '<div><hr/><a class="delete">x</a><div class="basic"><table width="700" height="100" ><tr><td class="td-fourth">学校名称</td>' +
                    '<td><input type="text" required class="text2"/></td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<td class="td-fourth">所学专业</td>' +
                    '<td><input type="text" required class="text2"/></td> </tr><tr><td class="td-fourth">学位</td>' +
                    '<td><input type="text" required class="text2"/></td><td class="td-fourth">毕业年份</td><td><input type="date" class="text2"/></td>' +
                    '</tr></table></div></div>';
            $("#edu").append(table);
            addRemove();
        }
        

       