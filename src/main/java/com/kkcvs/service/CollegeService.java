package com.kkcvs.service;

import com.kkcvs.entity.College;

import java.util.List;

/**
 * Created by 14437 on 2017/3/30.
 */
public interface CollegeService {
    College getCollege(int collegeId);

    void addCollege(College college);

    boolean deleteCollege(int collegeId);

    boolean updateCollege(College college);

    List<College> getAllCollege();
}
