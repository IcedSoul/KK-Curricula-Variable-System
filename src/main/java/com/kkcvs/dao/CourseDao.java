package com.kkcvs.dao;

import com.kkcvs.entity.Course;

import java.util.List;

/**
 * Created by 14437 on 2017/4/14.
 */
public interface CourseDao {
    Course getCourse(String courseId);

    void addCourse(Course course);

    boolean deleteCourse(String course);

    boolean updateCourse(Course course);

    List<Course> getAllCourse();
}
