package com.kkcvs.dao;

import com.kkcvs.entity.College;

import java.util.List;

/**
 * Created by 14437 on 2017/3/30.
 */
public interface CollegeDao {
    College getCollege(int collegeId);

    void addCollege(College college);

    boolean deleteCollege(int collegeId);

    boolean updateCollege(College college);

    List<College> getAllCollege();
}
