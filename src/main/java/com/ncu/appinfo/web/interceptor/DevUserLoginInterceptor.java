package com.ncu.appinfo.web.interceptor;

import com.ncu.appinfo.entity.DevUser;
import com.ncu.appinfo.global.Constant;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DevUserLoginInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        DevUser user = (DevUser) request.getSession().getAttribute(Constant.CURRENT_USER);
        if(user != null){
            return true;
        }
        response.sendRedirect(request.getContextPath() + "/developer/login");
        return false;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
