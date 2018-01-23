package com.kkcvs.service;

import com.kkcvs.dao.CourseChoiceDao;
import com.kkcvs.entity.CourseChoice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 14437 on 2017/4/15.
 */
@Service
public class CouseChoiceServiceImplement implements CourseChoiceService {

    @Autowired
    private CourseChoiceDao courseChoiceDao;

    @Override
    public CourseChoice getCourseChoice(String studentId, String courseId, String courseTerm, String courseTeacher) {
        return courseChoiceDao.getCourseChoice(studentId,courseId,courseTerm,courseTeacher);
    }

    @Override
    public void addCourseChoice(CourseChoice courseChoice) {
        courseChoiceDao.addCourseChoice(courseChoice);
    }

    @Override
    public boolean deleteCourseChoice(String studentId, String courseId, String courseTerm, String courseTeacher) {
        return courseChoiceDao.deleteCourseChoice(studentId,courseId,courseTerm,courseTeacher);
    }

    @Override
    public boolean updateCourseChoice(CourseChoice courseChoice) {
        return courseChoiceDao.updateCourseChoice(courseChoice);
    }

    @Override
    public List<CourseChoice> getAllCourseChoice() {
        return courseChoiceDao.getAllCourseChoice();
    }
}
