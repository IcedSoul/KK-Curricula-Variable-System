package com.kkcvs.entity;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

/**
 * Created by 14437 on 2017/3/29.
 */
@Entity
@Table(name="teacher")
public class Teacher {
    private String teacherId;
    private String teacherPassword;
    private String teacherName;
    private int teacherSex;
    private int teacherAge;
    private String teacherPhoto;
    private int teacherTitle;
    private int teacherCollege;
    private int teacherRole;

    @Id
    @GenericGenerator(name = "generator", strategy = "assigned")
    @GeneratedValue(generator = "generator")

    @Column(name="teacher_id")
    public String getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(String teacherId) {
        this.teacherId = teacherId;
    }

    @Column(name="teacher_password")
    public String getTeacherPassword() {
        return teacherPassword;
    }

    public void setTeacherPassword(String teacherPassword) {
        this.teacherPassword = teacherPassword;
    }

    @Column(name="teacher_name")
    public String getTeacherName() {
        return teacherName;
    }

    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName;
    }

    @Column(name="teacher_sex")
    public int getTeacherSex() {
        return teacherSex;
    }

    public void setTeacherSex(int teacherSex) {
        this.teacherSex = teacherSex;
    }

    @Column(name="teacher_age")
    public int getTeacherAge() {
        return teacherAge;
    }

    public void setTeacherAge(int teacherAge) {
        this.teacherAge = teacherAge;
    }

    @Column(name="teacher_title")
    public int getTeacherTitle() {
        return teacherTitle;
    }

    public void setTeacherTitle(int teacherTitle) {
        this.teacherTitle = teacherTitle;
    }

    @Column(name="teacher_college")
    public int getTeacherCollege() {
        return teacherCollege;
    }

    public void setTeacherCollege(int teacherCollege) {
        this.teacherCollege = teacherCollege;
    }

    @Column(name="teacher_photo")
    public String getTeacherPhoto() {
        return teacherPhoto;
    }

    public void setTeacherPhoto(String teacherPhoto) {
        this.teacherPhoto = teacherPhoto;
    }

    @Column(name="teacher_role")
    public int getTeacherRole() {
        return teacherRole;
    }

    public void setTeacherRole(int teacherRole) {
        this.teacherRole = teacherRole;
    }

}
