package com.kkcvs.service;

import com.kkcvs.dao.TeacherDao;
import com.kkcvs.entity.Teacher;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 14437 on 2017/3/30.
 */
@Service
public class TeacherServiceImplement implements TeacherService {

    @Autowired
    private TeacherDao teacherDao;

    @Override
    public Teacher getTeacher(String teacherId) {
        return teacherDao.getTeacher(teacherId);
    }

    @Override
    public void addTeacher(Teacher teacher) {
        teacherDao.addTeacher(teacher);
    }

    @Override
    public boolean deleteTeacher(String teacherId) {
        return teacherDao.deleteTeacher(teacherId);
    }

    @Override
    public boolean updateTeacher(Teacher teacher) {
        return teacherDao.updateTeacher(teacher);
    }

    @Override
    public List<Teacher> getAllTeacher() {
        return teacherDao.getAllTeacher();
    }
}
