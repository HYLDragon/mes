package com.zx.mes.hyl.pollute.service;


import com.zx.mes.hyl.pageModel.DataGrid;
import com.zx.mes.hyl.pageModel.PageHelper;
import com.zx.mes.hyl.pollute.pageModel.Care;

/**
 * Created by Administrator on 2017/8/23.
 */
public interface CareServiceI {

     void add(Care care);

     void edit(Care care);

     void delete(Care care);

     DataGrid datagrid(Care care, PageHelper ph);

     Care  get(String id);

     DataGrid propertyGrid();
}
