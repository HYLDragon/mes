package com.zx.mes.hyl.aspect;

import com.alibaba.dubbo.rpc.RpcContext;
import com.alibaba.fastjson.JSON;
import org.apache.log4j.Logger;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Before;

/**
 * Created by Administrator on 2017/9/29.
 * rpc提供者和消费者日志打印
 *
 * execution (* com.sample.service.impl..*.*(..))
 *  1、execution(): 表达式主体。
 *  2、第一个*号：表示返回类型，*号表示所有的类型。
 *  3、包名：表示需要拦截的包名，后面的两个句点表示当前包和当前包的所有子包，com.sample.service.impl包、子孙包下所有类的方法。
 *  4、第二个*号：表示类名，*号表示所有的类。
 *  5、*(..):最后这个星号表示方法名，*号表示所有的方法，后面括弧里面表示方法的参数，两个句点表示任何参数。
 */
public class RpcLogAspect {

    private static final Logger logger=Logger.getLogger(RpcLogAspect.class);

    @Before("execution(* *..rpc..*.*(..))")
    public void doBeforeInServiceLayer(JoinPoint joinPoint){
        logger.debug(JSON.toJSONStringWithDateFormat("doBeforeInServiceLayer","yyyy-MM-dd HH:mm:ss"));
    }

    @After("execution(* *..rpc..*.*(..))")
    public void doAfterInServiceLayer(JoinPoint joinPoint){
        logger.debug(JSON.toJSONStringWithDateFormat("doAfterInServiceLayer","yyyy-MM-dd HH:mm:ss"));
    }

    @Around("execution(* *..rpc..*.*(..))")
    public Object doAround(ProceedingJoinPoint pjp) throws Throwable {
        Object result=pjp.proceed();
        //是否是消费端
        boolean consumerSider= RpcContext.getContext().isConsumerSide();
        //获取最后一次提供方或调用的IP
        String ip=RpcContext.getContext().getRemoteHost();
        //服务url
        String rpcUrl=RpcContext.getContext().getUrl().getParameter("application");
        StringBuffer sb=new StringBuffer("是否为消费端={");
        sb.append(consumerSider);
        sb.append("} ip={");
        sb.append(ip);
        sb.append("} rpcUrl={");
        sb.append(rpcUrl);
        sb.append("}");
        logger.info(JSON.toJSONStringWithDateFormat(sb,"yyyy-MM-dd HH:mm:ss"));

        return result;
    }
}
