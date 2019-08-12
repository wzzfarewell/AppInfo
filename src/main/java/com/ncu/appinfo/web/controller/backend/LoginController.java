package com.ncu.appinfo.web.controller.backend;

import com.ncu.appinfo.entity.BackendUser;
import com.ncu.appinfo.global.Constant;
import com.ncu.appinfo.service.AdminService;
import com.ncu.appinfo.vo.UserVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * LoginController
 * 管理员登录有关的控制器
 * @author wzzfarewell
 * @date 2019/8/12
 **/
@Controller
@RequestMapping("/admin")
public class LoginController {

    private final AdminService adminService;

    @Autowired
    public LoginController(AdminService adminService){
        this.adminService = adminService;
    }

    @GetMapping("/home")
    public String index(){
        return "admin/index";
    }

    @GetMapping("/login")
    public String toLogin(Map<String, Object> map){
        map.put("userVo", new UserVo());
        return "admin/login";
    }

    @PostMapping("/login")
    public String login(@Valid UserVo userVo, BindingResult bindingResult, HttpSession session,
                        RedirectAttributes attributes){
        List<String> messages = new ArrayList<>();
        if(bindingResult.hasErrors()){
            for(FieldError error : bindingResult.getFieldErrors()){
                messages.add(error.getDefaultMessage());
            }
            attributes.addFlashAttribute("messages", messages);
            return "redirect:login";
        }
        BackendUser user = adminService.login(userVo.getUsername(), userVo.getPassword());
        if(user != null){
            session.setAttribute(Constant.CURRENT_USER, user);
            return "redirect:home";
        }else{
            messages.add("用户名密码有误，请重新输入！");
            attributes.addFlashAttribute("messages", messages);
            return "redirect:login";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session){
        BackendUser user = (BackendUser) session.getAttribute(Constant.CURRENT_USER);
        if(user != null){
            session.invalidate();
        }
        return "redirect:login";
    }
}
