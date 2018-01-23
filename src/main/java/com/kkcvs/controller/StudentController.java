package com.kkcvs.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.kkcvs.entity.College;
import com.kkcvs.entity.Student;
import com.kkcvs.entity.Teacher;
import com.kkcvs.service.CollegeService;
import com.kkcvs.service.StudentService;
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
import java.io.File;
import java.util.*;

/**
 * Created by 14437 on 2017/4/22.
 */
@Controller
public class StudentController {
    @Resource
    StudentService studentService;
    @Resource
    TeacherService teacherService;
    @Resource
    CollegeService collegeService;

    @RequestMapping(value = "/getStudentById", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> getStudentById(String studentId) {
        String result = "";
        Student student = studentService.getStudent(studentId);
        result = JSON.toJSONString(student);
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("result", result);
        return resultMap;
    }

    @RequestMapping(value = "/getAllStudents", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> getAllStudents(String teacherId) {
        String result = "";
        Teacher teacher = teacherService.getTeacher(teacherId);
        if(teacher!=null){
            List<Student> students = studentService.getAllStudent();
            if(teacher.getTeacherRole() == 1){
                List<Student> collegeStudents = new ArrayList<>();
                for(int i=0;i<students.size();i++){
                    Student student = students.get(i);
                    if(teacher.getTeacherCollege() == student.getStudentCollege())
                        collegeStudents.add(student);
                }
                result = JSONArray.toJSONString(collegeStudents);
            }
            else if(teacher.getTeacherRole() == 2){
                result = JSONArray.toJSONString(students);
            }
        }
        else
            result = "error";
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("result", result);
        return resultMap;
    }

    @RequestMapping(value = "/addStudent", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> addStudent(String studentId,String studentPassword,String studentName,int studentSex,int studentAge,int studentNativePlace,int studentEntryYear,int studentCollege,String studentEmail) {
        System.out.println("I hava got the infonation: "+studentId+" "+studentCollege+" "+studentNativePlace);
        String result = "";
        Calendar now = Calendar.getInstance();
        int year = now.get(Calendar.YEAR);
        int month = now.get(Calendar.MONTH)+1;
        if(month<8) year=year-1;
        Student student = new Student();
        student.setStudentId(studentId);
        student.setStudentPassword(studentPassword);
        student.setStudentName(studentName);
        student.setStudentSex(studentSex);
        student.setStudentAge(studentAge);
        student.setStudentNativePlace(studentNativePlace);
        student.setStudentCollege(studentCollege);
        student.setStudentEnrollmentYear(String.valueOf(studentEntryYear));
        student.setStudentEmail(studentEmail);
        student.setStudentGrade(year-studentEntryYear+1);
        student.setStudentPhoto("default.jpg");
        studentService.addStudent(student);
        result = "success";
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("result", result);
        return resultMap;
    }

    @RequestMapping(value = "/updateStudent", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> updateStudent(String studentId,String studentPassword,String studentName,int studentSex,int studentAge,int studentNativePlace,int studentEntryYear,int studentCollege,String studentEmail) {
        System.out.println("I hava got the infonation: "+studentId+" "+studentCollege+" "+studentNativePlace);
        String result = "";
        Calendar now = Calendar.getInstance();
        int year = now.get(Calendar.YEAR);
        int month = now.get(Calendar.MONTH)+1;
        if(month<8) year=year-1;
        Student student = new Student();
        student.setStudentId(studentId);
        student.setStudentPassword(studentPassword);
        student.setStudentName(studentName);
        student.setStudentSex(studentSex);
        student.setStudentAge(studentAge);
        student.setStudentNativePlace(studentNativePlace);
        student.setStudentCollege(studentCollege);
        student.setStudentEnrollmentYear(String.valueOf(studentEntryYear));
        student.setStudentEmail(studentEmail);
        student.setStudentGrade(year-studentEntryYear+1);
        student.setStudentPhoto("default.jpg");
        studentService.updateStudent(student);
        result = "success";
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("result", result);
        return resultMap;
    }

    @RequestMapping(value = "/deleteStudent", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> deleteStudent(String studentId) {
        String result = "";
        studentService.deleteStudent(studentId);
        result = "success";
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("result", result);
        return resultMap;
    }

    @RequestMapping(value = "/addStudentsExcel", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> addStudentsExcel(@RequestParam MultipartFile studentsExcelUpload, HttpServletRequest request) {
        String result = "fail";
        try{
            if(studentsExcelUpload != null && !studentsExcelUpload.isEmpty()) {
//                String fileRealPath = request.getSession().getServletContext().getRealPath("/static/file");
//                String fileName = "studentsExcel.xlsx";
//                File fileFolder = new File(fileRealPath);
//                System.out.println("fileRealPath=" + fileRealPath+"/"+fileName);
//                if(!fileFolder.exists()){
//                    fileFolder.mkdirs();
//                }
//                File file = new File(fileFolder,fileName);
//                studentsExcelUpload.transferTo(file);
                int errorRow = -1;
                List studentsArrayList = POIUtil.readExcel(studentsExcelUpload);
                for(int i=0;i<studentsArrayList.size();i++){
                    try {
                        String[] students = (String[]) studentsArrayList.get(i);
                        System.out.println(students[0]+" "+students[1]+" "+students[2]+" "+students[3]+" "+students[4]+" "+students[5]+" "+students[6]+" "+students[7]+" "+students[8]+" ");
                        Student student = new Student();
                        student.setStudentId(students[0]);
                        student.setStudentPassword(students[1]);
                        student.setStudentName(students[2]);
                        if (students[3].equals("男"))
                            student.setStudentSex(0);
                        else if (students[3].equals("女"))
                            student.setStudentSex(1);
                        else {
                            errorRow = i + 2;
                            break;
                        }
                        student.setStudentAge(Integer.valueOf(students[4]));
                        student.setStudentNativePlace(CONSTANT.getProvinceIdByName(students[5]));
                        List<College> collegeList = collegeService.getAllCollege();
                        errorRow = i + 2;
                        for (int j = 0; j < collegeList.size(); j++) {
                            College college = collegeList.get(j);
                            //System.out.println(college.getCollegeId()+" "+college.getCollegeName());
                            //System.out.println(students[6]);
                            if (students[6].equals(college.getCollegeName())) {
                                student.setStudentCollege(college.getCollegeId());
                                errorRow = -1;
                                break;
                            }
                        }
                        //System.out.println(student.getStudentCollege());
                        switch (students[7]) {
                            case "大一":
                                student.setStudentGrade(1);
                                break;
                            case "大二":
                                student.setStudentGrade(2);
                                break;
                            case "大三":
                                student.setStudentGrade(3);
                                break;
                            case "大四":
                                student.setStudentGrade(4);
                                break;
                            default:
                                errorRow = i+2;
                        }
                        student.setStudentEnrollmentYear(students[8]);
                        student.setStudentEmail(students[9]);
                        student.setStudentPhoto("default.jpg");
                        if(errorRow == -1)
                            studentService.addStudent(student);
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
