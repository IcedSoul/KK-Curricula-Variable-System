package com.kkcvs.dao;

import com.kkcvs.entity.Student;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 14437 on 2017/3/29.
 */
@Repository
public class StudentDaoImplement implements StudentDao {

    @Resource
    private SessionFactory sessionFactory;

    @Override
    public Student getStudent(String studentId) {
        String hql = "from Student where studentId=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter(0, studentId);
        return (Student) query.uniqueResult();
    }

    @Override
    public void addStudent(Student student) {
        sessionFactory.getCurrentSession().save(student);
    }

    @Override
    public boolean deleteStudent(String studentId) {
        String hql = "delete Student where studentId=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter(0, studentId);
        return query.executeUpdate() > 0;
    }

    @Override
    public boolean updateStudent(Student student) {
        String hql = "update Student set studentPassword=?,studentName=?,studentSex=?,studentAge=?,studentNativePlace=?,studentPhoto=?,studentCollege=?,studentGrade=?,studentEnrollmentYear=?,studentEmail=? where studentId=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter(0, student.getStudentPassword());
        query.setParameter(1, student.getStudentName());
        query.setParameter(2, student.getStudentSex());
        query.setParameter(3, student.getStudentAge());
        query.setParameter(4, student.getStudentNativePlace());
        query.setParameter(5, student.getStudentPhoto());
        query.setParameter(6, student.getStudentCollege());
        query.setParameter(7, student.getStudentGrade());
        query.setParameter(8, student.getStudentEnrollmentYear());
        query.setParameter(9, student.getStudentEmail());
        query.setParameter(10, student.getStudentId());
        return query.executeUpdate() > 0;
    }

    @Override
    public List<Student> getAllStudent() {
        String hql = "from Student";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        return query.list();
    }
}
