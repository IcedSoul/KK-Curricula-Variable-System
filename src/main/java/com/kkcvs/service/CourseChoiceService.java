package com.kkcvs.service;

import com.kkcvs.entity.CourseChoice;

import java.util.List;

/**
 * Created by 14437 on 2017/4/15.
 */
public interface CourseChoiceService {
    CourseChoice getCourseChoice(String studentId, String courseId, String courseTerm, String courseTeacher);

    void addCourseChoice(CourseChoice courseChoice);

    boolean deleteCourseChoice(String studentId,String courseId,String courseTerm,String courseTeacher);

    boolean updateCourseChoice(CourseChoice courseChoice);

    List<CourseChoice> getAllCourseChoice();
}
