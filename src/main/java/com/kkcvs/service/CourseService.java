package com.kkcvs.service;

import com.kkcvs.entity.Course;

import java.util.List;

/**
 * Created by 14437 on 2017/4/15.
 */
public interface CourseService {
    Course getCourse(String courseId);

    void addCourse(Course course);

    boolean deleteCourse(String course);

    boolean updateCourse(Course course);

    List<Course> getAllCourse();
}
