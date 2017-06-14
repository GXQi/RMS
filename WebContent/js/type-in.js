  function appendWork() {
            const table =
                    '<div><hr/><button class="delete btn btn-default" value="X">x</button>' +
                    '<div class="basic"> ' +
                    '<table width="650" height="250">' +
                    '<tr>' +
                    '<td class="td-left">公司名称 &nbsp;&nbsp;</td>' +
                    '<td><input type="text" required style="width: 300px" class="text"/></td>' +
                    '</tr><tr><td class="td-left">职位</td>' +
                    '<td><input type="text" required class="text"/>' +
                    '</tr>' +
                    '<tr>' +
                    '<td class="td-left">在职时间</td>' +
                    '<td><input type="date" class="text"/>至<input type="date" class="text"/></td>' +
                    '<td></td>' +
                    '</tr>' +
                    '<tr>' +
                    '<td style="vertical-align: top" class="td-left">工作内容</td>' +
                    '<td><textarea rows="5" cols="60" class="text"></textarea></td>' +
                    '</tr>' +
                    '</table></div class="basic"></div>';
            $("#content").append(table);
            document.body.addEventListener("click", function (event) {
                var target = event.target;
                if (target.nodeName === "BUTTON") {
                    target.parentNode.remove();
                }
            }, false);
        }

        function appendProject() {
            const table = '<div><hr/><button class="delete btn btn-default" value ="x1">X</button><div class="basic"><table width="650" height="250"> <tr>' +
                    '<td class="td-left">项目名称</td> <td><input type="text" class="text1" required style="width: 300px"/></td>' +
                    '</tr><tr> <td class="td-left">项目角色</td><td><input type="text" required class="text1"/>' +
                    '</tr><tr><td class="td-left">项目时间</td><td><input type="date" class="text1"/>至<input type="date" class="text1"/></td>' +
                    '<td></td></tr><tr><td style="vertical-align: top" class="td-left">项目描述</td>' +
                    '<td><textarea rows="5" cols="60" class="text1"></textarea></td></tr></table></div></div>';
            $("#project").append(table);
            document.body.addEventListener("click", function (event) {
                var target = event.target;
                if (target.nodeName === "BUTTON") {
                    target.parentNode.remove();
                }
            }, false);
        }
        function appendEdu() {
            const table = '<div><hr/><button class="delete btn btn-default" value="x2">X</button><div class="basic"><table width="700" height="100" ><tr><td class="td-fourth">学校名称</td>' +
                    '<td><input type="text" required class="text2"/></td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<td class="td-fourth">所学专业</td>' +
                    '<td><input type="text" required class="text2"/></td> </tr><tr><td class="td-fourth">学位</td>' +
                    '<td><input type="text" required class="text2"/></td><td class="td-fourth">毕业年份</td><td><input type="date" class="text2"/></td>' +
                    '</tr></table></div></div>';
            $("#edu").append(table);
            document.body.addEventListener("click", function (event) {
                var target = event.target;
                if (target.nodeName === "BUTTON") {
                    target.parentNode.remove();
                }
            }, false);
        }

        function submit(tag) {
            var data = {"prephone":{},"basic": {}, "work": {}, "project": {}, "edu": {}};
            var nodes2 = $(".text");
            var nodes3 = $(".text1");
            var nodes4 = $(".text2");

            const name = document.getElementById("name").value;
            const phone = document.getElementById("phone").value;
            const email = document.getElementById("mail").value;
            const kill = document.getElementById("key-kill").value;
            const work = document.getElementById("workExperience").value;
            
            data.prephone = document.getElementById("phone").value;
            data.basic[0] = name;
            data.basic[1] = phone;
            data.basic[2] = $("input[name='sex']:checked").val();
            data.basic[3] = email;
            data.basic[4] = kill;
            data.basic[5] = work;

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
            $.ajax({
                type: "POST",
                url: "/RMS/resumemange/inert",
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
                        document.getElementById("myBtn").addEventListener("click", function () {
                            var light = document.getElementById('light');
                            light.style.display = 'none';
                        });
                    }
                }
            });
        }

        function versify() {
            const phone = document.getElementById("phone").value;
            if (phone) {
                if (!(/^1[34578]\d{9}$/.test(phone))) {
                    $("#tip1").text("输入格式有误！");
                    document.getElementById("phone").value = '';
                    setTimeout("$('#tip1').text('')", 1300);
                }
            }
        }

        function check() {
            const email = document.getElementById("mail").value;
            if (email) {
                var reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/;
                if (!(reg.test(email))) {
                    $("#tip2").text("输入格式有误！");
                    document.getElementById("mail").value = '';
                    setTimeout("$('#tip2').text('')", 1300);
                }
            }
        }

        function toMain() {
            window.location.href = "/RMS/main";
        }

        function logout() {
            window.location.href = "/RMS/login";
        }