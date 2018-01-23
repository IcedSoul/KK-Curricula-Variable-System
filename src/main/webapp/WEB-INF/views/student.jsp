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
    <script src="${cp}/js/layer.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function(){
            $('#fullpage').fullpage({

                //sectionsColor: ['#1bbc9b', '#4BBFC3', '#7BAABE', '#f90']
                anchors: ['page1'],
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
                <div id="courseTable" class="col-sm-6 col-md-6 col-lg-6">
                </div>
                <div class="col-sm-1 col-md-1 col-lg-1"></div>
                <div class="col-sm-5 col-md-5 col-lg-5" id="changeArea"></div>
            </div>
        </div>
    </div>
</div>


<script type="text/javascript">
    function refresh(){
        window.location.href="${cp}/student";
    }
    initCourseTable();
    initChoice();
    function initCourseTable(){
        var courseTable = document.getElementById("courseTable");
        var html = '';
        html = '<table class="table table-bordered table-striped">'+
                '                    <tr>'+
                '                        <th>#</th>'+
                '                        <th>周一</th>'+
                '                        <th>周二</th>'+
                '                        <th>周三</th>'+
                '                        <th>周四</th>'+
                '                        <th>周五</th>'+
                '                    </tr>'+
                '                    <tr>'+
                '                        <th>第一节</th>'+
                '                        <td>高数</td>'+
                '                        <td>大物</td>'+
                '                        <td>线代</td>'+
                '                        <td>编译原理</td>'+
                '                        <td>操作系统</td>'+
                '                    </tr>'+
                '                    <tr>'+
                '                        <th>第二节</th>'+
                '                        <td>高数</td>'+
                '                        <td>大物</td>'+
                '                        <td>线代</td>'+
                '                        <td>编译原理</td>'+
                '                        <td>操作系统</td>'+
                '                    </tr>'+
                '                    <tr>'+
                '                        <th>第三节</th>'+
                '                        <td>高数</td>'+
                '                        <td>大物</td>'+
                '                        <td>线代</td>'+
                '                        <td>编译原理</td>'+
                '                        <td>操作系统</td>'+
                '                    </tr>'+
                '                    <tr>'+
                '                        <th>第四节</th>'+
                '                        <td>高数</td>'+
                '                        <td>大物</td>'+
                '                        <td>线代</td>'+
                '                        <td>编译原理</td>'+
                '                        <td>操作系统</td>'+
                '                    </tr>'+
                '                    <tr>'+
                '                        <th>第一节</th>'+
                '                        <td>高数</td>'+
                '                        <td>大物</td>'+
                '                        <td>线代</td>'+
                '                        <td>编译原理</td>'+
                '                        <td>操作系统</td>'+
                '                    </tr>'+
                '                    <tr>'+
                '                        <th>第五节</th>'+
                '                        <td>高数</td>'+
                '                        <td>大物</td>'+
                '                        <td>线代</td>'+
                '                        <td>编译原理</td>'+
                '                        <td>操作系统</td>'+
                '                    </tr>'+
                '                    <tr>'+
                '                        <th>第六节</th>'+
                '                        <td>高数</td>'+
                '                        <td>大物</td>'+
                '                        <td>线代</td>'+
                '                        <td>编译原理</td>'+
                '                        <td>操作系统</td>'+
                '                    </tr>'+
                '                    <tr>'+
                '                        <th>第七节</th>'+
                '                        <td>高数</td>'+
                '                        <td>大物</td>'+
                '                        <td>线代</td>'+
                '                        <td>编译原理</td>'+
                '                        <td>操作系统</td>'+
                '                    </tr>'+
                '                    <tr>'+
                '                        <th>第八节</th>'+
                '                        <td>高数</td>'+
                '                        <td>大物</td>'+
                '                        <td>线代</td>'+
                '                        <td>编译原理</td>'+
                '                        <td>操作系统</td>'+
                '                    </tr>'+
                '                    <tr>'+
                '                        <th>第九节</th>'+
                '                        <td>高数</td>'+
                '                        <td>大物</td>'+
                '                        <td>线代</td>'+
                '                        <td>编译原理</td>'+
                '                        <td>操作系统</td>'+
                '                    </tr>'+
                '                    <tr>'+
                '                        <th>第十一节</th>'+
                '                        <td>高数</td>'+
                '                        <td>大物</td>'+
                '                        <td>线代</td>'+
                '                        <td>编译原理</td>'+
                '                        <td>操作系统</td>'+
                '                    </tr>'+
                '                    <tr>'+
                '                        <th>第十二节</th>'+
                '                        <td>高数</td>'+
                '                        <td>大物</td>'+
                '                        <td>线代</td>'+
                '                        <td>编译原理</td>'+
                '                        <td>操作系统</td>'+
                '                    </tr>'+
                '                    <tr>'+
                '                        <th>第十三节</th>'+
                '                        <td>高数</td>'+
                '                        <td>大物</td>'+
                '                        <td>线代</td>'+
                '                        <td>编译原理</td>'+
                '                        <td>操作系统</td>'+
                '                    </tr>'+
                '                  </table>';;
        courseTable.innerHTML = html;
    }
    function initChoice(){
        var changeArea = document.getElementById("changeArea");
        var html = '';
        html= '<div class="main-button col-sm-12 col-md-12 col-lg-12" onclick="choiceCourse()">'+
                '<div class="main-button-inner-text">'+
                '选课'+
                '</div>'+
                '</div>'+
                '<div class="main-button col-sm-12 col-md-12 col-lg-12" onclick="deleteCourse()">'+
                '<div class="main-button-inner-text">'+
                '退课'+
                '</div>'+
                '</div>'+
                '<div class="main-button col-sm-12 col-md-12 col-lg-12" onclick="inquiryRanking()">'+
                '<div class="main-button-inner-text">'+
                '查询选课排名'+
                '</div>'+
                '</div>'+
                '<div class="main-button col-sm-12 col-md-12 col-lg-12" onclick="inquiryGrade()">'+
                '<div class="main-button-inner-text">'+
                '查询成绩'+
                '</div>'+
                '</div>'+
                '<div class="main-button col-sm-12 col-md-12 col-lg-12" onclick="choiceCourse()">'+
                '<div class="main-button-inner-text">'+
                '学分完成情况'+
                '</div>'+
                '</div>';
        changeArea.innerHTML = html;
    }

    function choiceCourse(){
        var changeArea = document.getElementById("changeArea");
        var html = "";
        html+='<div class="from-group form-horizontal">'+
                '<table border="0" class="sm-12 md-12 lg-12">'+
                '<tr>'+
                '<td><label for="courseId" class="sm-3 md-3 lg-3">课程号：</label></td>'+
                '<td><input type="text" class="form-control sm-9 md-9 lg-9" id="courseId" placeholder="08305001"></td>'+
                '</tr>'+
                '<td><label for="teacherId" class="sm-3 md-3 lg-3">教师号：</label></td>'+
                '<td><input type="text" class="form-control sm-9 md-9 lg-9" id="teacherId" placeholder="10101010"></td>'+
                '</tr>'+
                '<tr>'+
                '<td><label for="courseTime" class="sm-3 md-3 lg-3">上课时间：</label></td>'+
                '<td><input type="text" class="form-control sm-9 md-9 lg-9" id="courseTime" placeholder="一9-10"></td>'+
                '</tr>'+
                '<tr>'+
                '<td colspan="2"><button class="btn btn-default col-sm-12 col-md-12 col-lg-12" onclick="showSearchResult()">搜索课程</button></td>'+
                '</tr>'+
                '</table>'+
                '</div>';
        changeArea.innerHTML = "";
        changeArea.innerHTML = html;
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

    function showSearchResult(){
        var changeArea = document.getElementById("changeArea");
        var searchCourses = searchCourse();
        var searchResult = document.getElementById("searchResult");
        var html = '';
        html+= '<hr/>'+
                '<table class="table">'+
                '<tr>'+
                '<th>课程号</th>'+
                '<th>课程名</th>'+
                '<th>课程教师</th>'+
                '<th>上课时间</th>'+
                '<th>学分</th>'+
                '<th>选课</th>'+
                '</tr>';
        for(var i=0;i<searchCourses.length;i++) {
            var course = getCourse(searchCourses[i].courseId);
            var teacher = getTeacher(searchCourses[i].courseTeacher)
            html+= '<tr>' +
            '<td>'+searchCourses[i].courseId+'</td>' +
            '<td>'+course.courseName+'</td>' +
            '<td>'+teacher.teacherName+'</td>' +
            '<td>'+searchCourses[i].courseTime+'</td>' +
            '<td>'+course.courseScore+'</td>' +
            '<td><button class="btn btn-default" onclick="addChoiceCourse(\''+searchCourses[i].courseId+'\',\''+searchCourses[i].courseTerm+'\',\''+searchCourses[i].courseTeacher+'\')">选择</button></td>' +
            '</tr>';
        }
         html+='</table>';
        choiceCourse();
        changeArea.innerHTML += html;
    }
    function addChoiceCourse(courseId,courseTerm,courseTeacher) {
        var courseChoice = {};
        courseChoice.studentId = ${currentStudent.studentId};
        courseChoice.courseId = courseId;
        courseChoice.courseTerm = courseTerm;
        courseChoice.courseTeacher = courseTeacher;
        var results = "";
        $.ajax({
            async : false, //设置同步
            type : 'POST',
            url : '${cp}/addChoiceCourse',
            data : courseChoice,
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
        if(results == "success"){
            layer.msg("选课成功",{icon:1});
        }
        if(results == "exist"){
            layer.msg("重复选课",{icon:1});
        }
    }

    function getStudentCourse() {
        var student = {};
        var results = "";
        student.studentId =  ${currentStudent.studentId};
        $.ajax({
            async : false,
            type : 'POST',
            url : '${cp}/getStudentCourseChoices',
            data : student,
            dataType : 'json',
            success : function(result) {
                results = result.result;
            },
            error : function(result) {
                layer.alert('查询错误');
            }
        });
        results = eval("("+results+")");
        return results;
    }

    function searchCourse() {
        var search = {};
        search.courseId = document.getElementById("courseId").value;
        search.teacherId = document.getElementById("teacherId").value;
        search.courseTime = document.getElementById("courseTime").value;
        var results = "";
        $.ajax({
            async : false, //设置同步
            type : 'POST',
            url : '${cp}/searchCourseOpen',
            data : search,
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
        results = eval("("+results+")");
        return results;
    }

    function deleteCourse() {
        var changeArea = document.getElementById("changeArea");
        var studentCourse = getStudentCourse();
        var html = '';
        html = '<table class="table">' +
                '<tr>' +
                '<th>课程号</th>' +
                '<th>课程名</th>' +
                '<th>课程教师</th>' +
                '<th>上课时间</th>' +
                '<th>学分</th>' +
                '<th>退课</th>' +
                '</tr>';
        for (var i = 0; i < studentCourse.length; i++) {
            var course = getCourse(studentCourse[i].courseId);
            var teacher = getTeacher(studentCourse[i].courseTeacher);
            var courseOpen = getCourseOpen(studentCourse[i].courseId,studentCourse[i].courseTerm,studentCourse[i].courseTeacher);
            html += '<tr>' +
                    '<td>' + studentCourse[i].courseId + '</td>' +
                    '<td>' + course.courseName + '</td>' +
                    '<td>' + teacher.teacherName + '</td>' +
                    '<td>' + courseOpen.courseTime + '</td>' +
                    '<td>' + course.courseScore + '</td>' +
                    '<td><button class="btn btn-default" onclick="deleteChoiceCourse(\'' + studentCourse[i].courseId + '\',\'' + studentCourse[i].courseTerm + '\',\'' + studentCourse[i].courseTeacher + '\')">退课</button></td>' +
                    '</tr>';
        }
            html+='</table>';
            changeArea.innerHTML = html;

    }

    function deleteChoiceCourse(courseId,courseTerm,courseTeacher) {
        var courseChoice = {};
        courseChoice.studentId = ${currentStudent.studentId};
        courseChoice.courseId = courseId;
        courseChoice.courseTerm = courseTerm;
        courseChoice.courseTeacher = courseTeacher;
        var results = "";
        $.ajax({
            async : false, //设置同步
            type : 'POST',
            url : '${cp}/deleteChoiceCourse',
            data : courseChoice,
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
        if(results == "success"){
            deleteCourse()
            layer.msg("退课成功",{icon:1});
        }
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

    function inquiryRanking(){
        var changeArea = document.getElementById("changeArea");
        var studentCourse = getStudentCourse();
        var html = '';
        html= '<table class="table">'+
                '<tr>'+
                '<th>课程号</th>'+
                '<th>课程名称</th>'+
                '<th>教师</th>'+
                '<th>学分</th>'+
                '<th>额定人数</th>'+
                '<th>选课人数</th>'+
                '<th>排名</th>'+
                '</tr>';
        for (var i = 0; i < studentCourse.length; i++) {
            var course = getCourse(studentCourse[i].courseId);
            var teacher = getTeacher(studentCourse[i].courseTeacher);
            var courseOpen = getCourseOpen(studentCourse[i].courseId,studentCourse[i].courseTerm,studentCourse[i].courseTeacher);
            html += '<tr>' +
                    '<td>' + studentCourse[i].courseId + '</td>' +
                    '<td>' + course.courseName + '</td>' +
                    '<td>' + teacher.teacherName + '</td>' +
                    '<td>' + course.courseScore + '</td>' +
                    '<td>' + courseOpen.courseLimitNumber + '</td>' +
                    '<td>' + courseOpen.courseChoiceNumber + '</td>' +
                    '<td>' + studentCourse[i].courseRanking + '</td>' +
                    '</tr>';
        }
        html+='</table>';
        changeArea.innerHTML = html;
    }

    function inquiryGrade(){
        var changeArea = document.getElementById("changeArea");
        var studentCourse = getStudentCourse();
        var html = '';
        html= '<table class="table">'+
                '<tr>'+
                '<th>课程号</th>'+
                '<th>课程名称</th>'+
                '<th>教师</th>'+
                '<th>学分</th>'+
                '<th>成绩</th>'+
                '<th>绩点</th>';
        for (var i = 0; i < studentCourse.length; i++) {
            var course = getCourse(studentCourse[i].courseId);
            var teacher = getTeacher(studentCourse[i].courseTeacher);
            html += '<tr>' +
                    '<td>' + studentCourse[i].courseId + '</td>' +
                    '<td>' + course.courseName + '</td>' +
                    '<td>' + teacher.teacherName + '</td>' +
                    '<td>' + course.courseScore + '</td>' +
                    '<td>' + studentCourse[i].courseFinalScore + '</td>' +
                    '<td>' + studentCourse[i].courseGPA + '</td>' +
                    '</tr>';
        }
        html+='</table>';
        changeArea.innerHTML = html;
    }
</script>
</body>
</html>