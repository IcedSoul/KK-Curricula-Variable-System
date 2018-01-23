package com.kkcvs.dao;

import com.kkcvs.entity.State;

/**
 * Created by 14437 on 2017/5/31.
 */
public interface StateDao {
    State getState();
    boolean updateState(State state);
}
