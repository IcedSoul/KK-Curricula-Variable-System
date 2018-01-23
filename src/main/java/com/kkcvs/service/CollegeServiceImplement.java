package com.kkcvs.service;

import com.kkcvs.dao.CollegeDao;
import com.kkcvs.entity.College;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 14437 on 2017/3/30.
 */
@Service
public class CollegeServiceImplement implements CollegeService{

    @Autowired
    private CollegeDao collegeDao;

    @Override
    public College getCollege(int collegeId) {
        return collegeDao.getCollege(collegeId);
    }

    @Override
    public void addCollege(College college) {
        collegeDao.addCollege(college);
    }

    @Override
    public boolean deleteCollege(int collegeId) {
        return collegeDao.deleteCollege(collegeId);
    }

    @Override
    public boolean updateCollege(College college) {
        return collegeDao.updateCollege(college);
    }

    @Override
    public List<College> getAllCollege() {
        return collegeDao.getAllCollege();
    }
}
