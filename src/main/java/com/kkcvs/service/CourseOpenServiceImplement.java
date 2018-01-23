package com.kkcvs.service;

import com.kkcvs.dao.CourseOpenDao;
import com.kkcvs.entity.CourseOpen;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 14437 on 2017/4/15.
 */
@Service
public class CourseOpenServiceImplement implements CourseOpenService{

    @Autowired
    private CourseOpenDao courseOpenDao;

    @Override
    public CourseOpen getCourseOpen(String courseId, String courseTerm, String courseTeacher) {
        return courseOpenDao.getCourseOpen(courseId,courseTerm,courseTeacher);
    }

    @Override
    public void addCourseOpen(CourseOpen courseOpen) {
        courseOpenDao.addCourseOpen(courseOpen);
    }

    @Override
    public boolean deleteCourseOpen(String courseId, String courseTerm, String courseTeacher) {
        return courseOpenDao.deleteCourseOpen(courseId,courseTerm,courseTeacher);
    }

    @Override
    public boolean updateCourseOpen(CourseOpen courseOpen) {
        return courseOpenDao.updateCourseOpen(courseOpen);
    }

    @Override
    public List<CourseOpen> getAllCourseOpen() {
        return courseOpenDao.getAllCourseOpen();
    }

    @Override
    public List<CourseOpen> searchCourseOpens(String courseId, String teacherId, String courseTime) {
        return courseOpenDao.searchCourseOpens(courseId,teacherId,courseTime);
    }
}
