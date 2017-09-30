package com.zx.mes.hyl.upms.rpc.service.impl;

import com.alibaba.dubbo.config.annotation.Service;

import com.zx.mes.hyl.upms.dao.ResourceTypeDaoI;
import com.zx.mes.hyl.upms.model.Tresourcetype;
import com.zx.mes.hyl.upms.pageModel.ResourceType;
import com.zx.mes.hyl.upms.service.ResourceTypeServiceI;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;


@Component
//@com.alibaba.dubbo.config.annotation.Service(interfaceClass = ResourceTypeServiceI.class,protocol = {"dubbo"},retries
//		= 0,version = "1.0")
@Service(version = "1.0")
public class ResourceTypeServiceImpl implements ResourceTypeServiceI {

	@Autowired
	private ResourceTypeDaoI resourceType;


	@Cacheable(value = "resourceTypeServiceCache", key = "'resourceTypeList'")
	public List<ResourceType> getResourceTypeList() {
		List<Tresourcetype> l = resourceType.find("from Tresourcetype t");
		List<ResourceType> rl = new ArrayList<ResourceType>();
		if (l != null && l.size() > 0) {
			for (Tresourcetype t : l) {
				ResourceType rt = new ResourceType();
				BeanUtils.copyProperties(t, rt);
				rl.add(rt);
			}
		}
		return rl;
	}

}
