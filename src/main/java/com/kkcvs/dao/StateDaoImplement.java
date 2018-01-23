package com.kkcvs.dao;

import com.kkcvs.entity.State;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;

/**
 * Created by 14437 on 2017/5/31.
 */
@Repository
public class StateDaoImplement implements StateDao {
    @Resource
    private SessionFactory sessionFactory;

    @Override
    public State getState() {
        String hql = "from State where id=0";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        return (State)query.uniqueResult();
    }

    @Override
    public boolean updateState(State state) {
        String hql = "update State set isChoice=?,isNormol=?,isExam=?  where id=0";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter(0, state.getIsChoice());
        query.setParameter(1, state.getIsNormol());
        query.setParameter(2, state.getIsExam());
        return query.executeUpdate() > 0;
    }
}
