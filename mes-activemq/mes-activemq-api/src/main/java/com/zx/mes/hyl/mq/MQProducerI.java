package com.zx.mes.hyl.mq;


import com.zx.mes.hyl.model.Mail;

/**
 * Created by Administrator on 2017/9/20.
 */
public interface MQProducerI {

    void sendMessage(final Mail mail);

}
