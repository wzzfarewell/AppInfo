package com.ncu.appinfo.web.interceptor;

import com.ncu.appinfo.entity.BackendUser;
import com.ncu.appinfo.global.Constant;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * AdminLoginInterceptor
 * 管理员登录拦截器
 * @author wzzfarewell
 * @date 2019/8/6
 **/
public class AdminLoginInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
//        String url = request.getRequestURI();
//        if(url.toLowerCase().contains("login")){
//            return true;
//        }
        BackendUser user = (BackendUser) request.getSession().getAttribute(Constant.CURRENT_USER);
        if(user != null){
            return true;
        }
        response.sendRedirect(request.getContextPath() + "/admin/login");
        return false;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
