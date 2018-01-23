package com.kkcvs.service;

import com.kkcvs.dao.StateDao;
import com.kkcvs.entity.State;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by 14437 on 2017/5/31.
 */
@Service
public class StateServiceImplement implements StateService {
    @Autowired
    StateDao stateDao;
    @Override
    public State getState() {
        return stateDao.getState();
    }

    @Override
    public boolean updateState(State state) {
        return stateDao.updateState(state);
    }
}
