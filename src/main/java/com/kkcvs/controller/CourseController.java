package com.kkcvs.controller;

        import com.alibaba.fastjson.JSON;
        import com.alibaba.fastjson.JSONArray;
        import com.kkcvs.entity.*;
        import com.kkcvs.service.*;
        import com.kkcvs.util.POIUtil;
        import org.springframework.stereotype.Controller;
        import org.springframework.web.bind.annotation.RequestMapping;
        import org.springframework.web.bind.annotation.RequestMethod;
        import org.springframework.web.bind.annotation.RequestParam;
        import org.springframework.web.bind.annotation.ResponseBody;
        import org.springframework.web.multipart.MultipartFile;

        import javax.annotation.Resource;
        import javax.servlet.http.HttpServletRequest;
        import java.util.ArrayList;
        import java.util.HashMap;
        import java.util.List;
        import java.util.Map;

/**
 * Created by 14437 on 2017/5/30.
 */
@Controller
public class CourseController {
    @Resource
    CourseService courseService;
    @Resource
    CourseOpenService courseOpenService;
    @Resource
    CourseChoiceService courseChoiceService;
    @Resource
    TeacherService teacherService;
    @Resource
    CollegeService collegeService;
    @Resource
    StudentService studentService;

    @RequestMapping(value = "/getCourseById", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> getCourseById(String courseId) {
        System.out.println("courseId = "+courseId);
        String result = "";
        Course course = courseService.getCourse(courseId);
        if(course!=null){
            result = JSON.toJSONString(course);
        }
        else
            result = "none";
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("result", result);
        return resultMap;
    }

    @RequestMapping(value = "/getAllCourses", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> getAllCourses(String teacherId) {
        String result = "";
        Teacher teacher = teacherService.getTeacher(teacherId);
        if(teacher!=null && teacher.getTeacherRole() == 2){
            List<Course> courses = courseService.getAllCourse();
            result = JSONArray.toJSONString(courses);
        }
        else
            result = "error";
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("result", result);
        return resultMap;
    }

    @RequestMapping(value = "/getAllCourseOpens", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> getAllCourseOpens(String teacherId) {
        String result = "";
        Teacher teacher = teacherService.getTeacher(teacherId);
        if(teacher!=null && teacher.getTeacherRole() == 2){
            List<CourseOpen> courseOpens = courseOpenService.getAllCourseOpen();
            result = JSONArray.toJSONString(courseOpens);
        }
        else
            result = "error";
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("result", result);
        return resultMap;
    }

    @RequestMapping(value = "/getAllCourseChoices", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> getAllCourseChoices(String teacherId) {
        String result = "";
        Teacher teacher = teacherService.getTeacher(teacherId);
        if(teacher!=null && teacher.getTeacherRole() == 2){
            List<CourseChoice> courseChoices = courseChoiceService.getAllCourseChoice();
            result = JSONArray.toJSONString(courseChoices);
        }
        else
            result = "error";
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("result", result);
        return resultMap;
    }

    @RequestMapping(value = "/addCourse", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> addCourse(String courseId,String courseName,int courseScore,int courseTime,int courseCollege) {
        System.out.println(courseId+" "+courseName);
        String result = "";
        Course course = courseService.getCourse(courseId);
        if(course == null){
            Course course1 = new Course();
            course1.setCourseId(courseId);
            course1.setCourseName(courseName);
            course1.setCourseScore(courseScore);
            course1.setCourseTime(courseTime);
            course1.setCourseCollege(courseCollege);
            courseService.addCourse(course1);
            result = "success";
        }
        else
            result = "exist";
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("result", result);
        return resultMap;
    }

    @RequestMapping(value = "/addCoursesExcel", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> addCoursesExcel(@RequestParam MultipartFile coursesExcelUpload, HttpServletRequest request) {
        String result = "fail";
        try{
            if(coursesExcelUpload != null && !coursesExcelUpload.isEmpty()) {
                int errorRow = -1;
                List coursesArrayList = POIUtil.readExcel(coursesExcelUpload);
                for(int i=0;i<coursesArrayList.size();i++){
                    try {
                        String[] courses = (String[]) coursesArrayList.get(i);
                        Course course = new Course();
                        course.setCourseId(courses[0]);
                        course.setCourseName(courses[1]);
                        course.setCourseScore(Integer.valueOf(courses[2]));
                        course.setCourseTime(Integer.valueOf(courses[3]));
                        List<College> collegeList = collegeService.getAllCollege();
                        errorRow = i + 2;
                        for (int j = 0; j < collegeList.size(); j++) {
                            College college = collegeList.get(j);
                            if (courses[4].equals(college.getCollegeName())) {
                                course.setCourseCollege(college.getCollegeId());
                                errorRow = -1;
                                break;
                            }
                        }
                        if(errorRow == -1)
                            courseService.addCourse(course);
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

    @RequestMapping(value = "/deleteCourse", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> deleteCourse(String courseId) {
        String result = "";
        courseService.deleteCourse(courseId);
        result = "success";
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("result", result);
        return resultMap;
    }

    @RequestMapping(value = "/updateCourse", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> updateCourse(String courseId,String courseName,int courseScore,int courseTime,int courseCollege) {
        String result = "";
        Course course = courseService.getCourse(courseId);
        if(course!=null){
            course.setCourseName(courseName);
            course.setCourseScore(courseScore);
            course.setCourseTime(courseTime);
            course.setCourseCollege(courseCollege);
            courseService.updateCourse(course);
            result = "success";
        }
        else
            result = "error";
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("result", result);
        return resultMap;
    }

    @RequestMapping(value = "/addCourseOpen", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> addCourseOpen(String courseId,String courseTerm,String courseTeacher,int courseLimitNumber,String courseTime,String coursePlace,String courseAnswerTime,String courseAnswerPlace) {
        String result = "";
        CourseOpen courseOpen = courseOpenService.getCourseOpen(courseId,courseTerm,courseTeacher);
        if(courseOpen == null){
            CourseOpen courseOpen1 = new CourseOpen();
            courseOpen1.setCourseId(courseId);
            courseOpen1.setCourseTerm(courseTerm);
            courseOpen1.setCourseTeacher(courseTeacher);
            courseOpen1.setCourseLimitNumber(courseLimitNumber);
            courseOpen1.setCourseChoiceNumber(0);
            courseOpen1.setCourseTime(courseTime);
            courseOpen1.setCoursePlace(coursePlace);
            courseOpen1.setCourseAnswerTime(courseAnswerTime);
            courseOpen1.setCourseAnswerPlace(courseAnswerPlace);
            courseOpenService.addCourseOpen(courseOpen1);
            result = "success";
        }
        else
            result = "exist";
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("result", result);
        return resultMap;
    }

    @RequestMapping(value = "/getCourseOpenById", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> getCourseOpenById(String courseId,String courseTerm,String courseTeacher) {
        String result = "";
        CourseOpen courseOpen = courseOpenService.getCourseOpen(courseId,courseTerm,courseTeacher);
        if(courseOpen!=null){
            result = JSON.toJSONString(courseOpen);
        }
        else
            result = "none";
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("result", result);
        return resultMap;
    }

    @RequestMapping(value = "/updateCourseOpen", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> updateCourseOpen(String courseId,String courseTerm,String courseTeacher,int courseLimitNumber,String courseTime,String coursePlace,String courseAnswerTime,String courseAnswerPlace) {
        String result = "";
        CourseOpen courseOpen = courseOpenService.getCourseOpen(courseId,courseTerm,courseTeacher);
        if(courseOpen!=null){
            courseOpen.setCourseLimitNumber(courseLimitNumber);
            courseOpen.setCourseTime(courseTime);
            courseOpen.setCoursePlace(coursePlace);
            courseOpen.setCourseAnswerTime(courseAnswerTime);
            courseOpen.setCourseAnswerPlace(courseAnswerPlace);
            courseOpenService.updateCourseOpen(courseOpen);
            result = "success";
        }
        else
            result = "error";
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("result", result);
        return resultMap;
    }
    @RequestMapping(value = "/deleteCourseOpen", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> deleteCourseOpen(String courseId,String courseTerm,String courseTeacher) {
        String result = "";
        courseOpenService.deleteCourseOpen(courseId,courseTerm,courseTeacher);
        result = "success";
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("result", result);
        return resultMap;
    }

    @RequestMapping(value = "/addCourseOpensExcel", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> addCourseOpensExcel(@RequestParam MultipartFile courseOpensExcelUpload, HttpServletRequest request) {
        String result = "fail";
        try{
            if(courseOpensExcelUpload != null && !courseOpensExcelUpload.isEmpty()) {
                int errorRow = -1;
                List courseOpensArrayList = POIUtil.readExcel(courseOpensExcelUpload);
                for(int i=0;i<courseOpensArrayList.size();i++){
                    try {
                        String[] courseOpens = (String[]) courseOpensArrayList.get(i);
                        CourseOpen courseOpen = new CourseOpen();
                        courseOpen.setCourseId(courseOpens[0]);
                        courseOpen.setCourseTerm(courseOpens[1]);
                        courseOpen.setCourseTeacher(courseOpens[2]);
                        courseOpen.setCourseLimitNumber(Integer.valueOf(courseOpens[3]));
                        courseOpen.setCourseTime(courseOpens[4]);
                        courseOpen.setCoursePlace(courseOpens[5]);
                        courseOpen.setCourseAnswerTime(courseOpens[6]);
                        courseOpen.setCourseAnswerPlace(courseOpens[7]);
                        if(errorRow == -1)
                            courseOpenService.addCourseOpen(courseOpen);
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

    @RequestMapping(value = "/searchCourseOpen", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> searchCourseOpen(String courseId,String teacherId,String courseTime) {
        String result = "";
        List<CourseOpen> courseOpenList = courseOpenService.searchCourseOpens(courseId,teacherId,courseTime);
        result = JSONArray.toJSONString(courseOpenList);
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("result", result);
        return resultMap;
    }

    @RequestMapping(value = "/addChoiceCourse", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> addChoiceCourse(String studentId,String courseId,String courseTerm,String courseTeacher) {
        String result = "";
        CourseChoice courseChoice = courseChoiceService.getCourseChoice(studentId,courseId,courseTerm,courseTeacher);
        if(courseChoice == null){
            CourseChoice courseChoice1 = new CourseChoice();
            courseChoice1.setStudentId(studentId);
            courseChoice1.setCourseId(courseId);
            courseChoice1.setCourseTerm(courseTerm);
            courseChoice1.setCourseTeacher(courseTeacher);
            courseChoice1.setCourseNormalPercent(7);
            courseChoice1.setCourseDailyScore(0);
            courseChoice1.setCourseExamScore(0);
            courseChoice1.setCourseFinalScore(0);
            courseChoice1.setCourseGPA(0);
            courseChoiceService.addCourseChoice(courseChoice1);
            result = "success";
        }
        else
            result = "exist";
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("result", result);
        return resultMap;
    }
    @RequestMapping(value = "/deleteChoiceCourse", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> deleteChoiceCourse(String studentId,String courseId,String courseTerm,String courseTeacher) {
        String result = "";
        courseChoiceService.deleteCourseChoice(studentId,courseId,courseTerm,courseTeacher);
        result = "success";
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("result", result);
        return resultMap;
    }
    @RequestMapping(value = "/getStudentCourseChoices", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> getStudentCourseChoices(String studentId) {
        String result = "";
        List<CourseChoice> courseChoices = courseChoiceService.getAllCourseChoice();
        List<CourseChoice> studentCourseChoices = new ArrayList<>();
        for(int i=0;i<courseChoices.size();i++){
            CourseChoice courseChoice = (CourseChoice)courseChoices.get(i);
            if(courseChoice.getStudentId() == studentId || courseChoice.getStudentId().equals(studentId)){
                studentCourseChoices.add(courseChoice);
            }
        }
        result = JSONArray.toJSONString(studentCourseChoices);
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("result", result);
        return resultMap;
    }

    @RequestMapping(value = "/getTeacherCourse", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> getTeacherCourse(String teacherId) {
        String result = "";
        List<CourseOpen> courseOpens = courseOpenService.getAllCourseOpen();
        List<CourseOpen> teacherCourseOpen = new ArrayList<>();
        for(int i=0;i<courseOpens.size();i++){
            CourseOpen courseOpen = (CourseOpen)courseOpens.get(i);
            if(courseOpen.getCourseTeacher() == teacherId || courseOpen.getCourseTeacher().equals(teacherId)){
                teacherCourseOpen.add(courseOpen);
            }
        }
        result = JSONArray.toJSONString(teacherCourseOpen);
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("result", result);
        return resultMap;
    }

    @RequestMapping(value = "/getTeacherCourseStudent", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> getTeacherCourseStudent(String teacherId,String courseId) {
        String result = "";
        List<CourseChoice> courseChoices = courseChoiceService.getAllCourseChoice();
        List<CourseChoice> studentCourseChoices = new ArrayList<>();
        for(int i=0;i<courseChoices.size();i++){
            CourseChoice courseChoice = (CourseChoice)courseChoices.get(i);
            if((courseChoice.getCourseTeacher()==teacherId || courseChoice.getCourseTeacher().equals(teacherId))&&
                    (courseChoice.getCourseId() == courseId || courseChoice.getCourseId().equals(courseId))){
                studentCourseChoices.add(courseChoice);
            }
        }
        result = JSONArray.toJSONString(studentCourseChoices);
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("result", result);
        return resultMap;
    }

    @RequestMapping(value = "/inputScore", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> inputScore(String studentId,String courseId,String courseTerm,String courseTeacher,String dailyScore,String examScore) {
        String result = "";
        System.out.println("I am here "+studentId+" "+courseId+" "+courseTerm+" "+courseTeacher+" "+dailyScore+" "+examScore);
        CourseChoice courseChoice = courseChoiceService.getCourseChoice(studentId,courseId,courseTerm,courseTeacher);
        if(courseChoice!=null){
            courseChoice.setCourseDailyScore(Double.valueOf(dailyScore));
            courseChoice.setCourseExamScore(Double.valueOf(examScore));
            courseChoiceService.updateCourseChoice(courseChoice);
            result = "success";
        }
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("result", result);
        return resultMap;
    }
}
