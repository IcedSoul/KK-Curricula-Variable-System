package com.kkcvs.service;

import com.kkcvs.entity.State;

/**
 * Created by 14437 on 2017/5/31.
 */
public interface StateService {
    State getState();
    boolean updateState(State state);
}
