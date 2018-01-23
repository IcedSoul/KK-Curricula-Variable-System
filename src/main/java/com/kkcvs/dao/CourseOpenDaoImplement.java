package com.kkcvs.dao;

import com.kkcvs.entity.CourseOpen;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 14437 on 2017/4/15.
 */
@Repository
public class CourseOpenDaoImplement implements CourseOpenDao{

    @Resource
    private SessionFactory sessionFactory;

    @Override
    public CourseOpen getCourseOpen(String courseId,String courseTerm,String courseTeacher) {
        String hql = "from CourseOpen where courseId=? and courseTerm=? and courseTeacher=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter(0, courseId);
        query.setParameter(1, courseTerm);
        query.setParameter(2, courseTeacher);
        return (CourseOpen) query.uniqueResult();
    }

    @Override
    public void addCourseOpen(CourseOpen courseOpen) {
        sessionFactory.getCurrentSession().save(courseOpen);
    }

    @Override
    public boolean deleteCourseOpen(String courseId,String courseTerm,String courseTeacher) {
        String hql = "delete CourseOpen where courseId=? and courseTerm=? and courseTeacher=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter(0, courseId);
        query.setParameter(1, courseTerm);
        query.setParameter(2, courseTeacher);
        return query.executeUpdate() > 0;
    }

    @Override
    public boolean updateCourseOpen(CourseOpen courseOpen) {
        String hql = "update CourseOpen set courseTime=?,coursePlace=?,courseAnswerTime=?,courseAnswerPlace=?,courseLimitNumber=? where courseId=? and courseTerm=? and courseTeacher=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter(0, courseOpen.getCourseTime());
        query.setParameter(1, courseOpen.getCoursePlace());
        query.setParameter(2, courseOpen.getCourseAnswerTime());
        query.setParameter(3, courseOpen.getCourseAnswerPlace());
        query.setParameter(4, courseOpen.getCourseLimitNumber());
        query.setParameter(5, courseOpen.getCourseId());
        query.setParameter(6, courseOpen.getCourseTerm());
        query.setParameter(7, courseOpen.getCourseTeacher());
        return query.executeUpdate() > 0;
    }

    @Override
    public List<CourseOpen> getAllCourseOpen() {
        String hql = "from CourseOpen";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        return query.list();
    }

    @Override
    public List<CourseOpen> searchCourseOpens(String courseId, String teacherId, String courseTime) {
        System.out.println(courseId+" --- ");
        String courseIds = "%"+courseId+"%";
        String teacherIds ="%"+teacherId+"%";
        String courseTimes = "%"+courseTime+"%";
        String hql = "from CourseOpen where courseId like ? and courseTeacher like ? and courseTime like ? ";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter(0,courseIds);
        query.setParameter(1,teacherIds);
        query.setParameter(2,courseTimes);
        return query.list();
    }
}
