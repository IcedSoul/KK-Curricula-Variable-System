package com.kkcvs.dao;

import com.kkcvs.entity.Student;

import java.util.List;

/**
 * Created by 14437 on 2017/3/29.
 */
public interface StudentDao {
    Student getStudent(String studentId);

    void addStudent(Student student);

    boolean deleteStudent(String studentId);

    boolean updateStudent(Student student);

    List<Student> getAllStudent();
}
