package com.kkcvs.dao;

import com.kkcvs.entity.Teacher;

import java.util.List;

/**
 * Created by 14437 on 2017/3/29.
 */
public interface TeacherDao {
    Teacher getTeacher(String teacherId);

    void addTeacher(Teacher teacher);

    boolean deleteTeacher(String teacherId);

    boolean updateTeacher(Teacher teacher);

    List<Teacher> getAllTeacher();
}
