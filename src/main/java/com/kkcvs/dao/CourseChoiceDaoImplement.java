package com.kkcvs.dao;

import com.kkcvs.entity.CourseChoice;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate4.SessionFactoryUtils;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

/**
 * Created by 14437 on 2017/4/15.
 */
@Repository
public class CourseChoiceDaoImplement implements CourseChoiceDao {

    @Resource
    private SessionFactory sessionFactory;

    @Override
    public CourseChoice getCourseChoice(String studentId, String courseId, String courseTerm, String courseTeacher) {
        String hql = "from CourseChoice where studentId = ? and courseId=? and courseTerm=? and courseTeacher=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter(0, studentId);
        query.setParameter(1, courseId);
        query.setParameter(2, courseTerm);
        query.setParameter(3, courseTeacher);
        return (CourseChoice) query.uniqueResult();
    }

    @Override
    public void addCourseChoice(CourseChoice courseChoice) {
        sessionFactory.getCurrentSession().save(courseChoice);
    }

    @Override
    public boolean deleteCourseChoice(String studentId, String courseId, String courseTerm, String courseTeacher) {
        String hql = "delete CourseChoice where studentId=? and courseId=? and courseTerm=? and courseTeacher=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter(0, studentId);
        query.setParameter(1, courseId);
        query.setParameter(2, courseTerm);
        query.setParameter(3, courseTeacher);
        return query.executeUpdate() > 0;
    }

    @Override
    public boolean updateCourseChoice(CourseChoice courseChoice) {
        String hql = "update CourseChoice set courseNormalPercent=?,courseDailyScore=?,courseExamScore=?,courseFinalScore=?,courseGPA=?,courseRanking=? where studentId=? and courseId=? and courseTerm=? and courseTeacher=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter(0, courseChoice.getCourseNormalPercent());
        query.setParameter(1, courseChoice.getCourseDailyScore());
        query.setParameter(2, courseChoice.getCourseExamScore());
        query.setParameter(3, courseChoice.getCourseFinalScore());
        query.setParameter(4, courseChoice.getCourseGPA());
        query.setParameter(5, courseChoice.getCourseRanking());
        query.setParameter(6, courseChoice.getStudentId());
        query.setParameter(7, courseChoice.getCourseId());
        query.setParameter(8, courseChoice.getCourseTerm());
        query.setParameter(9, courseChoice.getCourseTeacher());
        boolean temp = query.executeUpdate()>0;
//        try {
//            Connection connection= SessionFactoryUtils.getDataSource(sessionFactory).getConnection();
//            String sql = "{call autoScore()}";
//            CallableStatement cs = connection.prepareCall(sql);
//            cs.executeQuery();
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
        Session session =sessionFactory.getCurrentSession();
        SQLQuery query1 = session.createSQLQuery("{Call autoScore()}");
        query1.executeUpdate();
        return temp;
    }

    @Override
    public List<CourseChoice> getAllCourseChoice() {
        String hql = "from CourseChoice";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        return query.list();
    }
}
