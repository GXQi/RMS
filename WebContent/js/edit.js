        function loadInfo() {
            const data = {"phonenumber": 17629034550};
            $.ajax({
                type: "GET",
                url: "/RMS/resumemanage/edit",
                contentType: "application/json; charset=utf-8",
                data: data,
                dataType: "json",
                success: function (result) {
                	console.log(result);
                    if (result) {
                        let basicInfo = [];
                        let workInfo = [];
                        let educInfo = [];
                        let proInfo = [];
                        const basic = result.resumeBasic;//取到基本信息的数据
                        const workList = result.workList;//取到工作经验
                        const educList = result.educList;//取到教育经历
                        const proList = result.proList;//获取项目经历                                                   
                        const sex = basic.sex;
                      
                        if (workList.length > 1) {
                            for (let i = 0; i < workList.length - 1; i++) {
                              appendWorks();
                            }
                        }

                        if (proList.length > 1) {
                            for (let i = 0; i < proList.length - 1; i++) {
                              appendProjects();
                            }
                        }

                        if (educList.length > 1){
                        	 for (let i = 0; i < educList.length - 1; i++) {
                                 appendEdus();
                               }
                        }

                        if (sex == "男") {
                            $("input[name='sex'][value='男']").attr("checked",true);
                        }
                        else {
                             $("input[name='sex'][value='女']").attr("checked",true);
                        }
                        $.each(basic, function (key, val) {
                            basicInfo.push(val); //将工作经验对象的值取出来放到workInfo数组里

                        });

                        for (let i = 0; i < workList.length; i++) {
                            $.each(workList[i], function (key, val) {
                                if (key != "phonenumber") {
                                    workInfo.push(val); //将工作经验对象的值取出来放到workInfo数组里
                                }
                            });
                        }
                        for (let i = 0; i < educList.length; i++) {
                            $.each(educList[i], function (key, val) {
                                if (key != "phonenumber") {
                                    educInfo.push(val); //将教育经历对象的值取出来放到educInfo数组里
                                }
                            });
                        }
                        for (let i = 0; i < proList.length; i++) {
                            $.each(proList[i], function (key, val) {
                                if (key != "phonenumber") {
                                    proInfo.push(val); //将项目经历信息对象的值取出来放到proInfo数组里
                                }
                            });
                        }

                        var text1 = document.getElementsByClassName("text1");//获取各基本信息输入框，除了性别
                        var text2 = document.getElementsByClassName("text2");//获取各基本信息输入框，除了性别
                        var text3 = document.getElementsByClassName("text3");//获取各基本信息输入框，除了性别
                        const name = document.getElementById("name");
                        const phone = document.getElementById("phone");
                        const mail = document.getElementById("email");
                        const skill = document.getElementById("skill");
                        const workTime = document.getElementById("workTime");
                        name.value = basicInfo[1];
                        phone.value = basicInfo[0];
                        mail.value = basicInfo[3];
                        skill.value = basicInfo[4];
                        workTime.value = basicInfo[5];

                        for (let i = 0, l = text1.length; i < l; i++) {
                            text1[i].value = workInfo[i];
                        }

                        for (let i = 0, l = text2.length; i < l; i++) {
                            text2[i].value = proInfo[i];
                        }

                        for (let i = 0, l = text3.length; i < l; i++) {
                            text3[i].value = educInfo[i];
                        }
                    }

                }
            });
        }
        
        function appendWorks() {
            const table =
                    '<div><hr/><a class="delete">x</a>' +
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
            addRemove();
        }

        function appendProjects() {
            const table = '<div><hr/><a class="delete">x</a><div class="basic"><table width="650" height="250"> <tr>' +
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
        
        function addRemove(){
        	 document.body.addEventListener("click", function (event) {
                 var target = event.target;
                 if (target.nodeName === "A") {
                	 
                     target.parentNode.remove();
                 }
             }, false);
        }