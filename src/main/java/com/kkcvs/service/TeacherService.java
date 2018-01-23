package com.kkcvs.service;

import com.kkcvs.entity.Teacher;

import java.util.List;

/**
 * Created by 14437 on 2017/3/30.
 */
public interface TeacherService {
    Teacher getTeacher(String teacherId);

    void addTeacher(Teacher teacher);

    boolean deleteTeacher(String teacherId);

    boolean updateTeacher(Teacher teacher);

    List<Teacher> getAllTeacher();
}
