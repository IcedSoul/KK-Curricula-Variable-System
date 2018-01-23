package com.kkcvs.service;

import com.kkcvs.dao.StudentDao;
import com.kkcvs.entity.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 14437 on 2017/3/30.
 */
@Service
public class StudentServiceImplement implements StudentService {

    @Autowired
    private StudentDao studentDao;

    @Override
    public Student getStudent(String studentId) {
        return studentDao.getStudent(studentId);
    }

    @Override
    public void addStudent(Student student) {
        studentDao.addStudent(student);
    }

    @Override
    public boolean deleteStudent(String studentId) {
        return studentDao.deleteStudent(studentId);
    }

    @Override
    public boolean updateStudent(Student student) {
        return studentDao.updateStudent(student);
    }

    @Override
    public List<Student> getAllStudent() {
        return studentDao.getAllStudent();
    }
}
