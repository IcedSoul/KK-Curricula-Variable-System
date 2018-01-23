package com.kkcvs.entity;

import java.io.Serializable;

/**
 * Created by 14437 on 2017/4/14.
 */
public class CourseChoicePriKey implements Serializable{
    private String studentId;
    private String courseId;
    private String courseTerm;
    private String courseTeacher;

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public String getCourseId() {
        return courseId;
    }

    public void setCourseId(String courseId) {
        this.courseId = courseId;
    }

    public String getCourseTerm() {
        return courseTerm;
    }

    public void setCourseTerm(String courseTerm) {
        this.courseTerm = courseTerm;
    }

    public String getCourseTeacher() {
        return courseTeacher;
    }

    public void setCourseTeacher(String courseTeacher) {
        this.courseTeacher = courseTeacher;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof CourseChoicePriKey)) return false;

        CourseChoicePriKey that = (CourseChoicePriKey) o;

        if (!getStudentId().equals(that.getStudentId())) return false;
        if (!getCourseId().equals(that.getCourseId())) return false;
        if (!getCourseTerm().equals(that.getCourseTerm())) return false;
        return getCourseTeacher().equals(that.getCourseTeacher());

    }

    @Override
    public int hashCode() {
        int result = getStudentId().hashCode();
        result = 31 * result + getCourseId().hashCode();
        result = 31 * result + getCourseTerm().hashCode();
        result = 31 * result + getCourseTeacher().hashCode();
        return result;
    }
}
