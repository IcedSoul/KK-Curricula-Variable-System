package com.kkcvs.service;

import com.kkcvs.entity.CourseOpen;

import java.util.List;

/**
 * Created by 14437 on 2017/4/15.
 */
public interface CourseOpenService {
    CourseOpen getCourseOpen(String courseId, String courseTerm, String courseTeacher);

    void addCourseOpen(CourseOpen courseOpen);

    boolean deleteCourseOpen(String courseId,String courseTerm,String courseTeacher);

    boolean updateCourseOpen(CourseOpen courseOpen);

    List<CourseOpen> getAllCourseOpen();

    List<CourseOpen> searchCourseOpens(String courseId,String teacherId,String courseTime);
}
