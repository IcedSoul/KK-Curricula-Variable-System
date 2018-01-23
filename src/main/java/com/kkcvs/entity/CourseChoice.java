package com.kkcvs.entity;

import javax.persistence.*;

/**
 * Created by 14437 on 2017/4/14.
 */
@Entity
@Table(name="course_choice")
@IdClass(value=CourseChoicePriKey.class)
public class CourseChoice{
    private String studentId;
    private String courseId;
    private String courseTerm;
    private String courseTeacher;
    private int courseRanking;
    private int courseNormalPercent;
    private double courseDailyScore;
    private double courseExamScore;
    private double courseFinalScore;
    private double courseGPA;

    @Id
    @Column(name="student_id")
    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

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

    @Column(name="course_ranking")
    public int getCourseRanking() {
        return courseRanking;
    }

    public void setCourseRanking(int courseRanking) {
        this.courseRanking = courseRanking;
    }

    @Column(name="course_normal_percent")
    public int getCourseNormalPercent() {
        return courseNormalPercent;
    }

    public void setCourseNormalPercent(int courseNormalPercent) {
        this.courseNormalPercent = courseNormalPercent;
    }

    @Column(name="course_daily_score")
    public double getCourseDailyScore() {
        return courseDailyScore;
    }

    public void setCourseDailyScore(double courseDailyScore) {
        this.courseDailyScore = courseDailyScore;
    }

    @Column(name="course_exam_score")
    public double getCourseExamScore() {
        return courseExamScore;
    }

    public void setCourseExamScore(double courseExamScore) {
        this.courseExamScore = courseExamScore;
    }

    @Column(name="course_final_score")
    public double getCourseFinalScore() {
        return courseFinalScore;
    }

    public void setCourseFinalScore(double courseFinalScore) {
        this.courseFinalScore = courseFinalScore;
    }

    @Column(name="course_gpa")
    public double getCourseGPA() {
        return courseGPA;
    }

    public void setCourseGPA(double courseGPA) {
        this.courseGPA = courseGPA;
    }
}
