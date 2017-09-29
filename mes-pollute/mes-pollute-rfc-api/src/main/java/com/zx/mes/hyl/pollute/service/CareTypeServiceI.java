package com.zx.mes.hyl.pollute.service;

import com.zx.mes.hyl.pollute.model.TCaretype;

import java.util.List;

/**
 * Created by Administrator on 2017/8/23.
 */
public interface CareTypeServiceI {

    /*
    * 获取CareType列表
    * return list
    * */
    public List<TCaretype> getCareTypeList();
}
