<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>KK选课系统 KK Curricula-Variable System</title>
    <link href="${cp}/img/ico.ico" rel="icon"  type="image/x-ico" />
    <link href="${cp}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${cp}/css/jquery.fullPage.css" rel="stylesheet">
    <link href="${cp}/css/kkcvs.css" rel="stylesheet">

    <script src="${cp}/js/jquery.min.js" type="text/javascript"></script>
    <script src="${cp}/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="${cp}/js/jquery.fullPage.js" type="text/javascript"></script>
    <script src="${cp}/js/jquery.fullPage.min.js" type="text/javascript"></script>
    <script src="${cp}/js/ajaxfileupload.js" type="text/javascript"></script>
    <script src="${cp}/js/layer.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function(){
            $('#fullpage').fullpage({

                //sectionsColor: ['#1bbc9b', '#4BBFC3', '#7BAABE', '#f90']
                anchors: ['page1', 'page2', 'page3', 'page4', 'page5', 'page6','page7','page8'],
                //menu: '#menu'
            });
            $.fn.fullpage.setAllowScrolling(false);
            $.fn.fullpage.setKeyboardScrolling(false);
        });
    </script>
    <!--[if lt IE 9]>
    <script src="${cp}/js/html5shiv.min.js"></script>
    <script src="${cp}/js/respond.min.js"></script>
    <![endif]-->
