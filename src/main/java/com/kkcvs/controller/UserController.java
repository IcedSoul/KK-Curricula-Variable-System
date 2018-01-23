package com.kkcvs.controller;

import com.kkcvs.entity.Student;
import com.kkcvs.entity.Teacher;
import com.kkcvs.service.StudentService;
import com.kkcvs.service.TeacherService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by 14437 on 2017/3/31.
 */
@Controller
public class UserController {

    @Resource
    StudentService studentService;
    @Resource
    TeacherService teacherService;


    @RequestMapping(value = "/login")
    public String register() {
        return "login";
    }

    @RequestMapping(value = "/student")
    public String student() {
        return "student";
    }

    @RequestMapping(value = "/teacher")
    public String teacher() {
        return "teacher";
    }

    @RequestMapping(value = "/doLogin", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> doLogin(String userId, String userPassword, HttpSession httpSession) {
        String result = "fail";
        Student student = studentService.getStudent(userId);
        if (student == null){
            Teacher teacher = teacherService.getTeacher(userId);
            if(teacher != null){
                if(teacher.getTeacherPassword().equals(userPassword)){
                    result = "teacher";
                    teacher.setTeacherPassword("");
                    httpSession.setAttribute("currentTeacher",teacher);
                }
                else
                    result = "wrong";
            }
            else
                result = "unexist";
        }
        else {
            if (student.getStudentPassword().equals(userPassword)) {
                result = "student";
                student.setStudentPassword("");
                httpSession.setAttribute("currentStudent", student);
            } else
                result = "wrong";
        }
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("result", result);
        return resultMap;
    }

}
