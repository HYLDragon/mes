package com.zx.mes.hyl.upms.entity;

import java.io.Serializable;

public class UpmsLog implements Serializable {
    /**
     * 编号
     *
     * @mbg.generated
     */
    private Integer logId;

    /**
     * 操作描述
     *
     * @mbg.generated
     */
    private String description;

    /**
     * 操作用户
     *
     * @mbg.generated
     */
    private String username;

    /**
     * 操作时间
     *
     * @mbg.generated
     */
    private Long startTime;

    /**
     * 消耗时间
     *
     * @mbg.generated
     */
    private Integer spendTime;

    /**
     * 根路径
     *
     * @mbg.generated
     */
    private String basePath;

    /**
     * URI
     *
     * @mbg.generated
     */
    private String uri;

    /**
     * URL
     *
     * @mbg.generated
     */
    private String url;

    /**
     * 请求类型
     *
     * @mbg.generated
     */
    private String method;

    /**
     * 用户标识
     *
     * @mbg.generated
     */
    private String userAgent;

    /**
     * IP地址
     *
     * @mbg.generated
     */
    private String ip;

    /**
     * 权限值
     *
     * @mbg.generated
     */
    private String permissions;

    private String parameter;

    private String result;

    private static final long serialVersionUID = 1L;

    public Integer getLogId() {
        return logId;
    }

    public void setLogId(Integer logId) {
        this.logId = logId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Long getStartTime() {
        return startTime;
    }

    public void setStartTime(Long startTime) {
        this.startTime = startTime;
    }

    public Integer getSpendTime() {
        return spendTime;
    }

    public void setSpendTime(Integer spendTime) {
        this.spendTime = spendTime;
    }

    public String getBasePath() {
        return basePath;
    }

    public void setBasePath(String basePath) {
        this.basePath = basePath;
    }

    public String getUri() {
        return uri;
    }

    public void setUri(String uri) {
        this.uri = uri;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getMethod() {
        return method;
    }

    public void setMethod(String method) {
        this.method = method;
    }

    public String getUserAgent() {
        return userAgent;
    }

    public void setUserAgent(String userAgent) {
        this.userAgent = userAgent;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public String getPermissions() {
        return permissions;
    }

    public void setPermissions(String permissions) {
        this.permissions = permissions;
    }

    public String getParameter() {
        return parameter;
    }

    public void setParameter(String parameter) {
        this.parameter = parameter;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", logId=").append(logId);
        sb.append(", description=").append(description);
        sb.append(", username=").append(username);
        sb.append(", startTime=").append(startTime);
        sb.append(", spendTime=").append(spendTime);
        sb.append(", basePath=").append(basePath);
        sb.append(", uri=").append(uri);
        sb.append(", url=").append(url);
        sb.append(", method=").append(method);
        sb.append(", userAgent=").append(userAgent);
        sb.append(", ip=").append(ip);
        sb.append(", permissions=").append(permissions);
        sb.append(", parameter=").append(parameter);
        sb.append(", result=").append(result);
        sb.append("]");
        return sb.toString();
    }

}