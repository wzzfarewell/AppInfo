package com.ncu.appinfo.config;

import com.ncu.appinfo.web.aspect.LogAspect;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;

/**
 * LogAspectConfig
 * 开启日志记录的Aspect切面支持
 * @author wzzap
 * @date 2019/8/1
 **/
@Configuration
@EnableAspectJAutoProxy(proxyTargetClass = true)
public class LogAspectConfig {

    @Bean
    public LogAspect logAspect(){
        return new LogAspect();
    }
}
