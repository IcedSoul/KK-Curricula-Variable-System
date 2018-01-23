package com.kkcvs.dao;

import com.kkcvs.entity.Teacher;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 14437 on 2017/3/29.
 */
@Repository
public class TeacherDaoImplement implements TeacherDao {

    @Resource
    private SessionFactory sessionFactory;

    @Override
    public Teacher getTeacher(String teacherId) {
        String hql = "from Teacher where teacherId=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter(0, teacherId);
        return (Teacher) query.uniqueResult();
    }

    @Override
    public void addTeacher(Teacher teacher) {
        sessionFactory.getCurrentSession().save(teacher);
    }

    @Override
    public boolean deleteTeacher(String teacherId) {
        String hql = "delete Teacher where teacherId=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter(0, teacherId);
        return query.executeUpdate() > 0;
    }

    @Override
    public boolean updateTeacher(Teacher teacher) {
        String hql = "update Teacher set teacherPassword=?,teacherName=?,teacherSex=?,teacherAge=?,teacherPhoto=?,teacherCollege=?,teacherTitle=?,teacherRole=? where teacherId=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter(0, teacher.getTeacherPassword());
        query.setParameter(1, teacher.getTeacherName());
        query.setParameter(2, teacher.getTeacherSex());
        query.setParameter(3, teacher.getTeacherAge());
        query.setParameter(4, teacher.getTeacherPhoto());
        query.setParameter(5, teacher.getTeacherCollege());
        query.setParameter(6, teacher.getTeacherTitle());
        query.setParameter(7, teacher.getTeacherRole());
        query.setParameter(8, teacher.getTeacherId());
        return query.executeUpdate() > 0;
    }

    @Override
    public List<Teacher> getAllTeacher() {
        String hql = "from Teacher";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        return query.list();
    }
}
