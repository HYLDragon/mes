package com.zx.mes.hyl.pollute.service.impl;



import com.zx.mes.hyl.pollute.dao.CareTypeDaoI;
import com.zx.mes.hyl.pollute.model.TCaretype;
import com.zx.mes.hyl.pollute.service.CareTypeServiceI;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/8/23.
 */
@Service
public class CareTypeServiceImpl implements CareTypeServiceI {

    @Autowired
    private CareTypeDaoI careTypeDao;


    @Cacheable(value = "careTypeServiceCache", key = "'careTypeList'")
    public List<TCaretype> getCareTypeList() {
        return careTypeDao.find("from TCareType t");
    }
}
