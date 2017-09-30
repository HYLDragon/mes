package com.zx.mes.hyl.upms.rpc;

import com.alibaba.fastjson.JSON;
import org.apache.log4j.Logger;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * 服务启动类
 * Created by Administrator on 2017/9/30.
 */
public class UpmsRpcServiceApplication {

    private static final Logger logger=Logger.getLogger(UpmsRpcServiceApplication.class );

    public static void main(String[] args){
        logger.info(JSON.toJSONStringWithDateFormat(">>>>> mes-upms-rpc-service 正在启动 <<<<<","yyyy-MM-dd HH:mm:ss"));
        new ClassPathXmlApplicationContext("classpath:META-INF/spring/*.xml");
        logger.info(JSON.toJSONStringWithDateFormat(">>>>> mes-upms-rpc-service 启动完成 <<<<<","yyyy-MM-dd HH:mm:ss"));
    }
}
