package com.kkcvs.entity;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;


/**
 * Created by 14437 on 2017/3/29.
 */
@Entity
@Table(name="college")
public class College {
    private int collegeId;
    private String collegeName;
    private String collegeLeader;
    private String collegeCampus;
    @Id
    @GenericGenerator(name = "generator", strategy = "assigned")
    @GeneratedValue(generator = "generator")

    @Column(name="college_id")
    public int getCollegeId() {
        return collegeId;
    }

    public void setCollegeId(int collegeId) {
        this.collegeId = collegeId;
    }

    @Column(name="college_name")
    public String getCollegeName() {
        return collegeName;
    }

    public void setCollegeName(String collegeName) {
        this.collegeName = collegeName;
    }

    @Column(name="college_leader")
    public String getCollegeLeader() {
        return collegeLeader;
    }

    public void setCollegeLeader(String collegeLeader) {
        this.collegeLeader = collegeLeader;
    }

    @Column(name="college_campus")
    public String getCollegeCampus() {
        return collegeCampus;
    }

    public void setCollegeCampus(String collegeCampus) {
        this.collegeCampus = collegeCampus;
    }
}
