package com.kkcvs.dao;

import com.kkcvs.entity.College;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 14437 on 2017/3/30.
 */
@Repository
public class CollegeDaoImplement implements CollegeDao {

    @Resource
    private SessionFactory sessionFactory;

    @Override
    public College getCollege(int collegeId) {
        String hql = "from College where collegeId=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter(0, collegeId);
        return (College) query.uniqueResult();
    }

    @Override
    public void addCollege(College college) {
        sessionFactory.getCurrentSession().save(college);
    }

    @Override
    public boolean deleteCollege(int collegeId) {
        String hql = "delete College where collegeId=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter(0, collegeId);
        return query.executeUpdate() > 0;
    }

    @Override
    public boolean updateCollege(College college) {
        //System.out.println("dao "+college.getCollegeId()+" "+college.getCollegeName()+" "+college.getCollegeCampus());
        String hql = "update College set collegeName=?,collegeLeader=?,collegeCampus=? where collegeId=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter(0, college.getCollegeName());
        query.setParameter(1, college.getCollegeLeader());
        query.setParameter(2, college.getCollegeCampus());
        query.setParameter(3, college.getCollegeId());
        return query.executeUpdate() > 0;
    }

    @Override
    public List<College> getAllCollege() {
        String hql = "from College";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        return query.list();
    }
}
