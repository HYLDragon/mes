package com.zx.mes.hyl.test;

import com.zx.mes.hyl.model.Mail;
import com.zx.mes.hyl.mq.MQProducer;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * Created by Administrator on 2017/9/20.
 */
@ContextConfiguration(locations = {"classpath:spring.xml" })
@RunWith(SpringJUnit4ClassRunner.class)
public class Test {

    @Autowired
    private MQProducer mqProducer;

    @org.junit.Test
    public void test(){
        Mail mail = new Mail();
        mail.setTo("632105841@qq.com");
        mail.setSubject("异步发送邮件");
        mail.setContent("Hi,This is a message!");

        this.mqProducer.sendMessage(mail);
        System.out.println("发送成功..");
    }
}
