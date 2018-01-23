package com.kkcvs.entity;

import javax.persistence.*;

/**
 * Created by 14437 on 2017/4/14.
 */
@Entity
@Table(name="course_open")
@IdClass(value=CourseOpenPriKey.class)
public class CourseOpen {
    private String courseId;
    private String courseTerm;
    private String courseTeacher;
    private int courseLimitNumber;
    private int courseChoiceNumber;
    private String courseTime;
    private String coursePlace;
    private String courseAnswerTime;
    private String courseAnswerPlace;

    @Id
    @Column(name="course_id")
    public String getCourseId() {
        return courseId;
    }

    public void setCourseId(String courseId) {
        this.courseId = courseId;
    }

    @Id
    @Column(name="course_term")
    public String getCourseTerm() {
        return courseTerm;
    }

    public void setCourseTerm(String courseTerm) {
        this.courseTerm = courseTerm;
    }

    @Id
    @Column(name="course_teacher")
    public String getCourseTeacher() {
        return courseTeacher;
    }

    public void setCourseTeacher(String courseTeacher) {
        this.courseTeacher = courseTeacher;
    }

    @Column(name="course_limit_number")
    public int getCourseLimitNumber() {
        return courseLimitNumber;
    }

    public void setCourseLimitNumber(int courseLimitNumber) {
        this.courseLimitNumber = courseLimitNumber;
    }

    @Column(name="course_choice_number")
    public int getCourseChoiceNumber() {
        return courseChoiceNumber;
    }

    public void setCourseChoiceNumber(int courseChoiceNumber) {
        this.courseChoiceNumber = courseChoiceNumber;
    }

    @Column(name="course_time")
    public String getCourseTime() {
        return courseTime;
    }

    public void setCourseTime(String courseTime) {
        this.courseTime = courseTime;
    }

    @Column(name="course_place")
    public String getCoursePlace() {
        return coursePlace;
    }

    public void setCoursePlace(String coursePlace) {
        this.coursePlace = coursePlace;
    }


    @Column(name="course_answer_time")
    public String getCourseAnswerTime() {
        return courseAnswerTime;
    }

    public void setCourseAnswerTime(String courseAnswerTime) {
        this.courseAnswerTime = courseAnswerTime;
    }

    @Column(name="course_answer_place")
    public String getCourseAnswerPlace() {
        return courseAnswerPlace;
    }

    public void setCourseAnswerPlace(String courseAnswerPlace) {
        this.courseAnswerPlace = courseAnswerPlace;
    }
}
