package com.kkcvs.entity;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

/**
 * Created by 14437 on 2017/5/31.
 */
@Entity
@Table(name="state")
public class State {
    private int id;
    private int isChoice;
    private int isNormol;
    private int isExam;

    @Id
    @GenericGenerator(name = "generator", strategy = "assigned")
    @GeneratedValue(generator = "generator")
    @Column(name="id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Column(name="is_choice")
    public int getIsChoice() {
        return isChoice;
    }

    public void setIsChoice(int isChoice) {
        this.isChoice = isChoice;
    }

    @Column(name="is_normol")
    public int getIsNormol() {
        return isNormol;
    }

    public void setIsNormol(int isNormol) {
        this.isNormol = isNormol;
    }

    @Column(name="is_exam")
    public int getIsExam() {
        return isExam;
    }

    public void setIsExam(int isExam) {
        this.isExam = isExam;
    }
}
