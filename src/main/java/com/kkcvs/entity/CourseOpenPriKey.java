package com.kkcvs.entity;

import java.io.Serializable;

/**
 * Created by 14437 on 2017/4/14.
 */
public class CourseOpenPriKey implements Serializable {
    private String courseId;
    private String courseTerm;
    private String courseTeacher;

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
        if (!(o instanceof CourseOpenPriKey)) return false;

        CourseOpenPriKey that = (CourseOpenPriKey) o;

        if (!courseId.equals(that.courseId)) return false;
        if (!courseTerm.equals(that.courseTerm)) return false;
        return courseTeacher.equals(that.courseTeacher);

    }

    @Override
    public int hashCode() {
        int result = courseId.hashCode();
        result = 31 * result + courseTerm.hashCode();
        result = 31 * result + courseTeacher.hashCode();
        return result;
    }
}
