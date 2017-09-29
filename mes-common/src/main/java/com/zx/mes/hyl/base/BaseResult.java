package com.zx.mes.hyl.base;

/**
 * 统一返回结果类
 * Created by Administrator on 2017/9/29.
 */
public class BaseResult {
    //状态码 :1:成功  2:失败
    private int code;

    //状态信息
    private String messager;

    private Object obj=null;

    public BaseResult(int code, String messager, Object obj) {
        this.code = code;
        this.messager = messager;
        this.obj = obj;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMessager() {
        return messager;
    }

    public void setMessager(String messager) {
        this.messager = messager;
    }

    public Object getObj() {
        return obj;
    }

    public void setObj(Object obj) {
        this.obj = obj;
    }


}
