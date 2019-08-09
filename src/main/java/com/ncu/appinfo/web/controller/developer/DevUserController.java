package com.ncu.appinfo.web.controller.developer;

import com.ncu.appinfo.entity.DevUser;
import com.ncu.appinfo.global.Constant;
import com.ncu.appinfo.service.AppService;
import com.ncu.appinfo.service.DevUserService;
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

@Controller
@RequestMapping("/developer")
public class DevUserController {

    private static final Logger LOG = LoggerFactory.getLogger(DevUserService.class);


    @Autowired
    private final DevUserService devUserService;
    private final AppService appService;

    @Autowired
    public DevUserController(DevUserService devUserService, AppService appService) {
        this.devUserService = devUserService;
        this.appService = appService;
    }
    @GetMapping("/home")
    public String index(){
        return "developer/index";
    }

    @GetMapping("/login")
    public String toLogin(Map<String, Object> map){
        map.put("userVo", new UserVo());
        return "developer/login";
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
        DevUser user = devUserService.login(userVo.getUsername(), userVo.getPassword());
        if(user != null){
            session.setAttribute(Constant.CURRENT_USER, user);
            return "redirect:home";
        }else{
            messages.add("用户名密码有误，请重新输入！");
            attributes.addFlashAttribute("messages", messages);
            return "redirect:login";
        }
    }

    @GetMapping("/register")
    public String toRegister(Map<String, Object> map){
        map.put("DevUser",new DevUser());
        return "developer/register";
    }

    @PostMapping("/register")
    public String register(@Valid DevUser user, BindingResult bindingResult){
        if(bindingResult.hasErrors()){
            return "developer/register";
        }

        int result=devUserService.insert(user);
        if (result==1){
            return "redirect:login";
        } else {
           return "developer/register";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session){
        if ((DevUser)session.getAttribute(Constant.CURRENT_USER)!=null){
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


    @GetMapping("/app-list")
    public String appManage(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
                            @RequestParam(value = "pageSize", defaultValue = "8") int pageSize,
                            Model model){
        model.addAttribute("appSearchVo", new AppSearchVo());
        model.addAttribute("page", appService.listUncheckedApp(pageNum, pageSize, null));
        return "developer/app-list";
    }

    @PostMapping("/search-app")
    public String searchApp(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
                            @RequestParam(value = "pageSize", defaultValue = "8") int pageSize,
                            AppSearchVo appSearchVo, Model model){
        model.addAttribute("appSearchVo", appSearchVo);
        model.addAttribute("page", appService.listUncheckedApp(pageNum, pageSize, appSearchVo));
        return "developer/app-list";
    }

}