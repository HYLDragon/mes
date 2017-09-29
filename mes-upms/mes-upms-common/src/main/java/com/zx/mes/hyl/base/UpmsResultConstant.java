package com.zx.mes.hyl.base;

/**
 * upms 系统接口结果常量 枚举类
 *
 * Created by Administrator on 2017/9/29.
 */
public enum  UpmsResultConstant {

    FAILED(0,"FAILED"),

    SUCCESS(1,"SUCCESS"),

    INVALID_LENGTH(10001, "长度非法"),

    EMPTY_USERNAME(10101, "用户名不能为空"),

    EMPTY_PASSWORD(10102, "密码不能为空"),

    INVALID_USERNAME(10103, "用户名ID不存在"),

    INVALID_PASSWORD(10104, "密码错误"),

    INVALID_ACCOUNT(10105, "异常账号");

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    private int code;

    private String message;

    UpmsResultConstant(int code, String message) {
        this.code = code;
        this.message = message;
    }


}
