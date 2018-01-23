package com.kkcvs.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.kkcvs.entity.College;
import com.kkcvs.entity.State;
import com.kkcvs.entity.Teacher;
import com.kkcvs.service.CollegeService;
import com.kkcvs.service.StateService;
import com.kkcvs.service.TeacherService;
import com.kkcvs.util.POIUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.*;

/**
 * Created by 14437 on 2017/5/24.
 */
@Controller
public class TeacherCollege {
    @Resource
    TeacherService teacherService;
    @Resource
    CollegeService collegeService;
    @Resource
    StateService stateService;

    @RequestMapping(value = "/getTeacherById", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> getTeacherById(String teacherId) {
        String result = "";
        Teacher teacher = teacherService.getTeacher(teacherId);
        if(teacher!=null){
            result = JSON.toJSONString(teacher);
        }
        else
            result = "none";
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("result", result);
        return resultMap;
    }


    @RequestMapping(value = "/getAllTeachers", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> getAllTeachers(String teacherId) {
        String result = "";
        Teacher teacher = teacherService.getTeacher(teacherId);
        if(teacher!=null && teacher.getTeacherRole() == 2){
            List<Teacher> teachers = teacherService.getAllTeacher();
            result = JSONArray.toJSONString(teachers);
        }
        else
            result = "error";
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("result", result);
        return resultMap;
    }

    @RequestMapping(value = "/addTeacher", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> addTeacher(String teacherId,String teacherPassword,String teacherName,int teacherSex,int teacherAge,int teacherTitle,int teacherCollege) {
        System.out.println("I hava got the infonation: "+teacherId+" "+teacherCollege);
        String result = "";
        Teacher teacher = new Teacher();
        teacher.setTeacherId(teacherId);
        teacher.setTeacherPassword(teacherPassword);
        teacher.setTeacherName(teacherName);
        teacher.setTeacherSex(teacherSex);
        teacher.setTeacherAge(teacherAge);
        teacher.setTeacherCollege(teacherCollege);
        teacher.setTeacherTitle(teacherTitle);
        teacher.setTeacherPhoto("default.jpg");
        teacher.setTeacherRole(0);
        teacherService.addTeacher(teacher);
        result = "success";
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("result", result);
        return resultMap;
    }

    @RequestMapping(value = "/updateTeacher", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> updateTeacher(String teacherId,String teacherPassword,String teacherName,int teacherSex,int teacherAge,int teacherTitle,int teacherCollege) {
        System.out.println("I hava got the infonation: "+teacherId+" "+teacherCollege);
        String result = "fail";
        Teacher teacher = new Teacher();
        teacher.setTeacherId(teacherId);
        teacher.setTeacherPassword(teacherPassword);
        teacher.setTeacherName(teacherName);
        teacher.setTeacherSex(teacherSex);
        teacher.setTeacherAge(teacherAge);
        teacher.setTeacherCollege(teacherCollege);
        teacher.setTeacherPhoto("default.jpg");
        teacher.setTeacherTitle(teacherTitle);
        teacher.setTeacherRole(0);
        teacherService.updateTeacher(teacher);
        result = "success";
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("result", result);
        return resultMap;
    }

    @RequestMapping(value = "/deleteTeacher", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> deleteTeacher(String teacherId) {
        String result = "";
        teacherService.deleteTeacher(teacherId);
        result = "success";
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("result", result);
        return resultMap;
    }

    @RequestMapping(value = "/addTeachersExcel", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> addTeachersExcel(@RequestParam MultipartFile teachersExcelUpload, HttpServletRequest request) {
        String result = "fail";
        try{
            if(teachersExcelUpload != null && !teachersExcelUpload.isEmpty()) {
                int errorRow = -1;
                List teachersArrayList = POIUtil.readExcel(teachersExcelUpload);
                for(int i=0;i<teachersArrayList.size();i++){
                    try {
                        String[] teachers = (String[]) teachersArrayList.get(i);
                        Teacher teacher = new Teacher();
                        teacher.setTeacherId(teachers[0]);
                        teacher.setTeacherPassword(teachers[1]);
                        teacher.setTeacherName(teachers[2]);
                        if (teachers[3].equals("男"))
                            teacher.setTeacherSex(0);
                        else if (teachers[3].equals("女"))
                            teacher.setTeacherSex(1);
                        else {
                            errorRow = i + 2;
                            break;
                        }
                        teacher.setTeacherAge(Integer.valueOf(teachers[4]));
                        if(teachers[5] == "讲师")
                            teacher.setTeacherTitle(0);
                        else if(teachers[5] == "副教授")
                            teacher.setTeacherTitle(1);
                        else if(teachers[5] == "教授")
                            teacher.setTeacherTitle(2);
                        else
                            errorRow = i+2;
                        List<College> collegeList = collegeService.getAllCollege();
                        errorRow = i + 2;
                        for (int j = 0; j < collegeList.size(); j++) {
                            College college = collegeList.get(j);
                            if (teachers[6].equals(college.getCollegeName())) {
                                teacher.setTeacherCollege(college.getCollegeId());
                                errorRow = -1;
                                break;
                            }
                        }
                        teacher.setTeacherRole(0);
                        teacher.setTeacherPhoto("default.jpg");
                        if(errorRow == -1)
                            teacherService.addTeacher(teacher);
                        else
                            break;
                    }catch (Exception e){
                        errorRow = i+2;
                        e.printStackTrace();
                    }
                }
                if(errorRow == -1)
                    result = "success";
                else
                    result = "第"+String.valueOf(errorRow)+"行发生了错误";
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        Map<String,Object> resultMap = new HashMap<String,Object>();
        resultMap.put("result",result);
        return resultMap;
    }

    @RequestMapping(value = "/updateState", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> updateState(String teacherId, int isChoice,int isNormol,int isExam) {
        String result = "";
        Teacher teacher = teacherService.getTeacher(teacherId);
        if(teacher.getTeacherRole() > 1){
            State state = new State();
            state.setId(0);
            state.setIsChoice(isChoice);
            state.setIsNormol(isNormol);
            state.setIsExam(isExam);
            stateService.updateState(state);
            result = "success";
        }
        else
            result = "fail";
        Map<String,Object> resultMap = new HashMap<String,Object>();
        resultMap.put("result",result);
        return resultMap;
    }

    @RequestMapping(value = "/getState", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> getState() {
        String result = "";
        State state = stateService.getState();
        result = JSON.toJSONString(state);
        Map<String,Object> resultMap = new HashMap<String,Object>();
        resultMap.put("result",result);
        return resultMap;
    }
}
