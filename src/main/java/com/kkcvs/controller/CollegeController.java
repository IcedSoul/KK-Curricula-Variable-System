package com.kkcvs.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.kkcvs.entity.College;
import com.kkcvs.entity.Student;
import com.kkcvs.entity.Teacher;
import com.kkcvs.service.CollegeService;
import com.kkcvs.service.TeacherService;
import com.kkcvs.util.CONSTANT;
import com.kkcvs.util.POIUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by 14437 on 2017/4/22.
 */
@Controller
public class CollegeController {
    @Resource
    CollegeService collegeService;
    @Resource
    TeacherService teacherService;

    @RequestMapping(value = "/getCollegeById", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> getCollegeById(int collegeId) {
        System.out.println("我到了这里"+collegeId);
        String result = "";
        College college = collegeService.getCollege(collegeId);
        if(college!=null){
            result = JSON.toJSONString(college);
        }
        else
            result = "none";
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("result", result);
        return resultMap;
    }

    @RequestMapping(value = "/getAllCollege", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> getAllCollege(String teacherId) {
        String result = "";
        Teacher teacher = teacherService.getTeacher(teacherId);
        if(teacher!=null){
            List<College> collegeList = collegeService.getAllCollege();
            if (collegeList != null) {
                result = JSONArray.toJSONString(collegeList);
            } else
                result = "none";
        }
        else
            result = "error";
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("result", result);
        return resultMap;
    }

    @RequestMapping(value = "/updateCollege", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> updateCollege(String collegeId,String collegeName,String collegeLeader,String collegeCampus) {
        System.out.println(collegeId+" "+collegeName);
        String result = "";
        College college = collegeService.getCollege(Integer.valueOf(collegeId));
        if(college!=null){
            college.setCollegeName(collegeName);
            college.setCollegeLeader(collegeLeader);
            college.setCollegeCampus(collegeCampus);
            collegeService.updateCollege(college);
            result = "success";
        }
        else
            result = "error";
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("result", result);
        return resultMap;
    }

    @RequestMapping(value = "/deleteCollege", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> deleteCollege(String collegeId) {
        String result = "";
        collegeService.deleteCollege(Integer.valueOf(collegeId));
        result = "success";
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("result", result);
        return resultMap;
    }

    @RequestMapping(value = "/addCollege", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> addCollege(String collegeId,String collegeName,String collegeLeader,String collegeCampus) {
        System.out.println(collegeId+" "+collegeName);
        String result = "";
        College college = collegeService.getCollege(Integer.valueOf(collegeId));
        if(college == null){
            College college1 = new College();
            college1.setCollegeId(Integer.valueOf(collegeId));
            college1.setCollegeName(collegeName);
            college1.setCollegeLeader(collegeLeader);
            college1.setCollegeCampus(collegeCampus);
            collegeService.addCollege(college1);
            result = "success";
        }
        else
            result = "exist";
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("result", result);
        return resultMap;
    }

    @RequestMapping(value = "/addCollegesExcel", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> addCollegesExcel(@RequestParam MultipartFile collegesExcelUpload, HttpServletRequest request) {
        String result = "fail";
        try{
            if(collegesExcelUpload != null && !collegesExcelUpload.isEmpty()) {
                int errorRow = -1;
                List collegesArrayList = POIUtil.readExcel(collegesExcelUpload);
                for(int i=0;i<collegesArrayList.size();i++){
                    try {
                        String[] colleges = (String[]) collegesArrayList.get(i);
                        College college = new College();
                        college.setCollegeId(Integer.valueOf(colleges[0]));
                        college.setCollegeName(colleges[1]);
                        college.setCollegeLeader(colleges[2]);
                        college.setCollegeCampus(colleges[3]);
                        if(errorRow == -1)
                            collegeService.addCollege(college);
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
}
