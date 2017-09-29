package com.zx.mes.hyl.base;

/**
 * Created by Administrator on 2017/9/29.
 */
public class UpmsResult extends BaseResult {

    public UpmsResult(UpmsResultConstant upmsResultConstant,Object object) {
        super(upmsResultConstant.getCode(),upmsResultConstant.getMessage(),object);
    }
}
