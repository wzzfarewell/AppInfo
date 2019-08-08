package com.ncu.appinfo.web.controller.backend;

import com.ncu.appinfo.entity.BackendUser;
import com.ncu.appinfo.global.Constant;
import com.ncu.appinfo.service.AdminService;
import com.ncu.appinfo.service.AppService;
import com.ncu.appinfo.vo.AppSearchVo;
import com.ncu.appinfo.vo.UserVo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * AdminController
 * 管理员后台控制器
 * @author wzzfarewell
 * @date 2019/8/6
 **/
@Controller
@RequestMapping("/admin")
public class AdminController {

    private static final Logger LOG = LoggerFactory.getLogger(AdminController.class);

    private final AdminService adminService;
    private final AppService appService;

    @Autowired
    public AdminController(AdminService adminService, AppService appService) {
        this.adminService = adminService;
        this.appService = appService;
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
//            session.removeAttribute(Constant.CURRENT_USER);
            session.invalidate();
        }
        return "redirect:login";
    }

    @ModelAttribute("appStatus")
    public List<String> listStatus(){
        return appService.listStatus(Constant.APP_STATUS);
    }
    @ModelAttribute("appPlatform")
    public List<String> listPlatform(){
        return appService.listStatus(Constant.APP_PLATFORM);
    }
    @ModelAttribute("firstCategory")
    public List<String> listFirstCategory(){
        return appService.listCategory(Constant.LEVEL1_CATEGORY);
    }
    @ModelAttribute("secondCategory")
    public List<String> listSecondCategory(){
        return appService.listCategory(Constant.LEVEL2_CATEGORY);
    }
    @ModelAttribute("thirdCategory")
    public List<String> listThirdCategory(){
        return appService.listCategory(Constant.LEVEL3_CATEGORY);
    }

    @GetMapping("/app-manage")
    public String appManage(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
                            @RequestParam(value = "pageSize", defaultValue = "8") int pageSize,
                            Model model){
        model.addAttribute("appSearchVo", new AppSearchVo());
        model.addAttribute("page", appService.listUncheckedApp(pageNum, pageSize, null));
        return "admin/app-manage";
    }

    @PostMapping("/search-app")
    public String searchApp(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
                                     @RequestParam(value = "pageSize", defaultValue = "8") int pageSize,
                                     AppSearchVo appSearchVo, Model model){
        model.addAttribute("appSearchVo", appSearchVo);
        model.addAttribute("page", appService.listUncheckedApp(pageNum, pageSize, appSearchVo));
        return "admin/app-manage";
    }

}
