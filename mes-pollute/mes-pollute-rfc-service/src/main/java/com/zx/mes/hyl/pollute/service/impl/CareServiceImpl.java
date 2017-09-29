package com.zx.mes.hyl.pollute.service.impl;

import com.zx.mes.hyl.pageModel.DataGrid;
import com.zx.mes.hyl.pageModel.PageHelper;
import com.zx.mes.hyl.pageModel.PropertyGrid;
import com.zx.mes.hyl.pollute.dao.CareDaoI;
import com.zx.mes.hyl.pollute.dao.CareTypeDaoI;
import com.zx.mes.hyl.pollute.model.TCare;
import com.zx.mes.hyl.pollute.model.TCaretype;
import com.zx.mes.hyl.pollute.pageModel.Care;
import com.zx.mes.hyl.pollute.service.CareServiceI;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.*;

/**
 * Created by Administrator on 2017/8/23.
 */
@Service
public class CareServiceImpl implements CareServiceI {

    @Autowired
    private CareDaoI careDao;

    @Autowired
    private CareTypeDaoI careTypeDao;


    public void add(Care care) {
        TCare tCare= new TCare();
        BeanUtils.copyProperties(care,tCare);
        //添加保养记录的时间
        tCare.setCreatedatetime((Timestamp) new Date());
        tCare.settCaretype(careTypeDao.get(TCaretype.class,care.getCareTypeId()));
        careDao.saveOrUpdate(tCare);
    }


    public void edit(Care care) {
        TCare tCare=new TCare();
        BeanUtils.copyProperties(care,tCare);

        tCare.setModifydatetime((Timestamp) new Date());
        tCare.settCaretype(careTypeDao.get(TCaretype.class,care.getCareTypeId()));
        careDao.update(tCare);
    }


    public void delete(Care care) {
        //careMapper.deleteByPrimaryKey(pcare.getId());
        TCare tCare=new TCare();
        BeanUtils.copyProperties(care,tCare);
        tCare.settCaretype(careTypeDao.get(TCaretype.class,care.getCareTypeId()));
        careDao.delete(tCare);
    }


    public DataGrid datagrid(Care care, PageHelper ph) {
        DataGrid datagrid=new DataGrid();


        List<Care> careList=new ArrayList<Care>();

        Map<String,Object> params=new HashMap<String, Object>();
        String hql = " from Care t ";
        String joinHql = " left join fetch t.tCaretype type ";

        List<TCare> tCareList=careDao.find(hql+joinHql+whereHql(care,params)+orderHql(ph),params);

        if (tCareList!=null && tCareList.size()>0){
            for (int i=0;i<tCareList.size();i++){
                Care c=new Care();
                BeanUtils.copyProperties(tCareList.get(i),c);
                c.setCareTypeId(tCareList.get(i).getId());
                c.setCareTypeName(tCareList.get(i).getName());
                careList.add(c);
            }
        }

        datagrid.setRows(careList);
        datagrid.setTotal(careDao.count("select count(*)"+hql+" left join  t.tCaretype type "+whereHql(care,params),
                params));

        return datagrid;
    }

    private String orderHql(PageHelper ph) {
        String orderString = "";
        if (ph.getSort() != null && ph.getOrder() != null) {
            orderString = " order by t." + ph.getSort() + " " + ph.getOrder();
        }
        return orderString;
    }

    private String whereHql(Care care, Map<String, Object> params) {
        String whereHql = "";
        if (care != null) {
            whereHql += " where 1=1 ";
            if (care.getName() != null) {
                whereHql += " and t.name like :name";
                params.put("name", "%%" + care.getName() + "%%");
            }
            if (care.getCreatedatetimeStart() != null) {
                whereHql += " and t.createdatetime >= :createdatetimeStart";
                params.put("createdatetimeStart", care.getCreatedatetimeStart());
            }
            if (care.getCreatedatetimeEnd() != null) {
                whereHql += " and t.createdatetime <= :createdatetimeEnd";
                params.put("createdatetimeEnd", care.getCreatedatetimeEnd());
            }
            if (care.getModifydatetimeStart() != null) {
                whereHql += " and t.modifydatetime >= :modifydatetimeStart";
                params.put("modifydatetimeStart", care.getModifydatetimeStart());
            }
            if (care.getModifydatetimeEnd() != null) {
                whereHql += " and t.modifydatetime <= :modifydatetimeEnd";
                params.put("modifydatetimeEnd", care.getModifydatetimeEnd());
            }
            if (care.getCareTypeId() != null && !care.getCareTypeId().trim().equals("")) {
                whereHql += " and type.id = :type ";
                params.put("type", care.getCareTypeId());
            }
        }
        return whereHql;
    }



    public Care get(String id) {
        Care care=new Care();

        TCare tCare=careDao.get(TCare.class,id);
        if (tCare!=null){
            BeanUtils.copyProperties(tCare,care);
            care.setCareTypeId(tCare.gettCaretype().getId());
            care.setCareTypeName(tCare.gettCaretype().getName());
        }
        return care;
    }


    public DataGrid propertyGrid() {
        DataGrid datagrid=new DataGrid();
        List<PropertyGrid> propertyGridList=new ArrayList<PropertyGrid>(5);
        PropertyGrid propertyGrid=new PropertyGrid();

        Map<String,Object> params=new HashMap<String,Object>();
        //care.setCaretypeId("0");//VP香片更换
        String hql = " from Care t ";
        String joinHql = " left join  t.tCaretype type where type.id= :type order by t.createdatetime desc";
        params.put("type","0");
        propertyGrid.setName("上一次更换时间");
        propertyGrid.setValue(careDao.find(hql+joinHql,params,1,1).get(0).getCreatedatetime().toString());
        propertyGrid.setName("下一次更换时间");
        propertyGrid.setValue("等待重设");
        propertyGrid.setGroup("VP香片更换");
        propertyGridList.add(propertyGrid);

        params.remove("type");
        params.put("type","1");

        //care.setCaretypeId("1");//风机机油添加
        propertyGrid.setName("上一次更换时间");
        propertyGrid.setValue(careDao.find(hql+joinHql,params,1,1).get(0).getCreatedatetime().toString());
        propertyGrid.setName("下一次更换时间");
        propertyGrid.setValue("等待重设");
        propertyGrid.setGroup("风机机油添加");
        propertyGridList.add(propertyGrid);

        params.remove("type");
        params.put("type","2");
        //care.setCaretypeId("2");//除尘设备滤网更换
        propertyGrid.setName("上一次更换时间");
        propertyGrid.setValue(careDao.find(hql+joinHql,params,1,1).get(0).getCreatedatetime().toString());
        propertyGrid.setName("下一次更换时间");
        propertyGrid.setValue("等待重设");
        propertyGrid.setGroup("除尘设备滤网更换");
        propertyGridList.add(propertyGrid);

        params.remove("type");
        params.put("type","3");
        //care.setCaretypeId("3");//除尘设备滤网更换
        propertyGrid.setName("上一次更换时间");
        propertyGrid.setValue(careDao.find(hql+joinHql,params,1,1).get(0).getCreatedatetime().toString());
        propertyGrid.setName("下一次更换时间");
        propertyGrid.setValue("等待重设");
        propertyGrid.setGroup("UV前置滤网更换");
        propertyGridList.add(propertyGrid);

        datagrid.setTotal((long) 4);
        datagrid.setRows(propertyGridList);

        return datagrid;
    }


}
