package com.kkcvs.service;

import com.kkcvs.dao.CourseDao;
import com.kkcvs.entity.Course;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 14437 on 2017/4/15.
 */
@Service
public class CourseServiceImplement implements CourseService {

    @Autowired
    private CourseDao courseDao;

    @Override
    public Course getCourse(String courseId) {
        return courseDao.getCourse(courseId);
    }

    @Override
    public void addCourse(Course course) {
        courseDao.addCourse(course);
    }

    @Override
    public boolean deleteCourse(String course) {
        return courseDao.deleteCourse(course);
    }

    @Override
    public boolean updateCourse(Course course) {
        return courseDao.updateCourse(course);
    }

    @Override
    public List<Course> getAllCourse() {
        return courseDao.getAllCourse();
    }
}
