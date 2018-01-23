package com.kkcvs.entity;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

/**
 * Created by 14437 on 2017/4/14.
 */
@Entity
@Table(name="course")
public class Course {
    private String courseId;
    private String courseName;
    private int courseScore;
    private int courseTime;
    private int courseCollege;

    @Id
    @GenericGenerator(name = "generator", strategy = "assigned")
    @GeneratedValue(generator = "generator")

    @Column(name="course_id")
    public String getCourseId() {
        return courseId;
    }

    public void setCourseId(String courseId) {
        this.courseId = courseId;
    }

    @Column(name="course_name")
    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    @Column(name="course_score")
    public int getCourseScore() {
        return courseScore;
    }

    public void setCourseScore(int courseScore) {
        this.courseScore = courseScore;
    }

    @Column(name="course_time")
    public int getCourseTime() {
        return courseTime;
    }

    public void setCourseTime(int courseTime) {
        this.courseTime = courseTime;
    }

    @Column(name="course_college")
    public int getCourseCollege() {
        return courseCollege;
    }

    public void setCourseCollege(int courseCollege) {
        this.courseCollege = courseCollege;
    }
}
