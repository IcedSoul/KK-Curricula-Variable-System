package com.kkcvs.dao;

import com.kkcvs.entity.Course;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 14437 on 2017/4/14.
 */
@Repository
public class CourseDaoImplement implements CourseDao {

    @Resource
    private SessionFactory sessionFactory;

    @Override
    public Course getCourse(String courseId) {
        String hql = "from Course where courseId=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter(0, courseId);
        return (Course) query.uniqueResult();
    }

    @Override
    public void addCourse(Course course) {
        sessionFactory.getCurrentSession().save(course);
    }

    @Override
    public boolean deleteCourse(String courseId) {
        String hql = "delete Course where courseId=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter(0, courseId);
        return query.executeUpdate() > 0;
    }

    @Override
    public boolean updateCourse(Course course) {
        String hql = "update Course set courseName=?,courseScore=?,courseTime=?,courseCollege=? where courseId=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter(0, course.getCourseName());
        query.setParameter(1, course.getCourseScore());
        query.setParameter(2, course.getCourseTime());
        query.setParameter(3, course.getCourseCollege());
        query.setParameter(4, course.getCourseId());
        return query.executeUpdate() > 0;
    }

    @Override
    public List<Course> getAllCourse() {
        String hql = "from Course";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        return query.list();
    }
}
