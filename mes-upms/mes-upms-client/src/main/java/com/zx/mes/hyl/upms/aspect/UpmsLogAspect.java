package com.zx.mes.hyl.upms.aspect;

import com.alibaba.fastjson.JSON;
import com.zx.mes.hyl.upms.entity.UpmsLog;
import com.zx.mes.hyl.util.RequestUtil;
import io.swagger.annotations.ApiOperation;

import org.apache.log4j.Logger;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.reflect.MethodSignature;

import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;

/**
 * upms的log档
 *
 * Created by Administrator on 2017/9/30.
 */
public class UpmsLogAspect {

    private static final Logger logger=Logger.getLogger(UpmsLogAspect.class);

    @Before("execution(* *..controller..*.*(..))")
    public void doBeforeInServiceLayer(JoinPoint joinPoint){
        logger.debug(JSON.toJSONStringWithDateFormat("doBeforeInServiceLayer","yyyy-MM-dd HH:mm:ss"));
    }

    @After("execution(* *..controller..*.*(..))")
    public void doAfterInServiceLayer(JoinPoint joinPoint){
        logger.debug(JSON.toJSONStringWithDateFormat("doAfterInServiceLayer","yyyy-MM-dd HH:mm:ss"));
    }

    @Around("execution(* *..controller..*.*(..))")
    public Object doAround(ProceedingJoinPoint pjp) throws Throwable {

        //获取request
        RequestAttributes requestAttributes= RequestContextHolder.getRequestAttributes();
        ServletRequestAttributes servletRequestAttributes= (ServletRequestAttributes) requestAttributes;
        HttpServletRequest request=servletRequestAttributes.getRequest();

        UpmsLog upmsLog=new UpmsLog();

        Object result=pjp.proceed();
        Signature signature=pjp.getSignature();
        MethodSignature methodSignature= (MethodSignature) signature;
        Method method=methodSignature.getMethod();
        if (method.isAnnotationPresent(ApiOperation.class)){
            ApiOperation log=method.getAnnotation(ApiOperation.class);
            upmsLog.setDescription(log.value());
        }
        if (method.isAnnotationPresent(RequiresPermissions.class)){
            RequiresPermissions requiresPermissions=method.getAnnotation(RequiresPermissions.class);
            String[] permissions=requiresPermissions.value();
            if (permissions.length>0){
                upmsLog.setPermissions(permissions[0]);
            }
        }

        upmsLog.setBasePath(RequestUtil.getBasePath(request));
        upmsLog.setIp(RequestUtil.getIpAddr(request));
        upmsLog.setMethod(request.getMethod());
        if (request.getMethod().equalsIgnoreCase("GET")){
            upmsLog.setParameter(request.getQueryString());
        }else{
            upmsLog.setParameter(JSON.toJSONString(request.getRequestURI()));
        }
        upmsLog.setResult(JSON.toJSONString(request));
        upmsLog.setUri(request.getRequestURI());
        upmsLog.setUrl(JSON.toJSONString(request.getRequestURL()));
        upmsLog.setUserAgent(request.getHeader("User-Agent"));
        upmsLog.setUsername(JSON.toJSONString(request.getUserPrincipal()));

        logger.info(JSON.toJSONStringWithDateFormat(upmsLog,"yyyy-MM-dd HH:mm:ss"));

        return result;
    }
}