</head>
<body>
    <jsp:include page="include/header.jsp"/>
    <jsp:include page="include/footer.jsp"/>
    <div class="diy-r-t" onclick="refresh()">
        返回首页
    </div>
    <div id="fullpage">
        <div class="section">
            <div class="container">
                <div class="row">
                    <div id="teacherInfoArea" class="col-sm-4 col-md-4 col-lg-4">
                    </div>
                    <div id="functionListArea" class="col-sm-8 col-md-8 col-lg-8">
                    </div>
                </div>
            </div>
        </div>
        <div class="section">
            <div id="studentManage" class="courseListHeight"></div>
        </div>
        <div class="section">
            <div id="teacherManage" class="courseListHeight"></div>
        </div>
        <div class="section">
            <div id="courseManage" class="courseListHeight"></div>
        </div>
        <div class="section">
            <div id="courseOpenManage" class="courseListHeight"></div>
        </div>
        <div class="section">
            <div id="courseChoiceManage" class="courseListHeight"></div>
        </div>
        <div class="section">
            <div id="collegeManage" class="courseListHeight"></div>
        </div>
        <div class="section">
            <div id="teacherCourses" class="courseListHeight"></div>
        </div>
    </div>
    <script type="text/javascript">
        var provinceList = new Array(
                "安徽省", "澳门特别行政区", "北京市", "重庆市", "福建省", "甘肃省", " 广东省",
                "广西壮族自治区", "贵州省", "海南省", "河北省", "河南省", "黑龙江省", "湖北省",
                "湖南省", "吉林省", "江苏省", "江西省", "辽宁省", "内蒙古自治区", "宁夏回族自治区",
                "青海省", "山东省", "山西省", "陕西省", "上海市", "四川省", "台湾省", "天津市",
                "西藏自治区", "香港特别行政区", "新疆维吾尔族自治区", "云南省", "浙江省"
        );

        function refresh(){
            window.location.href="${cp}/teacher";
        }
        initTeacherInfo();
        initFunctionList();
        function initTeacherInfo() {
            var teacherInfoArea = document.getElementById("teacherInfoArea");
            var teacherName = "${currentTeacher.teacherName}";
            var teacherAge= "${currentTeacher.teacherAge}";
            var teacherSex,teacherTitle,teacherCollege,teacherRole;
            var college = getCollege(${currentTeacher.teacherCollege});
            teacherCollege = college.collegeName;
            if("${currentTeacher.teacherSex}" == "0" ){
                teacherSex = "男";
            }
            else
                teacherSex = "女";
            if("${currentTeacher.teacherTitle}" == "0")
                teacherTitle = "讲师";
            else if("${currentTeacher.teacherTitle}" == "1")
                teacherTitle = "副教授";
            else if("${currentTeacher.teacherTitle}" == "2")
                teacherTitle = "教授";

            if("${currentTeacher.teacherRole}" == "0")
                teacherRole = "普通教师";
            else if("${currentTeacher.teacherRole}" == "1")
                teacherRole = "学院管理员";
            else if("${currentTeacher.teacherRole}" == "2")
                teacherRole = "超级管理员";
            
            var html="";
            html =  '<div class="col-sm-12 col-md-12 col-lg-12">'+
                    '   <div class="row">'+
                    '       <div class="col-sm-2 col-md-2 col-lg-2"></div>'+
                    '           <img src="${cp}/img/01.jpg" class="img-thumbnail col-md-8 col-md-8 col-lg-8"/>'+
                    '       </div>'+
                    '       <table class="table mg-t-10" border="0">'+
                    '           <tr>'+
                    '               <th>姓名：</th>'+
                    '               <td>'+teacherName+'</td>'+
                    '           </tr>'+
                    '           <tr>'+
                    '               <th>性别：</th>'+
                    '               <td>'+teacherSex+'</td>'+
                    '           </tr>'+
                    '           <tr>'+
                    '               <th>年龄：</th>'+
                    '               <td>'+teacherAge+'</td>'+
                    '           </tr>'+
                    '           <tr>'+
                    '               <th>职称：</th>'+
                    '               <td>'+teacherTitle+'</td>'+
                    '           </tr>'+
                    '           <tr>'+
                    '               <th>学院：</th>'+
                    '               <td>'+teacherCollege+'</td>'+
                    '           </tr>'+ 
                    '           <tr>'+
                    '               <th>权限级别：</th>'+
                    '               <td>'+teacherRole+'</td>'+
                    '           </tr>'+
                    '       </table>'+
                    '</div>';
            teacherInfoArea.innerHTML = html;
        }

        function getCollege(collegeId){
            var college = {};
            var results = "";
            college.collegeId = collegeId;
            $.ajax({
                async : false,
                type : 'POST',
                url : '${cp}/getCollegeById',
                data : college,
                dataType : 'json',
                success : function(result) {
                    results = result.result;
                    if(results == "none")
                        layer.alert("学院不存在");
                },
                error : function(result) {
                    layer.alert('查询学院错误');
                }
            });
            return JSON.parse(results);
        }

        function getAllCollege(){
            var teacher = {};
            var results = "";
            teacher.teacherId = ${currentTeacher.teacherId};
            $.ajax({
                async : false,
                type : 'POST',
                url : '${cp}/getAllCollege',
                data : teacher,
                dataType : 'json',
                success : function(result) {
                    results = result.result;
                    if(results == "error")
                        layer.alert("用户无权限");
                    else if(results == "none"){
                        layer.alert("请先添加学院");
                    }
                },
                error : function(result) {
                    layer.alert('查询所有学院错误');
                }
            });
            return eval("("+results+")");
        }

        function initFunctionList() {
            var functionList = document.getElementById("functionListArea");
            var html = "";
            html =  '                        <div class="row pd-t-40">'+
                    '                            <div class="col-sm-1 col-md-1 col-lg-1"></div>'+
                    '                            <div class="main-button2 col-sm-4 col-md-4 col-lg-4">'+
                    '                                <div class="main-button2-inner-text" onclick="showTeacherCourse()">'+
                    '                                    查看所开设课程'+
                    '                                </div>'+
                    '                            </div>'+
                    '                            <div class="col-sm-2 col-md-2 col-lg-2"></div>'+
                    '                            <div class="main-button2 col-sm-4 col-md-4 col-lg-4">'+
                    '                                <div class="main-button2-inner-text">'+
                    '                                    查看选课学生'+
                    '                                </div>'+
                    '                            </div>'+
                    '                            <div class="col-sm-1 col-md-1 col-lg-1"></div>'+
                    '                        </div>'+
                    '                        <div class="row pd-t-40">'+
                    '                            <div class="col-sm-1 col-md-1 col-lg-1"></div>'+
                    '                            <div class="main-button2 col-sm-4 col-md-4 col-lg-4">'+
                    '                                <div class="main-button2-inner-text">'+
                    '                                    录入成绩'+
                    '                                </div>'+
                    '                            </div>'+
                    '                            <div class="col-sm-2 col-md-2 col-lg-2"></div>';
            if("${currentTeacher.teacherRole}" == "0")
                html+=  '                            <div class="main-button2 col-sm-4 col-md-4 col-lg-4">'+
                        '                                <div class="main-button2-inner-text">'+
                        '                                    待定添加'+
                        '                                </div>'+
                        '                            </div>'+
                        '                            <div class="col-sm-1 col-md-1 col-lg-1"></div>'+
                        '                        </div>';
            else
                html+=  '                            <div class="main-button2 col-sm-4 col-md-4 col-lg-4" onclick="initSuperFunctionList()">'+
                        '                                <div class="main-button2-inner-text">'+
                        '                                    管理员模式'+
                        '                                </div>'+
                        '                            </div>'+
                        '                            <div class="col-sm-1 col-md-1 col-lg-1"></div>'+
                        '                        </div>';
            functionList.innerHTML += html;
        }
        
        function getTeacherCourse() {
            var teacher = {};
            var results = "";
            teacher.teacherId = ${currentTeacher.teacherId};
            $.ajax({
                async : false,
                type : 'POST',
                url : '${cp}/getTeacherCourse',
                data : teacher,
                dataType : 'json',
                success : function(result) {
                    results = result.result;
                },
                error : function(result) {
                    layer.alert('查询教师课程错误');
                }
            });
            return eval("("+results+")");
        }
        
        function showTeacherCourse() {
            window.location.href = "#page8";
            var teacherCourses = document.getElementById("teacherCourses");
            var html;
            var courses = getTeacherCourse();
            html = '<div class="container">'+
                    '                  <div class="row studentsTable">'+
                    '                        <table class="table col-sm-12 col-md-12 col-lg-12">'+
                    '                              <tr>'+
                    '                                    <th>课程号</th>'+
                    '                                    <th>课程名</th>'+
                    '                                    <th>选课人数</th>'+
                    '                                    <th>上课时间</th>'+
                    '                                    <th>上课地点</th>'+
                    '                                    <th>答疑时间</th>'+
                    '                                    <th>答疑地点</th>'+
                    '                                    <th>查看学生</th>'+
                    '                              </tr>';
            for(var i=0;i<courses.length;i++){
                var courseId = courses[i].courseId;
                var courseTerm = courses[i].courseTerm;
                var course = getCourse(courseId);
                var courseNumber = courses[i].courseChoiceNumber+"/"+courses[i].courseLimitNumber;
                var courseTime = courses[i].courseTime;
                var coursePlace = courses[i].coursePlace;
                var courseAnswerTime = courses[i].courseAnswerTime;
                var courseAnswerPlace = courses[i].courseAnswerPlace;
                html+=  '                              <tr>'+
                        '                                    <td>'+courseId+'</td>'+
                        '                                    <td>'+course.courseName+'</td>'+
                        '                                    <td>'+courseNumber+'</td>'+
                        '                                    <td>'+courseTime+'</td>'+
                        '                                    <td>'+coursePlace+'</td>'+
                        '                                    <td>'+courseAnswerTime+'</td>'+
                        '                                    <td>'+courseAnswerPlace +'</td>'+
                        '                                    <td><button class="btn btn-default" onclick="showTeacherCourseStudent(\''+courses[i].courseTeacher+'\',\''+courseId+'\')">查看选课学生</button> </td>'+
                        '                              </tr>';
            }
            html+=  '                           </table>'+
                    '                       </div>'+
                    '                  </div>'+
                    '            </div>';
            teacherCourses.innerHTML = html;
        }

        function getTeacherCourseStudent(teacherId,courseId) {
            var teacher = {};
            var results = "";
            teacher.teacherId = teacherId;
            teacher.courseId = courseId;
            $.ajax({
                async : false,
                type : 'POST',
                url : '${cp}/getTeacherCourseStudent',
                data : teacher,
                dataType : 'json',
                success : function(result) {
                    results = result.result;
                },
                error : function(result) {
                    layer.alert('查询教师课程错误');
                }
            });
            return eval("("+results+")");
        }

        function showTeacherCourseStudent(teacherId,courseId) {
            window.location.href = "#page8";
            var teacherCourses = document.getElementById("teacherCourses");
            var html;
            var courses = getTeacherCourseStudent(teacherId,courseId);
            html = '<div class="container">'+
                    '                  <div class="row studentsTable">'+
                    '                        <table class="table col-sm-12 col-md-12 col-lg-12">'+
                    '                              <tr>'+
                    '                                    <th>学号</th>'+
                    '                                    <th>姓名</th>'+
                    '                                    <th>学院</th>'+
                    '                                    <th>课程</th>'+
                    '                                    <th>平时成绩</th>'+
                    '                                    <th>考试成绩</th>'+
                    '                                    <th>最终成绩</th>'+
                    '                                    <th>是否修改</th>'+
                    '                              </tr>';
            for(var i=0;i<courses.length;i++){
                var student = getStudentById(courses[i].studentId);
                var college = getCollege(student.studentCollege);
                var course = getCourse(courses[i].courseId);
                html+=  '                              <tr>'+
                        '                                    <td>'+student.studentId+'</td>'+
                        '                                    <td>'+student.studentName+'</td>'+
                        '                                    <td>'+college.collegeName+'</td>'+
                        '                                    <td>'+course.courseName+'</td>'+
                        '                                    <td id="dailyScore'+student.studentId+'">'+courses[i].courseDailyScore+'</td>'+
                        '                                    <td id="examScore'+student.studentId+'">'+courses[i].courseExamScore+'</td>'+
                        '                                    <td>'+courses[i].courseFinalScore +'</td>'+
                        '                                    <td id="button'+student.studentId+'"><button class="btn btn-default" onclick="inputScore(\''+student.studentId+'\',\''+courses[i].courseId+'\',\''+courses[i].courseTerm+'\',\''+courses[i].courseTeacher+'\')">输入成绩</button> </td>'+
                        '                              </tr>';
            }
            html+=  '                           </table>'+
                    '                       </div>'+
                    '                  </div>'+
                    '            </div>';
            teacherCourses.innerHTML = html;
        }

        function inputScore(studentId,courseId,courseTerm,courseTeacher) {
            var dailyScore = document.getElementById("dailyScore"+studentId);
            var examScore = document.getElementById("examScore"+studentId);
            var button = document.getElementById("button"+studentId);
            dailyScore.innerHTML = '<input type="number" id="inputDailyScore'+studentId+'" />';
            examScore.innerHTML = '<input type="number" id="inputExamScore'+studentId+'" />';
            button.innerHTML = '<button class="btn btn-default" onclick="updateScore(\''+studentId+'\',\''+courseId+'\',\''+courseTerm+'\',\''+courseTeacher+'\')">确认修改</button>';
        }

        function updateScore(studentId,courseId,courseTerm,courseTeacher) {
            var courseScore = {};
            courseScore.studentId = studentId;
            courseScore.courseId = courseId;
            courseScore.courseTerm = courseTerm;
            courseScore.courseTeacher = courseTeacher;
            courseScore.dailyScore = document.getElementById("inputDailyScore"+studentId).value;
            courseScore.examScore = document.getElementById("inputExamScore"+studentId).value;
            var results = "";
            $.ajax({
                async : false,
                type : 'POST',
                url : '${cp}/inputScore',
                data : courseScore,
                dataType : 'json',
                success : function(result) {
                    results = result.result;
                },
                error : function(result) {
                    layer.alert('查询错误');
                }
            });
            if(results == "success"){
                layer.msg("添加成绩成功",{icon:1});
                showTeacherCourseStudent(courseTeacher,courseId);
            }
        }

        function initSuperFunctionList(){
            var functionList = document.getElementById("functionListArea");
            var html = "";
            html+= '<div class="row pd-t-40">'+
                    '                          <div class="col-sm-1 col-md-1 col-lg-1"></div>'+
                    '                          <div class="main-button3 col-sm-4 col-md-4 col-lg-4" onclick="studentManage()">'+
                    '                              <div class="main-button3-inner-text">'+
                    '                                    学生管理'+
                    '                              </div>'+
                    '                          </div>'+
                    '                          <div class="col-sm-2 col-md-2 col-lg-2"></div>'+
                    '                          <div class="main-button3 col-sm-4 col-md-4 col-lg-4" onclick="courseManage()">'+
                    '                              <div class="main-button3-inner-text">'+
                    '                                    课程管理'+
                    '                              </div>'+
                    '                          </div>'+
                    '                          <div class="col-sm-1 col-md-1 col-lg-1"></div>'+
                    '                    </div>'+
                    '                    <div class="row pd-t-40">'+
                    '                          <div class="col-sm-1 col-md-1 col-lg-1"></div>'+
                    '                          <div class="main-button3 col-sm-4 col-md-4 col-lg-4" onclick="teacherManage()">'+
                    '                              <div class="main-button3-inner-text">'+
                    '                                    教师管理'+
                    '                              </div>'+
                    '                          </div>'+
                    '                          <div class="col-sm-2 col-md-2 col-lg-2"></div>'+
                    '                          <div class="main-button3 col-sm-4 col-md-4 col-lg-4" onclick="courseOpenManage()">'+
                    '                              <div class="main-button3-inner-text">'+
                    '                                    开课管理'+
                    '                              </div>'+
                    '                          </div>'+
                    '                          <div class="col-sm-1 col-md-1 col-lg-1"></div>'+
                    '                    </div>'+
                    '                    <div class="row pd-t-40">'+
                    '                          <div class="col-sm-1 col-md-1 col-lg-1"></div>'+
                    '                          <div class="main-button3 col-sm-4 col-md-4 col-lg-4" onclick="gradeManage()">'+
                    '                              <div class="main-button3-inner-text">'+
                    '                                    成绩管理'+
                    '                              </div>'+
                    '                          </div>'+
                    '                          <div class="col-sm-2 col-md-2 col-lg-2"></div>'+
                    '                          <div class="main-button3 col-sm-4 col-md-4 col-lg-4"  onclick="collegeManage()">'+
                    '                              <div class="main-button3-inner-text">'+
                    '                                    学院管理'+
                    '                              </div>'+
                    '                          </div>'+
                    '                          <div class="col-sm-1 col-md-1 col-lg-1"></div>'+
                    '                    </div>';
            functionList.innerHTML = html;
        }



        //学生管理
        function studentManage() {
            window.location.href = "#page2";
            var studentManage = document.getElementById("studentManage");
            var html;
            var students = getAllStudents();
            html = '<div class="container">'+
                    '                  <div class="row studentsTable">'+
                    '                        <table class="table col-sm-12 col-md-12 col-lg-12">'+
                    '                              <tr>'+
                    '                                    <th>学号</th>'+
                    '                                    <th>密码</th>'+
                    '                                    <th>学生姓名</th>'+
                    '                                    <th>性别</th>'+
                    '                                    <th>年龄</th>'+
                    '                                    <th>学院</th>'+
                    '                                    <th>籍贯</th>'+
                    '                                    <th>年级</th>'+
                    '                                    <th>入学年份</th>'+
                    '                                    <th>邮箱</th>'+
                    '                                    <th>是否修改</th>'+
                    '                              </tr>';
            for(var i=0;i<students.length;i++){
                var studentId = students[i].studentId;
                var studentPassword = students[i].studentPassword;
                var studentName = students[i].studentName;
                var studentSex = "男";
                if(students[i].studentSex == 1)
                    studentSex = "女";
                var studentAge = students[i].studentAge;
                var studentCollege = getCollege(students[i].studentCollege);
                var studentCollegeName = studentCollege.collegeName;
                var studentNativePlace = provinceList[students[i].studentNativePlace];
                var studentGrade = "大一";
                if(students[i].studentGrade == 2)
                    studentGrade = "大二";
                else if(students[i].studentGrade == 3)
                    studentGrade = "大三";
                else if(students[i].studentGrade == 4)
                    studentGrade = "大四";
                var studentEnrollmentYear = students[i].studentEnrollmentYear;
                var studentEmail = students[i].studentEmail;
                html+=  '                              <tr>'+
                        '                                    <td>'+studentId+'</td>'+
                        '                                    <td>'+studentPassword+'</td>'+
                        '                                    <td>'+studentName+'</td>'+
                        '                                    <td>'+studentSex+'</td>'+
                        '                                    <td>'+studentAge+'</td>'+
                        '                                    <td>'+studentCollegeName+'</td>'+
                        '                                    <td>'+studentNativePlace+'</td>'+
                        '                                    <td>'+studentGrade+'</td>'+
                        '                                    <td>'+studentEnrollmentYear+'</td>'+
                        '                                    <td>'+studentEmail+'</td>'+
                        '                                    <td><button class="btn btn-default" onclick="modifyStudent('+studentId+')">修改</button> </td>'+
                        '                              </tr>';
            }
            html+=  '                           </table>'+
                    '                       </div>'+
                    '                       <div class="row">'+
                    '                           <div class="col-sm-3 col-md-3 col-lg-3"></div>'+
                    '                           <div class="col-sm-6 col-md-6 col-lg-6">'+
                    '                               <button class="btn btn-default col-sm-5 col-md-5 col-lg-5" onclick="addStudent()">'+
                    '                                   添加学生'+
                    '                               </button>'+
                    '                               <div class="col-sm-2 col-md-2 col-lg-2"></div>'+
                    '                               <button class="btn btn-default col-sm-5 col-md-5 col-lg-5" onclick="addStudentsByExcelPre()">'+
                    '                                   Excel批量导入学生'+
                    '                               </button>'+
                    '                            </div>'+
                    '                       </div>'+
                    '                  </div>'+
                    '            </div>';
            studentManage.innerHTML = html;
        }

        function getStudentById(studentId) {
            var studentInfo = "";
            var student = {};
            student.studentId = studentId;
            $.ajax({
                async : false, //设置同步
                type : 'POST',
                url : '${cp}/getStudentById',
                data : student,
                dataType : 'json',
                success : function(result) {
                    if (result!=null) {
                        studentInfo = result.result;
                    }
                    else{
                        layer.alert('查询错误');
                    }
                },
                error : function(result) {
                    layer.alert('查询错误');
                }
            });
            studentInfo = JSON.parse(studentInfo);
            return studentInfo;
        }

        function getAllStudents(){
            var allStudents = "";
            var currentTeacher = {};
            currentTeacher.teacherId = ${currentTeacher.teacherId};
            $.ajax({
                async : false, //设置同步
                type : 'POST',
                url : '${cp}/getAllStudents',
                data : currentTeacher,
                dataType : 'json',
                success : function(result) {
                    if (result!=null) {
                        allStudents = result.result;
                    }
                    else{
                        layer.alert('查询错误');
                    }
                },
                error : function(result) {
                    layer.alert('查询错误');
                }
            });
            allStudents = eval("("+allStudents+")");
            return allStudents;
        }

        var inputStudentInfoWindow;
        function addStudent() {
            var html = '<div class="container windowBox">' +
                    '          <div class="row">' +
                    '            <div class="col-sm-offset-2 col-md-offset-2">' +
                    '                <div  class="form-horizontal">' +
                    '                    <div class="form-group">' +
                    '                        <label for="inputStudentId" class="col-sm-3 col-md-3 control-label">学号</label>' +
                    '                        <div class="col-sm-6 col-md-6">' +
                    '                            <input type="text" class="form-control" id="inputStudentId" placeholder="14121047">' +
                    '                        </div>' +
                    '                    </div>' +
                    '                    <div class="form-group">' +
                    '                        <label for="inputPassword" class="col-sm-3 col-md-3 control-label">密码</label>' +
                    '                        <div class="col-sm-6 col-md-6">' +
                    '                            <input type="password" class="form-control" id="inputPassword" placeholder="14121047">' +
                    '                        </div>' +
                    '                    </div>' +
                    '                    <div class="form-group">' +
                    '                        <label for="inputStudentName" class="col-sm-3 col-md-3 control-label">学生姓名</label>' +
                    '                        <div class="col-sm-6 col-md-6">' +
                    '                            <input type="text" class="form-control" id="inputStudentName" placeholder="高帅富" />' +
                    '                        </div>' +
                    '                    </div>' +
                    '                    <div class="form-group">' +
                    '                        <label for="man" class="col-sm-3 col-md-3 control-label">性别</label>' +
                    '                        <div class="col-sm-6 col-md-6">' +
                    '                            <label class="radio-inline">' +
                    '                                <input type="radio" id="man" value="option1" name="studentSex"> 男' +
                    '                            </label>' +
                    '                            <label class="radio-inline">' +
                    '                                <input type="radio" id="woman" value="option2" name="studentSex"> 女' +
                    '                            </label>' +
                    '                        </div>' +
                    '                    </div>' +
                    '                    <div class="form-group">' +
                    '                        <label for="inputAge" class="col-sm-3 col-md-3 control-label">年龄</label>' +
                    '                        <div class="col-sm-6 col-md-6">' +
                    '                            <input type="number" class="form-control" id="inputAge" placeholder="20" min="1" max="100" />' +
                    '                        </div>' +
                    '                    </div>' +
                    '                    <div class="form-group">' +
                    '		                <label for="inputStudentCollege" class="col-sm-3 col-md-3 control-label">学院</label>' +
                    '                        <div class="col-sm-6 col-md-6">' +
                    '		                    <select class="form-control" id="inputStudentCollege">';
            var colleges = getAllCollege();
            for (var i = 0; i < colleges.length; i++) {
                html += '			                    <option value="'+colleges[i].collegeId+'">' + colleges[i].collegeName + '</option>';
            }

            html += '		                    </select>' +
                    '                        </div>' +
                    '                   </div>' +
                    '                    <div class="form-group">' +
                    '		                <label for="inputStudentPlace" class="col-sm-3 col-md-3 control-label">籍贯</label>' +
                    '                        <div class="col-sm-6 col-md-6">' +
                    '		                    <select class="form-control" id="inputStudentPlace">';
            var provinceList = new Array(
                    "安徽省", "澳门特别行政区", "北京市", "重庆市", "福建省", "甘肃省", " 广东省",
                    "广西壮族自治区", "贵州省", "海南省", "河北省", "河南省", "黑龙江省", "湖北省",
                    "湖南省", "吉林省", "江苏省", "江西省", "辽宁省", "内蒙古自治区", "宁夏回族自治区",
                    "青海省", "山东省", "山西省", "陕西省", "上海市", "四川省", "台湾省", "天津市",
                    "西藏自治区", "香港特别行政区", "新疆维吾尔族自治区", "云南省", "浙江省"
            );
            for (var i = 0; i < provinceList.length; i++) {
                html += '			                    <option value="' + i + '">' + provinceList[i] + '</option>';
            }

            html += '		                    </select>' +
                    '                        </div>' +
                    '                   </div>' +
                    '                    <div class="form-group">' +
                    '                        <label for="inputEntryYear" class="col-sm-3 col-md-3 control-label">入学年份</label>' +
                    '                        <div class="col-sm-6 col-md-6">' +
                    '                            <input type="number" class="form-control" id="inputEntryYear" placeholder="2014" min="1999" max="3000" />' +
                    '                        </div>' +
                    '                    </div>' +
                    '                    <div class="form-group">' +
                    '                        <label for="inputStudentEmail" class="col-sm-3 col-md-3 control-label">邮箱</label>' +
                    '                        <div class="col-sm-6 col-md-6">' +
                    '                            <input type="email" class="form-control" id="inputStudentEmail" placeholder="abc@abc.com" />' +
                    '                        </div>' +
                    '                    </div>' +
                    '                    <div class="form-group">' +
                    '                        <div class="col-sm-offset-2 col-sm-6">' +
                    '                            <button class="btn btn-lg btn-default btn-block" type="submit" onclick="addStudentSubmit()">确认添加</button>' +
                    '                        </div>' +
                    '                    </div>' +
                    '                </div>' +
                    '            </div>' +
                    '        </div>' +
                    '        </div>';
            inputStudentInfoWindow = layer.open({
                type: 1,
                title: '添加学生',
                content: html,
                area: ['500px', '600px'],
                resize: false
            });
        }

        function addStudentSubmit() {
            var student = {};
            student.studentId = document.getElementById("inputStudentId").value;
            student.studentPassword = document.getElementById("inputPassword").value;
            student.studentName = document.getElementById("inputStudentName").value;
            student.studentAge = document.getElementById("inputAge").value;
            student.studentEntryYear = document.getElementById("inputEntryYear").value;
            student.studentEmail = document.getElementById("inputStudentEmail").value;
            student.studentSex = -1;
            if(document.getElementById("woman").checked)
                student.studentSex = 1;
            else if(document.getElementById("man").checked)
                student.studentSex = 0;

            var studentCollege = document.getElementById("inputStudentCollege");
            var collegeIndex = studentCollege.selectedIndex;
            student.studentCollege = studentCollege.options[collegeIndex].value;

            var studentNativePlace = document.getElementById("inputStudentPlace");
            var placeIndex = studentNativePlace.selectedIndex;
            student.studentNativePlace = studentNativePlace.options[placeIndex].value;
            //此处做数值校验

            var addResult=""             ;
            $.ajax({
                async : false, //设置同步
                type : 'POST',
                url : '${cp}/addStudent',
                data : student,
                dataType : 'json',
                success : function(result) {
                    addResult = result.result;
                },
                error : function() {
                    layer.alert('查询用户错误');
                }
            });
            if(addResult == "success")
            {
                layer.close(inputStudentInfoWindow);
                studentManage();
                layer.msg('添加学生 '+student.studentName+' 成功',{icon:1});
            }
        }

        var modifyStudentInfo;

        function modifyStudent(studentId) {
            var html = '<div class="container windowBox">' +
                    '          <div class="row">' +
                    '            <div class="col-sm-offset-2 col-md-offset-2">' +
                    '                <div  class="form-horizontal">' +
                    '                    <div class="form-group">' +
                    '                        <label for="mInputStudentId" class="col-sm-3 col-md-3 control-label" >学号</label>' +
                    '                        <div class="col-sm-6 col-md-6">' +
                    '                            <input type="text" class="form-control" id="mInputStudentId" placeholder="14121047" readonly>' +
                    '                        </div>' +
                    '                    </div>' +
                    '                    <div class="form-group">' +
                    '                        <label for="mInputPassword" class="col-sm-3 col-md-3 control-label">密码</label>' +
                    '                        <div class="col-sm-6 col-md-6">' +
                    '                            <input type="text" class="form-control" id="mInputPassword" placeholder="14121047">' +
                    '                        </div>' +
                    '                    </div>' +
                    '                    <div class="form-group">' +
                    '                        <label for="mInputStudentName" class="col-sm-3 col-md-3 control-label">学生姓名</label>' +
                    '                        <div class="col-sm-6 col-md-6">' +
                    '                            <input type="text" class="form-control" id="mInputStudentName" placeholder="高帅富" />' +
                    '                        </div>' +
                    '                    </div>' +
                    '                    <div class="form-group">' +
                    '                        <label for="mMan" class="col-sm-3 col-md-3 control-label">性别</label>' +
                    '                        <div class="col-sm-6 col-md-6">' +
                    '                            <label class="radio-inline">' +
                    '                                <input type="radio" id="mMan" value="man" name="studentSex"> 男' +
                    '                            </label>' +
                    '                            <label class="radio-inline">' +
                    '                                <input type="radio" id="mWoman" value="women" name="studentSex"> 女' +
                    '                            </label>' +
                    '                        </div>' +
                    '                    </div>' +
                    '                    <div class="form-group">' +
                    '                        <label for="mInputAge" class="col-sm-3 col-md-3 control-label">年龄</label>' +
                    '                        <div class="col-sm-6 col-md-6">' +
                    '                            <input type="number" class="form-control" id="mInputAge" placeholder="20" min="1" max="100" />' +
                    '                        </div>' +
                    '                    </div>' +
                    '                    <div class="form-group">' +
                    '		                <label for="mInputStudentCollege" class="col-sm-3 col-md-3 control-label">学院</label>' +
                    '                        <div class="col-sm-6 col-md-6">' +
                    '		                    <select class="form-control" id="mInputStudentCollege">';
            var colleges = getAllCollege();
            for (var i = 0; i < colleges.length; i++) {
                html += '			                    <option value="'+colleges[i].collegeId+'">' + colleges[i].collegeName + '</option>';
            }

            html += '		                    </select>' +
                    '                        </div>' +
                    '                   </div>' +
                    '                    <div class="form-group">' +
                    '		                <label for="mInputStudentPlace" class="col-sm-3 col-md-3 control-label">籍贯</label>' +
                    '                        <div class="col-sm-6 col-md-6">' +
                    '		                    <select class="form-control" id="mInputStudentPlace">';
            for (var i = 0; i < provinceList.length; i++) {
                html += '			                    <option value="' + i + '">' + provinceList[i] + '</option>';
            }

            html += '		                    </select>' +
                    '                        </div>' +
                    '                   </div>' +
                    '                    <div class="form-group">' +
                    '                        <label for="mInputEntryYear" class="col-sm-3 col-md-3 control-label">入学年份</label>' +
                    '                        <div class="col-sm-6 col-md-6">' +
                    '                            <input type="number" class="form-control" id="mInputEntryYear" placeholder="2014" min="1999" max="3000" />' +
                    '                        </div>' +
                    '                    </div>' +
                    '                    <div class="form-group">' +
                    '                        <label for="mInputStudentEmail" class="col-sm-3 col-md-3 control-label">邮箱</label>' +
                    '                        <div class="col-sm-6 col-md-6">' +
                    '                            <input type="email" class="form-control" id="mInputStudentEmail" placeholder="abc@abc.com" />' +
                    '                        </div>' +
                    '                    </div>' +
                    '                    <div class="form-group">' +
                    '                        <div class="col-sm-offset-2 col-sm-6 col-md-6">' +
                    '                               <button class="btn btn-default btn-block" onclick="updateStudent()">确认修改</button>' +
                    '                               <button class="btn btn-default btn-block mBtnOffset" onclick="closeModifyWindow()">取消修改</button>' +
                    '                               <button class="btn btn-default btn-block mBtnOffset" onclick="deleteStudent('+studentId+')">删除学生</button>' +
                    '                        </div>' +
                    '                    </div>' +
                    '                </div>' +
                    '            </div>' +
                    '        </div>' +
                    '        </div>';
            modifyStudentInfo = layer.open({
                type: 1,
                title: '修改学生信息',
                content: html,
                area: ['500px', '650px'],
                resize: false
            });
            initStudentModifyInfo(studentId);

        }

        function initStudentModifyInfo(studentId) {
            var student = getStudentById(studentId);
            //layer.alert(student.studentId+','+student.studentPassword+','+student.studentName+','+student.studentAge+','+student.studentCollege+','+student.studentEnrollmentYear);
            document.getElementById("mInputStudentId").value = student.studentId;
            document.getElementById("mInputPassword").value = student.studentPassword;
            document.getElementById("mInputStudentName").value = student.studentName;
            if(student.studentSex == 0)
                document.getElementById("mMan").checked = true;
            else if(student.studentSex == 1)
                document.getElementById("mWoman").checked = true;
            document.getElementById("mInputAge").value = student.studentAge;
            var studentColleges = document.getElementById("mInputStudentCollege");
            for(var i=0;i<studentColleges.options.length;i++){
                if(studentColleges.options[i].value == student.studentCollege){
                    studentColleges.options[i].selected = true;
                    break;
                }
            }
            document.getElementById("mInputStudentPlace").options[student.studentNativePlace].selected = true;
            document.getElementById("mInputEntryYear").value = student.studentEnrollmentYear;
            document.getElementById("mInputStudentEmail").value = student.studentEmail;
        }

        function updateStudent() {
            var student = {};
            student.studentId = document.getElementById("mInputStudentId").value;
            student.studentPassword = document.getElementById("mInputPassword").value;
            student.studentName = document.getElementById("mInputStudentName").value;
            student.studentAge = document.getElementById("mInputAge").value;
            student.studentEntryYear = document.getElementById("mInputEntryYear").value;
            student.studentEmail = document.getElementById("mInputStudentEmail").value;
            student.studentSex = -1;
            if(document.getElementById("mWoman").checked)
                student.studentSex = 1;
            else if(document.getElementById("mMan").checked)
                student.studentSex = 0;

            var studentCollege = document.getElementById("mInputStudentCollege");
            var collegeIndex = studentCollege.selectedIndex;
            student.studentCollege = studentCollege.options[collegeIndex].value;

            var studentNativePlace = document.getElementById("mInputStudentPlace");
            var placeIndex = studentNativePlace.selectedIndex;
            student.studentNativePlace = studentNativePlace.options[placeIndex].value;

            var updateResult=""             ;
            $.ajax({
                async : false, //设置同步
                type : 'POST',
                url : '${cp}/updateStudent',
                data : student,
                dataType : 'json',
                success : function(result) {
                    updateResult = result.result;
                },
                error : function() {
                    layer.alert('查询用户错误');
                }
            });
            if(updateResult == "success")
            {
                layer.close(modifyStudentInfo);
                studentManage();
                layer.msg('更新学生 '+student.studentName+' 成功',{icon:1});
            }
        }

        function closeModifyWindow() {
            layer.close(modifyStudentInfo);
        }

        function deleteStudent(studentId) {
            var user = {};
            user.studentId = studentId;
            var deleteResult = "";
            $.ajax({
                async : false, //设置同步
                type : 'POST',
                url : '${cp}/deleteStudent',
                data : user,
                dataType : 'json',
                success : function(result) {
                    deleteResult = result.result;
                },
                error : function() {
                    layer.alert('删除学生错误');
                }
            });
            if(deleteResult == "success") {
                layer.close(modifyStudentInfo);
                studentManage();
                layer.msg('删除学生' + studentId + '成功', {icon: 1});
            }
        }

        var addStudentByExcelWindow;

        function addStudentsByExcel() {
            var results = "";
            $.ajaxFileUpload({
                url:'${cp}/addStudentsExcel',
                secureuri:false ,
                fileElementId:'studentsExcelUpload',
                type:'POST',
                dataType : 'text',
                success: function (result){
                    result = result.replace(/<pre.*?>/g, '');  //ajaxFileUpload会对服务器响应回来的text内容加上<pre style="....">text</pre>前后缀
                    result = result.replace(/<PRE.*?>/g, '');
                    result = result.replace("<PRE>", '');
                    result = result.replace("</PRE>", '');
                    result = result.replace("<pre>", '');
                    result = result.replace("</pre>", '');
                    result = JSON.parse(result);
                    results = result.result;
                    if(results == "success") {
                        layer.close(addStudentByExcelWindow);
                        layer.msg("学生添加成功", {icon: 1});
                        studentManage();
                    }
                    else {
                        layer.msg(results, {icon: 0});
                    }

                },
                error: function ()
                {
                    layer.alert("上传错误");
                }}
            );
        }

        function addStudentsByExcelPre() {
            var html = '<div class="container windowBox">'+
                    '          <div class="row">'+
                    '                   <div class="form-group">'+
                    '                                <label for="studentsExcelUpload" class="col-sm-3 col-md-3 cosntrol-label">上传文件</label>'+
                    '                                <div class="col-sm-6 col-md-6">'+
                    '                                    <input name="studentsExcelUpload" type="file"  id="studentsExcelUpload" accept="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet,application/vnd.ms-excel,.csv"/>'+
                    '                                    <p class="help-block">上传的文件内容格式必须与示例一致</p>'+
                    '                                </div>'+
                    '                   </div>'+
                    '          </div>'+
                    '          <div class="row pd-t-20">'+
                    '                 <div class="col-sm-2 col-md-2 col-lg-2"></div>'+
                    '                 <button class="btn btn-default col-sm-3 col-md-3 col-lg-3" onclick="addStudentsByExcel()">上传文件</button>'+
                    '                 <div class="col-sm-2 col-md-2 col-lg-2"></div>'+
                    '                 <button class="btn btn-default col-sm-3 col-md-3 col-lg-3">示例下载</button>'+
                    '          </div>'+
                    '  </div>';
            addStudentByExcelWindow = layer.open({
                type: 1,
                title: '上传Excel文件',
                content: html,
                area: ['400px', '250px'],
                resize: false
            });
        }





        //学院管理
        
        function collegeManage() {
            window.location.href = "#page7";
            var studentManage = document.getElementById("collegeManage");
            var html;
            var colleges = getAllCollege();
            html = '<div class="container">'+
                    '                  <div class="row studentsTable">'+
                    '                        <table class="table col-sm-12 col-md-12 col-lg-12">'+
                    '                              <tr>'+
                    '                                    <th>学院编号</th>'+
                    '                                    <th>学院名称</th>'+
                    '                                    <th>院长</th>'+
                    '                                    <th>校区</th>'+
                    '                                    <th>是否修改</th>'+
                    '                              </tr>';
            for(var i=0;i<colleges.length;i++){
                var collegeId = colleges[i].collegeId;
                var collegetName = colleges[i].collegeName;
                var collegeLeader = colleges[i].collegeLeader;
                var collegeCampus = colleges[i].collegeCampus;
                html+=  '                              <tr>'+
                        '                                    <td>'+collegeId+'</td>'+
                        '                                    <td>'+collegetName+'</td>'+
                        '                                    <td>'+collegeLeader+'</td>'+
                        '                                    <td>'+collegeCampus+'</td>'+
                        '                                    <td><button class="btn btn-default" onclick="modifyCollege('+collegeId+')">修改</button> </td>'+
                        '                              </tr>';
            }
            html+=  '                           </table>'+
                    '                       </div>'+
                    '                       <div class="row">'+
                    '                           <div class="col-sm-3 col-md-3 col-lg-3"></div>'+
                    '                           <div class="col-sm-6 col-md-6 col-lg-6">'+
                    '                               <button class="btn btn-default col-sm-5 col-md-5 col-lg-5" onclick="addCollege()">'+
                    '                                   添加学院'+
                    '                               </button>'+
                    '                               <div class="col-sm-2 col-md-2 col-lg-2"></div>'+
                    '                               <button class="btn btn-default col-sm-5 col-md-5 col-lg-5" onclick="addCollegesByExcelPre()">'+
                    '                                   Excel批量导入学院'+
                    '                               </button>'+
                    '                            </div>'+
                    '                       </div>'+
                    '                  </div>'+
                    '            </div>';
            studentManage.innerHTML = html;
        }
        
        var modifyCollegeInfo;
        
        function modifyCollege(collegeId) {
            var html = '<div class="container windowBox">' +
                    '          <div class="row">' +
                    '            <div class="col-sm-offset-2 col-md-offset-2">' +
                    '                <div  class="form-horizontal">' +
                    '                    <div class="form-group">' +
                    '                        <label for="mCollegeId" class="col-sm-3 col-md-3 control-label" >学院编号</label>' +
                    '                        <div class="col-sm-6 col-md-6">' +
                    '                            <input type="text" class="form-control" id="mCollegeId" placeholder="0" readonly>' +
                    '                        </div>' +
                    '                    </div>' +
                    '                    <div class="form-group">' +
                    '                        <label for="mCollegeName" class="col-sm-3 col-md-3 control-label">学院名称</label>' +
                    '                        <div class="col-sm-6 col-md-6">' +
                    '                            <input type="text" class="form-control" id="mCollegeName" placeholder="计算机工程与科学学院">' +
                    '                        </div>' +
                    '                    </div>' +
                    '                    <div class="form-group">' +
                    '                        <label for="mCollegeLeader" class="col-sm-3 col-md-3 control-label">院长</label>' +
                    '                        <div class="col-sm-6 col-md-6">' +
                    '                            <input type="text" class="form-control" id="mCollegeLeader" placeholder="金东寒" />' +
                    '                        </div>' +
                    '                    </div>' +
                    '                    <div class="form-group">' +
                    '                        <label for="mCollegeCampus" class="col-sm-3 col-md-3 control-label">校区</label>' +
                    '                        <div class="col-sm-6 col-md-6">' +
                    '                            <input type="email" class="form-control" id="mCollegeCampus" placeholder="宝山校区" />' +
                    '                        </div>' +
                    '                    </div>' +
                    '                    <div class="form-group">' +
                    '                        <div class="col-sm-offset-2 col-sm-6 col-md-6">' +
                    '                               <button class="btn btn-default btn-block" onclick="updateCollege()">确认修改</button>' +
                    '                               <button class="btn btn-default btn-block mBtnOffset" onclick="closeCollegeModifyWindow()">取消修改</button>' +
                    '                               <button class="btn btn-default btn-block mBtnOffset" onclick="deleteCollege('+collegeId+')">删除学院</button>' +
                    '                        </div>' +
                    '                    </div>' +
                    '                </div>' +
                    '            </div>' +
                    '        </div>' +
                    '        </div>';
            modifyCollegeInfo = layer.open({
                type: 1,
                title: '修改学院信息',
                content: html,
                area: ['500px', '450px'],
                resize: false
            });
            initCollegeModifyInfo(collegeId);
        }
        
        function initCollegeModifyInfo(collegeId) {
            var college = getCollege(collegeId);
            document.getElementById("mCollegeId").value = college.collegeId;
            document.getElementById("mCollegeName").value = college.collegeName;
            document.getElementById("mCollegeLeader").value = college.collegeLeader;
            document.getElementById("mCollegeCampus").value = college.collegeCampus;
        }

        function updateCollege() {
            var college = {};
            college.collegeId = document.getElementById("mCollegeId").value;
            college.collegeName = document.getElementById("mCollegeName").value;
            college.collegeLeader = document.getElementById("mCollegeLeader").value;
            college.collegeCampus = document.getElementById("mCollegeCampus").value
            var updateResult = "";
            $.ajax({
                async : false, //设置同步
                type : 'POST',
                url : '${cp}/updateCollege',
                data : college,
                dataType : 'json',
                success : function(result) {
                    updateResult = result.result;
                },
                error : function() {
                    layer.alert('查询用户错误');
                }
            });
            if(updateResult == "success")
            {
                layer.close(modifyCollegeInfo);
                collegeManage();
                layer.msg('更新学院 '+college.collegeName+' 成功',{icon:1});
            }
        }

        function closeCollegeModifyWindow(){
            layer.close(modifyCollegeInfo);
        }

        function deleteCollege(collegeId) {
            var college = {};
            college.collegeId = collegeId;
            var deleteResult = "";
            $.ajax({
                async : false, //设置同步
                type : 'POST',
                url : '${cp}/deleteCollege',
                data : college,
                dataType : 'json',
                success : function(result) {
                    deleteResult = result.result;
                },
                error : function() {
                    layer.alert('删除学院错误');
                }
            });
            if(deleteResult == "success") {
                layer.close(modifyCollegeInfo);
                collegeManage();
                layer.msg('删除学院' + collegeId + '成功', {icon: 1});
            }

        }

        var inputCollegeInfoWindow;

        function addCollege(){
            var html = '<div class="container windowBox">' +
                    '          <div class="row">' +
                    '            <div class="col-sm-offset-2 col-md-offset-2">' +
                    '                <div  class="form-horizontal">' +
                    '                    <div class="form-group">' +
                    '                        <label for="inputCollegeId" class="col-sm-3 col-md-3 control-label">学院编号</label>' +
                    '                        <div class="col-sm-6 col-md-6">' +
                    '                            <input type="text" class="form-control" id="inputCollegeId" placeholder="0">' +
                    '                        </div>' +
                    '                    </div>' +
                    '                    <div class="form-group">' +
                    '                        <label for="inputCollegeName" class="col-sm-3 col-md-3 control-label">学院名称</label>' +
                    '                        <div class="col-sm-6 col-md-6">' +
                    '                            <input type="text" class="form-control" id="inputCollegeName" placeholder=计算机工程与科学学院" />' +
                    '                        </div>' +
                    '                    </div>' +
                    '                    <div class="form-group">' +
                    '                        <label for="inputCollegeLeader" class="col-sm-3 col-md-3 control-label">院长</label>' +
                    '                        <div class="col-sm-6 col-md-6">' +
                    '                            <input type="text" class="form-control" id="inputCollegeLeader" placeholder="郭毅可"/>' +
                    '                        </div>' +
                    '                    </div>' +
                    '                    <div class="form-group">' +
                    '                        <label for="inputCollegeCampus" class="col-sm-3 col-md-3 control-label">校区</label>' +
                    '                        <div class="col-sm-6 col-md-6">' +
                    '                            <input type="email" class="form-control" id="inputCollegeCampus" placeholder="宝山校区" />' +
                    '                        </div>' +
                    '                    </div>' +
                    '                    <div class="form-group">' +
                    '                        <div class="col-sm-offset-2 col-sm-6">' +
                    '                            <button class="btn btn-lg btn-default btn-block" type="submit" onclick="addCollegeSubmit()">确认添加</button>' +
                    '                        </div>' +
                    '                    </div>' +
                    '                </div>' +
                    '            </div>' +
                    '        </div>' +
                    '        </div>';
            inputCollegeInfoWindow = layer.open({
                type: 1,
                title: '添加学院',
                content: html,
                area: ['500px', '430px'],
                resize: false
            });
        }

        function addCollegeSubmit() {
            var college = {};
            college.collegeId = document.getElementById("inputCollegeId").value;
            college.collegeName = document.getElementById("inputCollegeName").value;
            college.collegeLeader = document.getElementById("inputCollegeLeader").value;
            college.collegeCampus = document.getElementById("inputCollegeCampus").value
            var updateResult = "";
            $.ajax({
                async : false, //设置同步
                type : 'POST',
                url : '${cp}/addCollege',
                data : college,
                dataType : 'json',
                success : function(result) {
                    updateResult = result.result;
                },
                error : function() {
                    layer.alert('查询用户错误');
                }
            });
            if(updateResult == "success")
            {
                layer.close(inputCollegeInfoWindow);
                collegeManage();
                layer.msg('添加学院 '+college.collegeName+' 成功',{icon:1});
            }
        }

        var addCollegeByExcelWindow;

        function addCollegesByExcelPre() {
            var html = '<div class="container windowBox">'+
                    '          <div class="row">'+
                    '                   <div class="form-group">'+
                    '                                <label for="collegesExcelUpload" class="col-sm-3 col-md-3 cosntrol-label">上传文件</label>'+
                    '                                <div class="col-sm-6 col-md-6">'+
                    '                                    <input name="collegesExcelUpload" type="file"  id="collegesExcelUpload" accept="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet,application/vnd.ms-excel,.csv"/>'+
                    '                                    <p class="help-block">上传的文件内容格式必须与示例一致</p>'+
                    '                                </div>'+
                    '                   </div>'+
                    '          </div>'+
                    '          <div class="row pd-t-20">'+
                    '                 <div class="col-sm-2 col-md-2 col-lg-2"></div>'+
                    '                 <button class="btn btn-default col-sm-3 col-md-3 col-lg-3" onclick="addCollegesByExcel()">上传文件</button>'+
                    '                 <div class="col-sm-2 col-md-2 col-lg-2"></div>'+
                    '                 <button class="btn btn-default col-sm-3 col-md-3 col-lg-3">示例下载</button>'+
                    '          </div>'+
                    '  </div>';
            addCollegeByExcelWindow = layer.open({
                type: 1,
                title: '上传Excel文件',
                content: html,
                area: ['400px', '250px'],
                resize: false
            });
        }

        function addCollegesByExcel() {
            var results = "";
            $.ajaxFileUpload({
                url:'${cp}/addCollegesExcel',
                secureuri:false ,
                fileElementId:'collegesExcelUpload',
                type:'POST',
                dataType : 'text',
                success: function (result){
                    result = result.replace(/<pre.*?>/g, '');  //ajaxFileUpload会对服务器响应回来的text内容加上<pre style="....">text</pre>前后缀
                    result = result.replace(/<PRE.*?>/g, '');
                    result = result.replace("<PRE>", '');
                    result = result.replace("</PRE>", '');
                    result = result.replace("<pre>", '');
                    result = result.replace("</pre>", '');
                    result = JSON.parse(result);
                    results = result.result;
                    if(results == "success") {
                        layer.close(addCollegeByExcelWindow);
                        layer.msg("学院添加成功", {icon: 1});
                        collegeManage();
                    }
                    else {
                        layer.msg(results, {icon: 0});
                    }

                },
                error: function ()
                {
                    layer.alert("上传错误");
                }}
            );
        }




        //教师管理
        function getAllTeachers() {
            var allTeachers = "";
            var currentTeacher = {};
            currentTeacher.teacherId = ${currentTeacher.teacherId};
            $.ajax({
                async : false, //设置同步
                type : 'POST',
                url : '${cp}/getAllTeachers',
                data : currentTeacher,
                dataType : 'json',
                success : function(result) {
                    if (result!=null) {
                        allTeachers = result.result;
                    }
                    else{
                        layer.alert('查询错误');
                    }
                },
                error : function(result) {
                    layer.alert('查询错误');
                }
            });
            allTeachers = eval("("+allTeachers+")");
            return allTeachers;
        }

        function teacherManage() {
            window.location.href = "#page3";
            var teacherManage = document.getElementById("teacherManage");
            var html;
            var teachers = getAllTeachers();
            html = '<div class="container">'+
                    '                  <div class="row studentsTable">'+
                    '                        <table class="table col-sm-12 col-md-12 col-lg-12">'+
                    '                              <tr>'+
                    '                                    <th>工号</th>'+
                    '                                    <th>密码</th>'+
                    '                                    <th>教师姓名</th>'+
                    '                                    <th>性别</th>'+
                    '                                    <th>年龄</th>'+
                    '                                    <th>职称</th>'+
                    '                                    <th>学院</th>'+
                    '                                    <th>权限级别</th>'+
                    '                                    <th>是否修改</th>'+
                    '                              </tr>';
            for(var i=0;i<teachers.length;i++){
                var teacherId = teachers[i].teacherId;
                var teacherPassword = teachers[i].teacherPassword;
                var teacherName = teachers[i].teacherName;
                var teacherSex = "男";
                if(teachers[i].teacherSex == 1)
                    teacherSex = "女";
                var teacherAge = teachers[i].teacherAge;
                var teacherCollege = getCollege(teachers[i].teacherCollege);
                var teacherCollegeName = teacherCollege.collegeName;
                var teacherTitle = "讲师";
                if(teachers[i].teacherTitle == 1)
                    teacherTitle = "副教授";
                else if(teachers[i].teacherTitle == 2)
                    teacherTitle = "教授";
                var teacherLevel = "普通教师";
                if(teachers[i].teacherRole != 0)
                    teacherLevel = "超级管理员";
                html+=  '                              <tr>'+
                        '                                    <td>'+teacherId+'</td>'+
                        '                                    <td>'+teacherPassword+'</td>'+
                        '                                    <td>'+teacherName+'</td>'+
                        '                                    <td>'+teacherSex+'</td>'+
                        '                                    <td>'+teacherAge+'</td>'+
                        '                                    <td>'+teacherTitle+'</td>'+
                        '                                    <td>'+teacherCollegeName+'</td>'+
                        '                                    <td>'+teacherLevel+'</td>'+
                        '                                    <td><button class="btn btn-default" onclick="modifyTeacher(\''+teacherId+'\')">修改</button> </td>'+
                        '                              </tr>';
            }
            html+=  '                           </table>'+
                    '                       </div>'+
                    '                       <div class="row">'+
                    '                           <div class="col-sm-3 col-md-3 col-lg-3"></div>'+
                    '                           <div class="col-sm-6 col-md-6 col-lg-6">'+
                    '                               <button class="btn btn-default col-sm-5 col-md-5 col-lg-5" onclick="addTeacher()">'+
                    '                                   添加教师'+
                    '                               </button>'+
                    '                               <div class="col-sm-2 col-md-2 col-lg-2"></div>'+
                    '                               <button class="btn btn-default col-sm-5 col-md-5 col-lg-5" onclick="addTeachersByExcelPre()">'+
                    '                                   Excel批量导入教师'+
                    '                               </button>'+
                    '                            </div>'+
                    '                       </div>'+
                    '                  </div>'+
                    '            </div>';
            teacherManage.innerHTML = html;
        }

        var inputTeacherInfoWindow;
        function addTeacher() {
            var html = '<div class="container windowBox">' +
                    '          <div class="row">' +
                    '            <div class="col-sm-offset-2 col-md-offset-2">' +
                    '                <div  class="form-horizontal">' +
                    '                    <div class="form-group">' +
                    '                        <label for="inputTeacherId" class="col-sm-3 col-md-3 control-label">工号</label>' +
                    '                        <div class="col-sm-6 col-md-6">' +
                    '                            <input type="text" class="form-control" id="inputTeacherId" placeholder="14121047">' +
                    '                        </div>' +
                    '                    </div>' +
                    '                    <div class="form-group">' +
                    '                        <label for="inputTeacherPassword" class="col-sm-3 col-md-3 control-label">密码</label>' +
                    '                        <div class="col-sm-6 col-md-6">' +
                    '                            <input type="password" class="form-control" id="inputTeacherPassword" placeholder="14121047">' +
                    '                        </div>' +
                    '                    </div>' +
                    '                    <div class="form-group">' +
                    '                        <label for="inputTeacherName" class="col-sm-3 col-md-3 control-label">教师姓名</label>' +
                    '                        <div class="col-sm-6 col-md-6">' +
                    '                            <input type="text" class="form-control" id="inputTeacherName" placeholder="高帅富" />' +
                    '                        </div>' +
                    '                    </div>' +
                    '                    <div class="form-group">' +
                    '                        <label for="teacherMan" class="col-sm-3 col-md-3 control-label">性别</label>' +
                    '                        <div class="col-sm-6 col-md-6">' +
                    '                            <label class="radio-inline">' +
                    '                                <input type="radio" id="teacherMan" value="option1" name="teacherSex"> 男' +
                    '                            </label>' +
                    '                            <label class="radio-inline">' +
                    '                                <input type="radio" id="teacherWoman" value="option2" name="teacherSex"> 女' +
                    '                            </label>' +
                    '                        </div>' +
                    '                    </div>' +
                    '                    <div class="form-group">' +
                    '                        <label for="inputTeacherAge" class="col-sm-3 col-md-3 control-label">年龄</label>' +
                    '                        <div class="col-sm-6 col-md-6">' +
                    '                            <input type="number" class="form-control" id="inputTeacherAge" placeholder="20" min="1" max="100" />' +
                    '                        </div>' +
                    '                    </div>' +
                    '                    <div class="form-group">' +
                    '                        <label for="inputTeacherTitle" class="col-sm-3 col-md-3 control-label">职称</label>' +
                    '                        <div class="col-sm-6 col-md-6">' +
                    '                            <input type="text" class="form-control" id="inputTeacherTitle" placeholder="讲师" />' +
                    '                        </div>' +
                    '                    </div>' +
                    '                    <div class="form-group">' +
                    '		                <label for="inputTeacherCollege" class="col-sm-3 col-md-3 control-label">学院</label>' +
                    '                        <div class="col-sm-6 col-md-6">' +
                    '		                    <select class="form-control" id="inputTeacherCollege">';
            var colleges = getAllCollege();
            for (var i = 0; i < colleges.length; i++) {
                html += '			                    <option value="'+colleges[i].collegeId+'">' + colleges[i].collegeName + '</option>';
            }

            html += '		                    </select>' +
                    '                        </div>' +
                    '                   </div>' +
                    '                    <div class="form-group">' +
                    '                        <div class="col-sm-offset-2 col-sm-6">' +
                    '                            <button class="btn btn-lg btn-default btn-block" type="submit" onclick="addTeacherSubmit()">确认添加</button>' +
                    '                        </div>' +
                    '                    </div>' +
                    '                </div>' +
                    '            </div>' +
                    '        </div>' +
                    '        </div>';
            inputTeacherInfoWindow = layer.open({
                type: 1,
                title: '添加教师',
                content: html,
                area: ['500px', '500px'],
                resize: false
            });
        }

        function addTeacherSubmit() {
            var teacher = {};
            teacher.teacherId = document.getElementById("inputTeacherId").value;
            //layer.alert(teacher.teacherId+","+teacher.teacherPassword+","+teacher.teacherName+","+teacher.teacherAge+","+teacherTitle+","+teacher.teacherSex+","+teacher.teacherCollege);
            teacher.teacherPassword = document.getElementById("inputTeacherPassword").value;
            teacher.teacherName = document.getElementById("inputTeacherName").value;
            teacher.teacherAge = document.getElementById("inputTeacherAge").value;
            var teacherTitle = document.getElementById("inputTeacherTitle").value;
            if(teacherTitle == "讲师")
                teacher.teacherTitle = 1;
            else if(teacherTitle == "副教授")
                teacher.teacherTitle = 2;
            else if(teacherTitle == "教授")
                teacher.teacherTitle = 3;
            teacher.teacherSex = -1;
            if(document.getElementById("teacherWoman").checked)
                teacher.teacherSex = 1;
            else if(document.getElementById("teacherMan").checked)
                teacher.teacherSex = 0;
            var teacherCollege = document.getElementById("inputTeacherCollege");
            var collegeIndex = teacherCollege.selectedIndex;
            teacher.teacherCollege = teacherCollege.options[collegeIndex].value;
            //此处做数值校验

            var addResult=""             ;
            $.ajax({
                async : false, //设置同步
                type : 'POST',
                url : '${cp}/addTeacher',
                data : teacher,
                dataType : 'json',
                success : function(result) {
                    addResult = result.result;
                },
                error : function() {
                    layer.alert('查询用户错误');
                }
            });
            if(addResult == "success")
            {
                layer.close(inputTeacherInfoWindow);
                teacherManage();
                layer.msg('添加教师 '+teacher.teacherName+' 成功',{icon:1});
            }
        }

        var modifyTeacherInfo;

        function modifyTeacher(teacherId) {
            var html = '<div class="container windowBox">' +
                    '          <div class="row">' +
                    '            <div class="col-sm-offset-2 col-md-offset-2">' +
                    '                <div  class="form-horizontal">' +
                    '                    <div class="form-group">' +
                    '                        <label for="mInputTeacherId" class="col-sm-3 col-md-3 control-label" >工号</label>' +
                    '                        <div class="col-sm-6 col-md-6">' +
                    '                            <input type="text" class="form-control" id="mInputTeacherId" placeholder="10101010" readonly>' +
                    '                        </div>' +
                    '                    </div>' +
                    '                    <div class="form-group">' +
                    '                        <label for="mInputTeacherPassword" class="col-sm-3 col-md-3 control-label">密码</label>' +
                    '                        <div class="col-sm-6 col-md-6">' +
                    '                            <input type="text" class="form-control" id="mInputTeacherPassword" placeholder="14121047">' +
                    '                        </div>' +
                    '                    </div>' +
                    '                    <div class="form-group">' +
                    '                        <label for="mInputTeacherName" class="col-sm-3 col-md-3 control-label">教师姓名</label>' +
                    '                        <div class="col-sm-6 col-md-6">' +
                    '                            <input type="text" class="form-control" id="mInputTeacherName" placeholder="高帅富" />' +
                    '                        </div>' +
                    '                    </div>' +
                    '                    <div class="form-group">' +
                    '                        <label for="mMan" class="col-sm-3 col-md-3 control-label">性别</label>' +
                    '                        <div class="col-sm-6 col-md-6">' +
                    '                            <label class="radio-inline">' +
                    '                                <input type="radio" id="mMan" value="man" name="teacherSex"> 男' +
                    '                            </label>' +
                    '                            <label class="radio-inline">' +
                    '                                <input type="radio" id="mWoman" value="women" name="teacherSex"> 女' +
                    '                            </label>' +
                    '                        </div>' +
                    '                    </div>' +
                    '                    <div class="form-group">' +
                    '                        <label for="mInputTeacherTitle" class="col-sm-3 col-md-3 control-label">教师职称</label>' +
                    '                        <div class="col-sm-6 col-md-6">' +
                    '                            <input type="text" class="form-control" id="mInputTeacherTitle" placeholder="讲师" />' +
                    '                        </div>' +
                    '                    </div>' +
                    '                    <div class="form-group">' +
                    '                        <label for="mInputTeacherAge" class="col-sm-3 col-md-3 control-label">年龄</label>' +
                    '                        <div class="col-sm-6 col-md-6">' +
                    '                            <input type="number" class="form-control" id="mInputTeacherAge" placeholder="20" min="1" max="100" />' +
                    '                        </div>' +
                    '                    </div>' +
                    '                    <div class="form-group">' +
                    '		                <label for="mInputTeacherCollege" class="col-sm-3 col-md-3 control-label">学院</label>' +
                    '                        <div class="col-sm-6 col-md-6">' +
                    '		                    <select class="form-control" id="mInputTeacherCollege">';
            var colleges = getAllCollege();
            for (var i = 0; i < colleges.length; i++) {
                html += '			                    <option value="'+colleges[i].collegeId+'">' + colleges[i].collegeName + '</option>';
            }

            html += '		                    </select>' +
                    '                        </div>' +
                    '                   </div>' +
                    '                    <div class="form-group">' +
                    '                        <div class="col-sm-offset-2 col-sm-6 col-md-6">' +
                    '                               <button class="btn btn-default btn-block" onclick="updateTeacher()">确认修改</button>' +
                    '                               <button class="btn btn-default btn-block mBtnOffset" onclick="closeTeacherModifyWindow()">取消修改</button>' +
                    '                               <button class="btn btn-default btn-block mBtnOffset" onclick="deleteTeacher(\''+teacherId+'\')">删除教师</button>' +
                    '                        </div>' +
                    '                    </div>' +
                    '                </div>' +
                    '            </div>' +
                    '        </div>' +
                    '        </div>';
            modifyTeacherInfo = layer.open({
                type: 1,
                title: '修改教师信息',
                content: html,
                area: ['500px', '600px'],
                resize: false
            });
            initTeacherModifyInfo(teacherId);
        }

        function getTeacher(teacherId) {
            var teacher = {};
            var results = "";
            teacher.teacherId = teacherId;
            $.ajax({
                async : false,
                type : 'POST',
                url : '${cp}/getTeacherById',
                data : teacher,
                dataType : 'json',
                success : function(result) {
                    results = result.result;
                    if(results == "none")
                        layer.alert("教师不存在");
                },
                error : function(result) {
                    layer.alert('查询教师错误');
                }
            });
            return JSON.parse(results);
        }

        function initTeacherModifyInfo(teacherId) {
            var teacher = getTeacher(teacherId);
            document.getElementById("mInputTeacherId").value = teacher.teacherId;
            document.getElementById("mInputTeacherPassword").value = teacher.teacherPassword;
            document.getElementById("mInputTeacherName").value = teacher.teacherName;
            if(teacher.teacherSex == 0)
                document.getElementById("mMan").checked = true;
            else if(teacher.teacherSex == 1)
                document.getElementById("mWoman").checked = true;
            document.getElementById("mInputTeacherAge").value = teacher.teacherAge;
            var teacherColleges = document.getElementById("mInputTeacherCollege");
            for(var i=0;i<teacherColleges.options.length;i++){
                if(teacherColleges.options[i].value == teacher.teacherCollege){
                    teacherColleges.options[i].selected = true;
                    break;
                }
            }
            if(teacher.teacherTitle == 0)
                document.getElementById("mInputTeacherTitle").value = "讲师";
            else if(teacher.teacherTitle == 1)
                document.getElementById("mInputTeacherTitle").value = "副教授";
            else if(teacher.teacherTitle == 2)
                document.getElementById("mInputTeacherTitle").value = "教授";
            document.getElementById("mInputTeacherAge").value = teacher.teacherAge;
        }

        function updateTeacher() {
            var teacher = {};
            teacher.teacherId = document.getElementById("mInputTeacherId").value;
            teacher.teacherPassword = document.getElementById("mInputTeacherPassword").value;
            teacher.teacherName = document.getElementById("mInputTeacherName").value;
            teacher.teacherAge = document.getElementById("mInputTeacherAge").value;
            var teacherTitle = document.getElementById("mInputTeacherTitle").value;
            if(teacherTitle == "讲师")
                teacher.teacherTitle = 1;
            else if(teacherTitle == "副教授")
                teacher.teacherTitle = 2;
            else if(teacherTitle == "教授")
                teacher.teacherTitle = 3;
            teacher.teacherSex = -1;
            if(document.getElementById("mWoman").checked)
                teacher.teacherSex = 1;
            else if(document.getElementById("mMan").checked)
                teacher.teacherSex = 0;

            var teacherCollege = document.getElementById("mInputTeacherCollege");
            var collegeIndex = teacherCollege.selectedIndex;
            teacher.teacherCollege = teacherCollege.options[collegeIndex].value;

            var updateResult=""             ;
            $.ajax({
                async : false, //设置同步
                type : 'POST',
                url : '${cp}/updateTeacher',
                data : teacher,
                dataType : 'json',
                success : function(result) {
                    updateResult = result.result;
                },
                error : function() {
                    layer.alert('更新教师错误');
                }
            });
            if(updateResult == "success")
            {
                layer.close(modifyTeacherInfo);
                teacherManage();
                layer.msg('更新教师 '+teacher.teacherName+' 成功',{icon:1});
            }
        }

        function closeTeacherModifyWindow() {
            layer.close(modifyTeacherInfo);
        }

        function deleteTeacher(teacherId) {
            var user = {};
            user.teacherId = teacherId;
            var deleteResult = "";
            $.ajax({
                async : false, //设置同步
                type : 'POST',
                url : '${cp}/deleteTeacher',
                data : user,
                dataType : 'json',
                success : function(result) {
                    deleteResult = result.result;
                },
                error : function() {
                    layer.alert('删除教师错误');
                }
            });
            if(deleteResult == "success") {
                layer.close(modifyTeacherInfo);
                teacherManage();
                layer.msg('删除教师' + teacherId + '成功', {icon: 1});
            }
        }

        var addTeacherByExcelWindow;

        function addTeachersByExcel() {
            var results = "";
            $.ajaxFileUpload({
                url:'${cp}/addTeachersExcel',
                secureuri:false ,
                fileElementId:'teachersExcelUpload',
                type:'POST',
                dataType : 'text',
                success: function (result){
                    result = result.replace(/<pre.*?>/g, '');  //ajaxFileUpload会对服务器响应回来的text内容加上<pre style="....">text</pre>前后缀
                    result = result.replace(/<PRE.*?>/g, '');
                    result = result.replace("<PRE>", '');
                    result = result.replace("</PRE>", '');
                    result = result.replace("<pre>", '');
                    result = result.replace("</pre>", '');
                    result = JSON.parse(result);
                    results = result.result;
                    if(results == "success") {
                        layer.close(addTeacherByExcelWindow);
                        layer.msg("教师添加成功", {icon: 1});
                        teacherManage();
                    }
                    else {
                        layer.msg(results, {icon: 0});
                    }

                },
                error: function ()
                {
                    layer.alert("上传错误");
                }}
            );
        }

        function addTeachersByExcelPre() {
            var html = '<div class="container windowBox">'+
                    '          <div class="row">'+
                    '                   <div class="form-group">'+
                    '                                <label for="teachersExcelUpload" class="col-sm-3 col-md-3 cosntrol-label">上传文件</label>'+
                    '                                <div class="col-sm-6 col-md-6">'+
                    '                                    <input name="teachersExcelUpload" type="file"  id="teachersExcelUpload" accept="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet,application/vnd.ms-excel,.csv"/>'+
                    '                                    <p class="help-block">上传的文件内容格式必须与示例一致</p>'+
                    '                                </div>'+
                    '                   </div>'+
                    '          </div>'+
                    '          <div class="row pd-t-20">'+
                    '                 <div class="col-sm-2 col-md-2 col-lg-2"></div>'+
                    '                 <button class="btn btn-default col-sm-3 col-md-3 col-lg-3" onclick="addTeachersByExcel()">上传文件</button>'+
                    '                 <div class="col-sm-2 col-md-2 col-lg-2"></div>'+
                    '                 <button class="btn btn-default col-sm-3 col-md-3 col-lg-3">示例下载</button>'+
                    '          </div>'+
                    '  </div>';
            addTeacherByExcelWindow = layer.open({
                type: 1,
                title: '上传Excel文件',
                content: html,
                area: ['400px', '250px'],
                resize: false
            });
        }


        //课程管理
        function getAllCourses() {
            var allCourses = "";
            var currentTeacher = {};
            currentTeacher.teacherId = ${currentTeacher.teacherId};
            $.ajax({
                async : false, //设置同步
                type : 'POST',
                url : '${cp}/getAllCourses',
                data : currentTeacher,
                dataType : 'json',
                success : function(result) {
                    if (result!=null) {
                        allCourses = result.result;
                    }
                    else{
                        layer.alert('查询错误');
                    }
                },
                error : function(result) {
                    layer.alert('查询错误');
                }
            });
            allCourses = eval("("+allCourses+")");
            return allCourses;
        }

        function courseManage() {
            window.location.href = "#page4";
            var courseManage = document.getElementById("courseManage");
            var html;
            var courses = getAllCourses();
            html = '<div class="container">'+
                    '                  <div class="row studentsTable">'+
                    '                        <table class="table col-sm-12 col-md-12 col-lg-12">'+
                    '                              <tr>'+
                    '                                    <th>课程号</th>'+
                    '                                    <th>课程名</th>'+
                    '                                    <th>学分</th>'+
                    '                                    <th>课时</th>'+
                    '                                    <th>开课学院</th>'+
                    '                                    <th>是否修改</th>'+
                    '                              </tr>';
            for(var i=0;i<courses.length;i++){
                var courseId = courses[i].courseId;
                var courseName = courses[i].courseName;
                var courseScore = courses[i].courseScore;
                var courseTime = courses[i].courseTime;
                var courseCollege = getCollege(courses[i].courseCollege);
                html+=  '                              <tr>'+
                        '                                    <td>'+courseId+'</td>'+
                        '                                    <td>'+courseName+'</td>'+
                        '                                    <td>'+courseScore+'</td>'+
                        '                                    <td>'+courseTime+'</td>'+
                        '                                    <td>'+courseCollege.collegeName+'</td>'+
                        '                                    <td><button class="btn btn-default" onclick="modifyCourse(\''+courseId+'\')">修改</button> </td>'+
                        '                              </tr>';
            }
            html+=  '                           </table>'+
                    '                       </div>'+
                    '                       <div class="row">'+
                    '                           <div class="col-sm-3 col-md-3 col-lg-3"></div>'+
                    '                           <div class="col-sm-6 col-md-6 col-lg-6">'+
                    '                               <button class="btn btn-default col-sm-5 col-md-5 col-lg-5" onclick="addCourse()">'+
                    '                                   添加课程'+
                    '                               </button>'+
                    '                               <div class="col-sm-2 col-md-2 col-lg-2"></div>'+
                    '                               <button class="btn btn-default col-sm-5 col-md-5 col-lg-5" onclick="addCourseByExcelPre()">'+
                    '                                   Excel批量导入课程'+
                    '                               </button>'+
                    '                            </div>'+
                    '                       </div>'+
                    '                  </div>'+
                    '            </div>';
            courseManage.innerHTML = html;
        }

        var inputCourseInfoWindow;
        
        function addCourse() {
            var html = '<div class="container windowBox">' +
                    '          <div class="row">' +
                    '            <div class="col-sm-offset-2 col-md-offset-2">' +
                    '                <div  class="form-horizontal">' +
                    '                    <div class="form-group">' +
                    '                        <label for="inputCourseId" class="col-sm-3 col-md-3 control-label">课程号</label>' +
                    '                        <div class="col-sm-6 col-md-6">' +
                    '                            <input type="text" class="form-control" id="inputCourseId" placeholder="08301001">' +
                    '                        </div>' +
                    '                    </div>' +
                    '                    <div class="form-group">' +
                    '                        <label for="inputCourseName" class="col-sm-3 col-md-3 control-label">课程名</label>' +
                    '                        <div class="col-sm-6 col-md-6">' +
                    '                            <input type="text" class="form-control" id="inputCourseName" placeholder="离散数学" />' +
                    '                        </div>' +
                    '                    </div>' +
                    '                    <div class="form-group">' +
                    '                        <label for="inputCourseScore" class="col-sm-3 col-md-3 control-label">学分</label>' +
                    '                        <div class="col-sm-6 col-md-6">' +
                    '                            <input type="number" class="form-control" id="inputCourseScore" placeholder="4"/>' +
                    '                        </div>' +
                    '                    </div>' +
                    '                    <div class="form-group">' +
                    '                        <label for="inputCourseTime" class="col-sm-3 col-md-3 control-label">学时</label>' +
                    '                        <div class="col-sm-6 col-md-6">' +
                    '                            <input type="number" class="form-control" id="inputCourseTime" placeholder="30" />' +
                    '                        </div>' +
                    '                    </div>' +
                    '                    <div class="form-group">' +
                    '		                <label for="inputCourseCollege" class="col-sm-3 col-md-3 control-label">开课学院</label>' +
                    '                        <div class="col-sm-6 col-md-6">' +
                    '		                    <select class="form-control" id="inputCourseCollege">';
            var colleges = getAllCollege();
            for (var i = 0; i < colleges.length; i++) {
                html += '			                    <option value="'+colleges[i].collegeId+'">' + colleges[i].collegeName + '</option>';
            }

            html += '		                    </select>' +
                    '                        </div>' +
                    '                   </div>' +
                    '                    <div class="form-group">' +
                    '                        <div class="col-sm-offset-2 col-sm-6">' +
                    '                            <button class="btn btn-lg btn-default btn-block" type="submit" onclick="addCourseSubmit()">确认添加</button>' +
                    '                        </div>' +
                    '                    </div>' +
                    '                </div>' +
                    '            </div>' +
                    '        </div>' +
                    '        </div>';
            inputCourseInfoWindow = layer.open({
                type: 1,
                title: '添加学生',
                content: html,
                area: ['500px', '430px'],
                resize: false
            });
        }
        function addCourseSubmit() {
            var course = {};
            course.courseId = document.getElementById("inputCourseId").value;
            course.courseName = document.getElementById("inputCourseName").value;
            course.courseScore = document.getElementById("inputCourseScore").value;
            course.courseTime = document.getElementById("inputCourseTime").value;
            var courseCollege = document.getElementById("inputCourseCollege");
            var collegeIndex = courseCollege.selectedIndex;
            course.courseCollege = courseCollege.options[collegeIndex].value;
            var addResult = "";
            $.ajax({
                async : false, //设置同步
                type : 'POST',
                url : '${cp}/addCourse',
                data : course,
                dataType : 'json',
                success : function(result) {
                    addResult = result.result;
                },
                error : function() {
                    layer.alert('查询用户错误');
                }
            });
            if(addResult == "success")
            {
                layer.close(inputCourseInfoWindow);
                courseManage();
                layer.msg('添加课程 '+course.courseName+' 成功',{icon:1});
            }
        }

        var modifyCourseInfo;

        function modifyCourse(courseId) {
            var html = '<div class="container windowBox">' +
                    '          <div class="row">' +
                    '            <div class="col-sm-offset-2 col-md-offset-2">' +
                    '                <div  class="form-horizontal">' +
                    '                    <div class="form-group">' +
                    '                        <label for="mCourseId" class="col-sm-3 col-md-3 control-label" >课程号</label>' +
                    '                        <div class="col-sm-6 col-md-6">' +
                    '                            <input type="text" class="form-control" id="mCourseId" placeholder="08301001" readonly>' +
                    '                        </div>' +
                    '                    </div>' +
                    '                    <div class="form-group">' +
                    '                        <label for="mCourseName" class="col-sm-3 col-md-3 control-label">课程名</label>' +
                    '                        <div class="col-sm-6 col-md-6">' +
                    '                            <input type="text" class="form-control" id="mCourseName" placeholder="离散数学">' +
                    '                        </div>' +
                    '                    </div>' +
                    '                    <div class="form-group">' +
                    '                        <label for="mCourseScore" class="col-sm-3 col-md-3 control-label">学分</label>' +
                    '                        <div class="col-sm-6 col-md-6">' +
                    '                            <input type="number" class="form-control" id="mCourseScore" placeholder="4" />' +
                    '                        </div>' +
                    '                    </div>' +
                    '                    <div class="form-group">' +
                    '                        <label for="mCourseTime" class="col-sm-3 col-md-3 control-label">学时</label>' +
                    '                        <div class="col-sm-6 col-md-6">' +
                    '                            <input type="number" class="form-control" id="mCourseTime" placeholder="30" />' +
                    '                        </div>' +
                    '                    </div>' +
                    '                    <div class="form-group">' +
                    '		                <label for="mCourseCollege" class="col-sm-3 col-md-3 control-label">开课学院</label>' +
                    '                        <div class="col-sm-6 col-md-6">' +
                    '		                    <select class="form-control" id="mCourseCollege">';
            var colleges = getAllCollege();
            for (var i = 0; i < colleges.length; i++) {
                html += '			                    <option value="'+colleges[i].collegeId+'">' + colleges[i].collegeName + '</option>';
            }

            html += '		                    </select>' +
                    '                        </div>' +
                    '                   </div>' +
                    '                    <div class="form-group">' +
                    '                        <div class="col-sm-offset-2 col-sm-6 col-md-6">' +
                    '                               <button class="btn btn-default btn-block" onclick="updateCourse()">确认修改</button>' +
                    '                               <button class="btn btn-default btn-block mBtnOffset" onclick="closeCourseModifyWindow()">取消修改</button>' +
                    '                               <button class="btn btn-default btn-block mBtnOffset" onclick="deleteCourse(\''+courseId+'\')">删除学院</button>' +
                    '                        </div>' +
                    '                    </div>' +
                    '                </div>' +
                    '            </div>' +
                    '        </div>' +
                    '        </div>';
            modifyCourseInfo = layer.open({
                type: 1,
                title: '修改课程信息',
                content: html,
                area: ['500px', '450px'],
                resize: false
            });
            initCourseModifyInfo(courseId);
        }

        function getCourse(courseId) {
            var course = {};
            var results = "";
            course.courseId = courseId;
            $.ajax({
                async : false,
                type : 'POST',
                url : '${cp}/getCourseById',
                data : course,
                dataType : 'json',
                success : function(result) {
                    results = result.result;
                    if(results == "none")
                        layer.alert("课程不存在");
                },
                error : function(result) {
                    layer.alert('查询课程错误');
                }
            });
            return JSON.parse(results);
        }

        function initCourseModifyInfo(courseId) {
            var course = getCourse(courseId);
            document.getElementById("mCourseId").value = course.courseId;
            document.getElementById("mCourseName").value = course.courseName;
            document.getElementById("mCourseScore").value = course.courseScore;
            document.getElementById("mCourseTime").value = course.courseTime;
            var courseColleges = document.getElementById("mCourseCollege");
            for(var i=0;i<courseColleges.options.length;i++){
                if(courseColleges.options[i].value == course.courseCollege){
                    courseColleges.options[i].selected = true;
                    break;
                }
            }
        }

        function updateCourse() {
            var course = {};
            course.courseId = document.getElementById("mCourseId").value;
            course.courseName = document.getElementById("mCourseName").value;
            course.courseScore = document.getElementById("mCourseScore").value;
            course.courseTime = document.getElementById("mCourseTime").value;
            var courseCollege = document.getElementById("mCourseCollege");
            var collegeIndex = courseCollege.selectedIndex;
            course.courseCollege = courseCollege.options[collegeIndex].value;
            var updateResult = "";
            $.ajax({
                async : false, //设置同步
                type : 'POST',
                url : '${cp}/updateCourse',
                data : course,
                dataType : 'json',
                success : function(result) {
                    updateResult = result.result;
                },
                error : function() {
                    layer.alert('查询用户错误');
                }
            });
            if(updateResult == "success")
            {
                layer.close(modifyCourseInfo);
                courseManage();
                layer.msg('更新课程 '+course.courseName+' 成功',{icon:1});
            }
        }

        function closeCourseModifyWindow(){
            layer.close(modifyCourseInfo);
        }

        function deleteCourse(courseId) {
            var course = {};
            course.courseId = courseId;
            var deleteResult = "";
            $.ajax({
                async : false, //设置同步
                type : 'POST',
                url : '${cp}/deleteCourse',
                data : course,
                dataType : 'json',
                success : function(result) {
                    deleteResult = result.result;
                },
                error : function() {
                    layer.alert('删除课程错误');
                }
            });
            if(deleteResult == "success") {
                layer.close(modifyCourseInfo);
                courseManage();
                layer.msg('删除课程' + courseId + '成功', {icon: 1});
            }
        }

        var  addCoursesByExcelWindow;

        function addCourseByExcelPre() {
            var html = '<div class="container windowBox">'+
                    '          <div class="row">'+
                    '                   <div class="form-group">'+
                    '                                <label for="coursesExcelUpload" class="col-sm-3 col-md-3 cosntrol-label">上传文件</label>'+
                    '                                <div class="col-sm-6 col-md-6">'+
                    '                                    <input name="coursesExcelUpload" type="file"  id="coursesExcelUpload" accept="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet,application/vnd.ms-excel,.csv"/>'+
                    '                                    <p class="help-block">上传的文件内容格式必须与示例一致</p>'+
                    '                                </div>'+
                    '                   </div>'+
                    '          </div>'+
                    '          <div class="row pd-t-20">'+
                    '                 <div class="col-sm-2 col-md-2 col-lg-2"></div>'+
                    '                 <button class="btn btn-default col-sm-3 col-md-3 col-lg-3" onclick="addCoursesByExcel()">上传文件</button>'+
                    '                 <div class="col-sm-2 col-md-2 col-lg-2"></div>'+
                    '                 <button class="btn btn-default col-sm-3 col-md-3 col-lg-3">示例下载</button>'+
                    '          </div>'+
                    '  </div>';
            addCoursesByExcelWindow = layer.open({
                type: 1,
                title: '上传Excel文件',
                content: html,
                area: ['400px', '250px'],
                resize: false
            });
        }
        function addCoursesByExcel() {
            var results = "";
            $.ajaxFileUpload({
                url:'${cp}/addCoursesExcel',
                secureuri:false ,
                fileElementId:'coursesExcelUpload',
                type:'POST',
                dataType : 'text',
                success: function (result){
                    result = result.replace(/<pre.*?>/g, '');  //ajaxFileUpload会对服务器响应回来的text内容加上<pre style="....">text</pre>前后缀
                    result = result.replace(/<PRE.*?>/g, '');
                    result = result.replace("<PRE>", '');
                    result = result.replace("</PRE>", '');
                    result = result.replace("<pre>", '');
                    result = result.replace("</pre>", '');
                    result = JSON.parse(result);
                    results = result.result;
                    if(results == "success") {
                        layer.close(addCoursesByExcelWindow);
                        layer.msg("课程添加成功", {icon: 1});
                        courseManage();
                    }
                    else {
                        layer.msg(results, {icon: 0});
                    }

                },
                error: function ()
                {
                    layer.alert("上传错误");
                }}
            );
        }


        //开课管理
        function getAllCourseOpens() {
            var allCourseOpens = "";
            var currentTeacher = {};
            currentTeacher.teacherId = ${currentTeacher.teacherId};
            $.ajax({
                async : false, //设置同步
                type : 'POST',
                url : '${cp}/getAllCourseOpens',
                data : currentTeacher,
                dataType : 'json',
                success : function(result) {
                    if (result!=null) {
                        allCourseOpens = result.result;
                    }
                    else{
                        layer.alert('查询错误');
                    }
                },
                error : function(result) {
                    layer.alert('查询错误');
                }
            });
            allCourseOpens = eval("("+allCourseOpens+")");
            return allCourseOpens;
        }
        function courseOpenManage() {
            window.location.href = "#page5";
            var courseOpenManage = document.getElementById("courseOpenManage");
            var html;
            var courseOpens = getAllCourseOpens();
            html = '<div class="container">'+
                    '                  <div class="row studentsTable">'+
                    '                        <table class="table col-sm-12 col-md-12 col-lg-12">'+
                    '                              <tr>'+
                    '                                    <th>课程号</th>'+
                    '                                    <th>开课学期</th>'+
                    '                                    <th>任课老师</th>'+
                    '                                    <th>限制人数</th>'+
                    '                                    <th>上课时间</th>'+
                    '                                    <th>上课地点</th>'+
                    '                                    <th>答疑时间</th>'+
                    '                                    <th>答疑地点</th>'+
                    '                                    <th>是否修改</th>'+
                    '                              </tr>';
            for(var i=0;i<courseOpens.length;i++){
                var courseOpenId = courseOpens[i].courseId;
                var courseOpenTerm = courseOpens[i].courseTerm;
                var courseOpenTeacher = courseOpens[i].courseTeacher;
                var courseLimitNumber = courseOpens[i].courseChoiceNumber+'/'+courseOpens[i].courseLimitNumber;
                var courseTime = courseOpens[i].courseTime;
                var coursePlace = courseOpens[i].coursePlace;
                var courseAnswerTime = courseOpens[i].courseAnswerTime;
                var courseAnswerPlace = courseOpens[i].courseAnswerPlace;
                html+=  '                              <tr>'+
                        '                                    <td>'+courseOpenId+'</td>'+
                        '                                    <td>'+courseOpenTerm+'</td>'+
                        '                                    <td>'+courseOpenTeacher+'</td>'+
                        '                                    <td>'+courseLimitNumber+'</td>'+
                        '                                    <td>'+courseTime+'</td>'+
                        '                                    <td>'+coursePlace+'</td>'+
                        '                                    <td>'+courseAnswerTime+'</td>'+
                        '                                    <td>'+courseAnswerPlace+'</td>'+
                        '                                    <td><button class="btn btn-default" onclick="modifyCourseOpen(\''+courseOpenId+'\',\''+courseOpenTerm+'\',\''+courseOpenTeacher+'\')">修改</button> </td>'+
                        '                              </tr>';
            }
            html+=  '                           </table>'+
                    '                       </div>'+
                    '                       <div class="row">'+
                    '                           <div class="col-sm-3 col-md-3 col-lg-3"></div>'+
                    '                           <div class="col-sm-6 col-md-6 col-lg-6">'+
                    '                               <button class="btn btn-default col-sm-5 col-md-5 col-lg-5" onclick="addCourseOpen()">'+
                    '                                   添加开课课程'+
                    '                               </button>'+
                    '                               <div class="col-sm-2 col-md-2 col-lg-2"></div>'+
                    '                               <button class="btn btn-default col-sm-5 col-md-5 col-lg-5" onclick="addCourseOpenByExcelPre()">'+
                    '                                   Excel批量导入开课课程'+
                    '                               </button>'+
                    '                            </div>'+
                    '                       </div>'+
                    '                  </div>'+
                    '            </div>';
            courseOpenManage.innerHTML = html;
        }

        var inputCourseOpenInfoWindow;

        function addCourseOpen() {
            var html = '<div class="container windowBox">' +
                    '          <div class="row">' +
                    '            <div class="col-sm-offset-2 col-md-offset-2">' +
                    '                <div  class="form-horizontal">' +
                    '                    <div class="form-group">' +
                    '                        <label for="inputCourseId" class="col-sm-3 col-md-3 control-label">课程号</label>' +
                    '                        <div class="col-sm-6 col-md-6">' +
                    '                            <input type="text" class="form-control" id="inputCourseId" placeholder="08301001">' +
                    '                        </div>' +
                    '                    </div>' +
                    '                    <div class="form-group">' +
                    '                        <label for="inputCourseTerm" class="col-sm-3 col-md-3 control-label">开课学期</label>' +
                    '                        <div class="col-sm-6 col-md-6">' +
                    '                            <input type="text" class="form-control" id="inputCourseTerm" placeholder="2016-2017春季学期" />' +
                    '                        </div>' +
                    '                    </div>' +
                    '                    <div class="form-group">' +
                    '                        <label for="inputCourseTeacher" class="col-sm-3 col-md-3 control-label">开课教师</label>' +
                    '                        <div class="col-sm-6 col-md-6">' +
                    '                            <input type="text" class="form-control" id="inputCourseTeacher" placeholder="10101010"/>' +
                    '                        </div>' +
                    '                    </div>' +
                    '                    <div class="form-group">' +
                    '                        <label for="inputCourseNumber" class="col-sm-3 col-md-3 control-label">限制人数</label>' +
                    '                        <div class="col-sm-6 col-md-6">' +
                    '                            <input type="number" class="form-control" id="inputCourseNumber" placeholder="30" />' +
                    '                        </div>' +
                    '                    </div>' +
                    '                    <div class="form-group">' +
                    '                        <label for="inputCourseTime" class="col-sm-3 col-md-3 control-label">上课时间</label>' +
                    '                        <div class="col-sm-6 col-md-6">' +
                    '                            <input type="text" class="form-control" id="inputCourseTime" placeholder="一7-8"/>' +
                    '                        </div>' +
                    '                    </div>' +
                    '                    <div class="form-group">' +
                    '                        <label for="inputCoursePlace" class="col-sm-3 col-md-3 control-label">上课地点</label>' +
                    '                        <div class="col-sm-6 col-md-6">' +
                    '                            <input type="text" class="form-control" id="inputCoursePlace" placeholder="AJ104"/>' +
                    '                        </div>' +
                    '                    </div>' +
                    '                    <div class="form-group">' +
                    '                        <label for="inputCourseAnswerTime" class="col-sm-3 col-md-3 control-label">答疑时间</label>' +
                    '                        <div class="col-sm-6 col-md-6">' +
                    '                            <input type="text" class="form-control" id="inputCourseAnswerTime" placeholder="二7-9"/>' +
                    '                        </div>' +
                    '                    </div>' +
                    '                    <div class="form-group">' +
                    '                        <label for="inputCourseAnswerPlace" class="col-sm-3 col-md-3 control-label">答疑地点</label>' +
                    '                        <div class="col-sm-6 col-md-6">' +
                    '                            <input type="text" class="form-control" id="inputCourseAnswerPlace" placeholder="BJ104"/>' +
                    '                        </div>' +
                    '                    </div>' +
                    '                    <div class="form-group">' +
                    '                        <div class="col-sm-offset-2 col-sm-6">' +
                    '                            <button class="btn btn-lg btn-default btn-block" type="submit" onclick="addCourseOpenSubmit()">确认添加</button>' +
                    '                        </div>' +
                    '                    </div>' +
                    '                </div>' +
                    '            </div>' +
                    '        </div>' +
                    '        </div>';
            inputCourseOpenInfoWindow = layer.open({
                type: 1,
                title: '添加学生',
                content: html,
                area: ['500px', '600px'],
                resize: false
            });
        }
        function addCourseOpenSubmit() {
            var courseOpen = {};
            courseOpen.courseId = document.getElementById("inputCourseId").value;
            courseOpen.courseTerm = document.getElementById("inputCourseTerm").value;
            courseOpen.courseTeacher = document.getElementById("inputCourseTeacher").value;
            courseOpen.courseLimitNumber = document.getElementById("inputCourseNumber").value;
            courseOpen.courseTime = document.getElementById("inputCourseTime").value;
            courseOpen.coursePlace = document.getElementById("inputCourseNumber").value;
            courseOpen.courseAnswerTime = document.getElementById("inputCourseAnswerTime").value;
            courseOpen.courseAnswerPlace = document.getElementById("inputCourseAnswerPlace").value;
            var addResult = "";
            $.ajax({
                async : false, //设置同步
                type : 'POST',
                url : '${cp}/addCourseOpen',
                data : courseOpen,
                dataType : 'json',
                success : function(result) {
                    addResult = result.result;
                },
                error : function() {
                    layer.alert('查询用户错误');
                }
            });
            if(addResult == "success")
            {
                layer.close(inputCourseOpenInfoWindow);
                courseOpenManage();
                layer.msg('添加开课课程 '+courseOpen.courseId+' 成功',{icon:1});
            }
        }

        var modifyCourseOpenInfo;

        function modifyCourseOpen(courseId,courseTerm,courseTeacher) {
            var html = '<div class="container windowBox">' +
                    '          <div class="row">' +
                    '            <div class="col-sm-offset-2 col-md-offset-2">' +
                    '                <div  class="form-horizontal">' +
                    '                    <div class="form-group">' +
                    '                        <label for="mCourseId" class="col-sm-3 col-md-3 control-label">课程号</label>' +
                    '                        <div class="col-sm-6 col-md-6">' +
                    '                            <input type="text" class="form-control" id="mCourseId" placeholder="08301001">' +
                    '                        </div>' +
                    '                    </div>' +
                    '                    <div class="form-group">' +
                    '                        <label for="mCourseTerm" class="col-sm-3 col-md-3 control-label">开课学期</label>' +
                    '                        <div class="col-sm-6 col-md-6">' +
                    '                            <input type="text" class="form-control" id="mCourseTerm" placeholder="离散数学" />' +
                    '                        </div>' +
                    '                    </div>' +
                    '                    <div class="form-group">' +
                    '                        <label for="mCourseTeacher" class="col-sm-3 col-md-3 control-label">开课教师</label>' +
                    '                        <div class="col-sm-6 col-md-6">' +
                    '                            <input type="text" class="form-control" id="mCourseTeacher" placeholder="4"/>' +
                    '                        </div>' +
                    '                    </div>' +
                    '                    <div class="form-group">' +
                    '                        <label for="mCourseNumber" class="col-sm-3 col-md-3 control-label">限制人数</label>' +
                    '                        <div class="col-sm-6 col-md-6">' +
                    '                            <input type="number" class="form-control" id="mCourseNumber" placeholder="30" />' +
                    '                        </div>' +
                    '                    </div>' +
                    '                    <div class="form-group">' +
                    '                        <label for="mCourseTime" class="col-sm-3 col-md-3 control-label">上课时间</label>' +
                    '                        <div class="col-sm-6 col-md-6">' +
                    '                            <input type="text" class="form-control" id="mCourseTime" placeholder="一7-8"/>' +
                    '                        </div>' +
                    '                    </div>' +
                    '                    <div class="form-group">' +
                    '                        <label for="mCoursePlace" class="col-sm-3 col-md-3 control-label">上课地点</label>' +
                    '                        <div class="col-sm-6 col-md-6">' +
                    '                            <input type="number" class="form-control" id="mCoursePlace" placeholder="AJ104"/>' +
                    '                        </div>' +
                    '                    </div>' +
                    '                    <div class="form-group">' +
                    '                        <label for="mCourseAnswerTime" class="col-sm-3 col-md-3 control-label">答疑时间</label>' +
                    '                        <div class="col-sm-6 col-md-6">' +
                    '                            <input type="text" class="form-control" id="mCourseAnswerTime" placeholder="二7-9"/>' +
                    '                        </div>' +
                    '                    </div>' +
                    '                    <div class="form-group">' +
                    '                        <label for="mCourseAnswerPlace" class="col-sm-3 col-md-3 control-label">答疑地点</label>' +
                    '                        <div class="col-sm-6 col-md-6">' +
                    '                            <input type="text" class="form-control" id="mCourseAnswerPlace" placeholder="BJ104"/>' +
                    '                        </div>' +
                    '                    </div>' +
                    '                    <div class="form-group">' +
                    '                        <div class="col-sm-offset-2 col-sm-6 col-md-6">' +
                    '                               <button class="btn btn-default btn-block" onclick="updateCourseOpen()">确认修改</button>' +
                    '                               <button class="btn btn-default btn-block mBtnOffset" onclick="closeCourseOpenModifyWindow()">取消修改</button>' +
                    '                               <button class="btn btn-default btn-block mBtnOffset" onclick="deleteCourseOpen(\''+courseId+'\',\''+courseTerm+'\',\''+courseTeacher+'\')">删除开课课程</button>' +
                    '                        </div>' +
                    '                    </div>' +
                    '                </div>' +
                    '            </div>' +
                    '        </div>' +
                    '        </div>';
            modifyCourseOpenInfo = layer.open({
                type: 1,
                title: '修改开课课程信息',
                content: html,
                area: ['500px', '650px'],
                resize: false
            });
            initCourseOpenModifyInfo(courseId,courseTerm,courseTeacher);
        }

        function getCourseOpen(courseId,courseTerm,courseTeacher) {
            var courseOpen = {};
            var results = "";
            courseOpen.courseId = courseId;
            courseOpen.courseTerm = courseTerm;
            courseOpen.courseTeacher = courseTeacher;
            $.ajax({
                async : false,
                type : 'POST',
                url : '${cp}/getCourseOpenById',
                data : courseOpen,
                dataType : 'json',
                success : function(result) {
                    results = result.result;
                    if(results == "none")
                        layer.alert("开课课程不存在");
                },
                error : function(result) {
                    layer.alert('开课课程错误');
                }
            });
            return JSON.parse(results);
        }

        function initCourseOpenModifyInfo(courseId,courseTerm,courseTeacher) {
            var courseOpen = getCourseOpen(courseId,courseTerm,courseTeacher);
            document.getElementById("mCourseId").value = courseOpen.courseId;
            document.getElementById("mCourseTerm").value = courseOpen.courseTerm;
            document.getElementById("mCourseTeacher").value = courseOpen.courseTeacher;
            document.getElementById("mCourseNumber").value = courseOpen.courseLimitNumber;
            document.getElementById("mCourseTime").value = courseOpen.courseTime;
            document.getElementById("mCoursePlace").value = courseOpen.coursePlace;
            document.getElementById("mCourseAnswerTime").value = courseOpen.courseAnswerTime;
            document.getElementById("mCourseAnswerPlace").value = courseOpen.courseAnswerPlace;
        }

        function updateCourseOpen() {
            var courseOpen = {};
            courseOpen.courseId = document.getElementById("mCourseId").value;
            courseOpen.courseTerm = document.getElementById("mCourseTerm").value;
            courseOpen.courseTeacher = document.getElementById("mCourseTeacher").value;
            courseOpen.courseLimitNumber = document.getElementById("mCourseNumber").value;
            courseOpen.courseTime =  document.getElementById("mCourseTime").value;
            courseOpen.coursePlace = document.getElementById("mCoursePlace").value;
            courseOpen.courseAnswerTime = document.getElementById("mCourseAnswerTime").value;
            courseOpen.courseAnswerPlace = document.getElementById("mCourseAnswerPlace").value;
            var updateResult = "";
            $.ajax({
                async : false, //设置同步
                type : 'POST',
                url : '${cp}/updateCourseOpen',
                data : courseOpen,
                dataType : 'json',
                success : function(result) {
                    updateResult = result.result;
                },
                error : function() {
                    layer.alert('查询用户错误');
                }
            });
            if(updateResult == "success")
            {
                layer.close(modifyCourseOpenInfo);
                courseOpenManage();
                layer.msg('更新开课课程成功',{icon:1});
            }
        }

        function closeCourseOpenModifyWindow(){
            layer.close(modifyCourseOpenInfo);
        }

        function deleteCourseOpen(courseId,courseTerm,courseTeacher) {
            var courseOpen = {};
            courseOpen.courseId = courseId;
            courseOpen.courseTerm = courseTerm;
            courseOpen.courseTeacher = courseTeacher;
            var deleteResult = "";
            $.ajax({
                async : false, //设置同步
                type : 'POST',
                url : '${cp}/deleteCourseOpen',
                data : courseOpen,
                dataType : 'json',
                success : function(result) {
                    deleteResult = result.result;
                },
                error : function() {
                    layer.alert('删除开课课程错误');
                }
            });
            if(deleteResult == "success") {
                layer.close(modifyCourseOpenInfo);
                courseOpenManage();
                layer.msg('删除开课课程成功', {icon: 1});
            }
        }

        var  addCourseOpensByExcelWindow;

        function addCourseOpenByExcelPre() {
            var html = '<div class="container windowBox">'+
                    '          <div class="row">'+
                    '                   <div class="form-group">'+
                    '                                <label for="courseOpensExcelUpload" class="col-sm-3 col-md-3 cosntrol-label">上传文件</label>'+
                    '                                <div class="col-sm-6 col-md-6">'+
                    '                                    <input name="courseOpensExcelUpload" type="file"  id="courseOpensExcelUpload" accept="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet,application/vnd.ms-excel,.csv"/>'+
                    '                                    <p class="help-block">上传的文件内容格式必须与示例一致</p>'+
                    '                                </div>'+
                    '                   </div>'+
                    '          </div>'+
                    '          <div class="row pd-t-20">'+
                    '                 <div class="col-sm-2 col-md-2 col-lg-2"></div>'+
                    '                 <button class="btn btn-default col-sm-3 col-md-3 col-lg-3" onclick="addCourseOpensByExcel()">上传文件</button>'+
                    '                 <div class="col-sm-2 col-md-2 col-lg-2"></div>'+
                    '                 <button class="btn btn-default col-sm-3 col-md-3 col-lg-3">示例下载</button>'+
                    '          </div>'+
                    '  </div>';
            addCourseOpensByExcelWindow = layer.open({
                type: 1,
                title: '上传Excel文件',
                content: html,
                area: ['400px', '250px'],
                resize: false
            });
        }
        function addCourseOpensByExcel() {
            var results = "";
            $.ajaxFileUpload({
                url:'${cp}/addCourseOpensExcel',
                secureuri:false ,
                fileElementId:'courseOpensExcelUpload',
                type:'POST',
                dataType : 'text',
                success: function (result){
                    result = result.replace(/<pre.*?>/g, '');  //ajaxFileUpload会对服务器响应回来的text内容加上<pre style="....">text</pre>前后缀
                    result = result.replace(/<PRE.*?>/g, '');
                    result = result.replace("<PRE>", '');
                    result = result.replace("</PRE>", '');
                    result = result.replace("<pre>", '');
                    result = result.replace("</pre>", '');
                    result = JSON.parse(result);
                    results = result.result;
                    if(results == "success") {
                        layer.close(addCourseOpensByExcelWindow);
                        layer.msg("课程添加成功", {icon: 1});
                        courseOpenManage();
                    }
                    else {
                        layer.msg(results, {icon: 0});
                    }

                },
                error: function ()
                {
                    layer.alert("上传错误");
                }}
            );
        }

        //成绩管理
        function getAllCourseChoices() {
            var allCourseChoices = "";
            var currentTeacher = {};
            currentTeacher.teacherId = ${currentTeacher.teacherId};
            $.ajax({
                async : false, //设置同步
                type : 'POST',
                url : '${cp}/getAllCourseChoices',
                data : currentTeacher,
                dataType : 'json',
                success : function(result) {
                    if (result!=null) {
                        allCourseChoices = result.result;
                    }
                    else{
                        layer.alert('查询错误');
                    }
                },
                error : function(result) {
                    layer.alert('查询错误');
                }
            });
            allCourseChoices = eval("("+allCourseChoices+")");
            return allCourseChoices;
        }
        function gradeManage() {
            window.location.href = "#page6";
            var courseChoiceManage = document.getElementById("courseChoiceManage");
            var html;
            var courseChoices = getAllCourseChoices();
            html = '<div class="container">'+
                    '                  <div class="row studentsTable">'+
                    '                        <table class="table col-sm-12 col-md-12 col-lg-12">'+
                    '                              <tr>'+
                    '                                    <th>学生学号</th>'+
                    '                                    <th>课程号</th>'+
                    '                                    <th>开课学期</th>'+
                    '                                    <th>教师工号</th>'+
                    '                                    <th>选课排名</th>'+
                    '                                    <th>平时分百分比</th>'+
                    '                                    <th>平时分</th>'+
                    '                                    <th>考试成绩</th>'+
                    '                                    <th>最终成绩</th>'+
                    '                                    <th>绩点</th>'+
                    '                              </tr>';
            for(var i=0;i<courseChoices.length;i++){
                var studentId = courseChoices[i].studentId;
                var courseId = courseChoices[i].courseId;
                var courseTerm = courseChoices[i].courseTerm;
                var courseTeacher = courseChoices[i].courseTeacher;
                var courseRanking = courseChoices[i].courseRanking;
                var courseNormalPercent = courseChoices[i].courseNormalPercent;
                var courseDailyScore = courseChoices[i].courseDailyScore;
                var courseExamScore = courseChoices[i].courseExamScore;
                var courseFinalScore = courseChoices[i].courseFinalScore;
                var courseGPA = courseChoices[i].courseGPA;
                html+=  '                              <tr>'+
                        '                                    <td>'+studentId+'</td>'+
                        '                                    <td>'+courseId+'</td>'+
                        '                                    <td>'+courseTerm+'</td>'+
                        '                                    <td>'+courseTeacher+'</td>'+
                        '                                    <td>'+courseRanking+'</td>'+
                        '                                    <td>'+courseNormalPercent+'</td>'+
                        '                                    <td>'+courseDailyScore+'</td>'+
                        '                                    <td>'+courseExamScore+'</td>'+
                        '                                    <td>'+courseFinalScore+'</td>'+
                        '                                    <td>'+courseGPA+'</td>'+
                        '                              </tr>';
            }
            html+=  '                           </table>'+
                    '                       </div>'+
                    '                       <div class="row">'+
                    '                           <div class="col-sm-3 col-md-3 col-lg-3"></div>'+
                    '                           <div class="col-sm-6 col-md-6 col-lg-6">'+
                    '                               <button class="btn btn-default col-sm-5 col-md-5 col-lg-5" id="normolState" onclick="changeNormolState()">'+
                    '                                   开启平时成绩录入'+
                    '                               </button>'+
                    '                               <div class="col-sm-2 col-md-2 col-lg-2"></div>'+
                    '                               <button class="btn btn-default col-sm-5 col-md-5 col-lg-5" id="examState" onclick="changeExamState()">'+
                    '                                   开启考试成绩录入'+
                    '                               </button>'+
                    '                            </div>'+
                    '                       </div>'+
                    '                  </div>'+
                    '            </div>';
            studentManage.innerHTML = html;
            initState();
        }
        function initState() {
            var normolState = document.getElementById("normolState");
            var examState = document.getElementById("examState");
            var state = getState();
            if(state.isNormol ==1)
                normolState.innerHTML = "关闭平时成绩录入";
            if(state.isExam == 1)
                examState.innerHTML = "关闭考试成绩录入";
        }

        function changeNormolState() {
            var state = getState();
            var newState = {};
            newState.id = state.id;
            newState.isChoice = state.isChoice;
            newState.isExam = state.isExam;
            newState.isNormol = 1;
            if(state.isNormol == 1)
                newState.isNormol = 0;
            $.ajax({
                async : false, //设置同步
                type : 'POST',
                url : '${cp}/updateState',
                data : newState,
                dataType : 'json',
                success : function(result) {
                    if (result!=null) {
                        results = result.result;
                    }
                    else{
                        layer.alert('查询错误');
                    }
                },
                error : function(result) {
                    layer.alert('查询错误');
                }
            });
            if(result == "success")
                layer.msg("更新状态成功",{icon:1});
        }

        function changeExamState() {
            var state = getState();
            var newState = {};
            newState.id = state.id;
            newState.isChoice = state.isChoice;
            newState.isNormol = state.isExam;
            newState.isExam = 1;
            if(state.isExam == 1)
                newState.isExam = 0;
            $.ajax({
                async : false, //设置同步
                type : 'POST',
                url : '${cp}/updateState',
                data : newState,
                dataType : 'json',
                success : function(result) {
                    if (result!=null) {
                        results = result.result;
                    }
                    else{
                        layer.alert('查询错误');
                    }
                },
                error : function(result) {
                    layer.alert('查询错误');
                }
            });
            if(result == "success")
                layer.msg("更新状态成功",{icon:1});
        }

        function getState() {
            var user = {};
            var results = "";
            $.ajax({
                async : false, //设置同步
                type : 'POST',
                url : '${cp}/getState',
                data : user,
                dataType : 'json',
                success : function(result) {
                    if (result!=null) {
                        results = result.result;
                    }
                    else{
                        layer.alert('查询错误');
                    }
                },
                error : function(result) {
                    layer.alert('查询错误');
                }
            });
            return JSON.parse(results);

        }
    </script>
</body>