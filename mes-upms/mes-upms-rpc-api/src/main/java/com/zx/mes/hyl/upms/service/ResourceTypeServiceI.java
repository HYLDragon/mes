package com.zx.mes.hyl.upms.service;


import com.zx.mes.hyl.upms.pageModel.ResourceType;

import java.util.List;

/**
 * 资源类型服务
 * 
 * @author 
 * 
 */
public interface ResourceTypeServiceI {

	/**
	 * 获取资源类型
	 * 
	 * @return
	 */
	public List<ResourceType> getResourceTypeList();

}
