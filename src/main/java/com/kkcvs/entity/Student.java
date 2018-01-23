package com.kkcvs.entity;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;


/**
 * Created by 14437 on 2017/3/29.
 */
@Entity
@Table(name="student")
public class Student {
    private String studentId;
    private String studentPassword;
    private String studentName;
    private int studentSex;
    private int studentAge;
    private int studentNativePlace;
    private String studentPhoto;
    private int studentCollege;
    private int studentGrade;
    private String studentEnrollmentYear;
    private String studentEmail;

    @Id
    @GenericGenerator(name = "generator", strategy = "assigned")
    @GeneratedValue(generator = "generator")

    @Column(name="student_id")
    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    @Column(name="student_password")
    public String getStudentPassword() {
        return studentPassword;
    }

    public void setStudentPassword(String studentPassword) {
        this.studentPassword = studentPassword;
    }


    @Column(name="student_name")
    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    @Column(name="student_sex")
    public int getStudentSex() {
        return studentSex;
    }

    public void setStudentSex(int studentSex) {
        this.studentSex = studentSex;
    }

    @Column(name="student_age")
    public int getStudentAge() {
        return studentAge;
    }

    public void setStudentAge(int studentAge) {
        this.studentAge = studentAge;
    }

    @Column(name="student_native_place")
    public int getStudentNativePlace() {
        return studentNativePlace;
    }

    public void setStudentNativePlace(int studentNativePlace) {
        this.studentNativePlace = studentNativePlace;
    }

    @Column(name="student_photo")
    public String getStudentPhoto() {
        return studentPhoto;
    }

    public void setStudentPhoto(String studentPhoto) {
        this.studentPhoto = studentPhoto;
    }

    @Column(name="student_college")
    public int getStudentCollege() {
        return studentCollege;
    }

    public void setStudentCollege(int studentCollege) {
        this.studentCollege = studentCollege;
    }

    @Column(name="student_grade")
    public int getStudentGrade() {
        return studentGrade;
    }

    public void setStudentGrade(int studentGrade) {
        this.studentGrade = studentGrade;
    }

    @Column(name="student_enrollment_year")
    public String getStudentEnrollmentYear() {
        return studentEnrollmentYear;
    }

    public void setStudentEnrollmentYear(String studentEnrollmentYear) {
        this.studentEnrollmentYear = studentEnrollmentYear;
    }

    @Column(name="student_email")
    public String getStudentEmail() {
        return studentEmail;
    }

    public void setStudentEmail(String studentEmail) {
        this.studentEmail = studentEmail;
    }
}
