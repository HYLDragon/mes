package com.zx.mes.hyl.upms.service;

import com.zx.mes.hyl.upms.model.Tbugtype;

import java.util.List;


/**
 * 
 * @author 
 * 
 */
public interface BugTypeServiceI {

	/**
	 * 获得BUG类型列表
	 * 
	 * @return
	 */
	public List<Tbugtype> getBugTypeList();

}
