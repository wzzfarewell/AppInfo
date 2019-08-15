package com.ncu.appinfo.web.controller.backend;

import com.github.pagehelper.PageInfo;
import com.ncu.appinfo.entity.DevUser;
import com.ncu.appinfo.global.Constant;
import com.ncu.appinfo.service.AppService;
import com.ncu.appinfo.service.DevUserService;
import com.ncu.appinfo.vo.AppSearchVo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

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

    private final AppService appService;
    private final DevUserService devUserService;

    @Autowired
    public AdminController(AppService appService, DevUserService devUserService) {
        this.appService = appService;
        this.devUserService = devUserService;
    }

    // =====================================管理员审核APP=================================

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

    @GetMapping("/app/{id}")
    public String appDetail(@PathVariable Long id, Model model){
        model.addAttribute("appDetail", appService.getAppDetail(id));
        return "admin/app-detail";
    }

    @GetMapping("/app-check/{id}")
    public String appCheck(@PathVariable Long id, RedirectAttributes attributes, HttpServletRequest request){
        int resultCount = appService.checkedApp(id);
        if(resultCount > 0){
            attributes.addFlashAttribute("message", "操作成功！");
        }else{
            attributes.addFlashAttribute("message", "操作失败！");
        }
        return "redirect:" + request.getContextPath() + "/admin/app-manage";
    }

    @GetMapping("/app-uncheck/{id}")
    public String appUncheck(@PathVariable Long id, RedirectAttributes attributes, HttpServletRequest request){
        int resultCount = appService.uncheckedApp(id);
        if(resultCount > 0){
            attributes.addFlashAttribute("message", "操作成功！");
        }else{
            attributes.addFlashAttribute("message", "操作失败！");
        }
        return "redirect:" + request.getContextPath() + "/admin/app-manage";
    }

    @PostMapping("/name-search")
    public String nameSearch(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
                             @RequestParam(value = "pageSize", defaultValue = "8") int pageSize,
                             String appName, Model model){
        AppSearchVo searchVo = new AppSearchVo();
        searchVo.setAppName(appName);
        model.addAttribute("appSearchVo", searchVo);
        model.addAttribute("page", appService.listUncheckedApp(pageNum, pageSize, searchVo));
        return "admin/app-manage";
    }

    // =====================================管理员管理开发者=================================

    @PostMapping("/dev-user")
    @ResponseBody
    public PageInfo<DevUser> listDevUser(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
                                         @RequestParam(value = "pageSize", defaultValue = "8") int pageSize,
                                         String devName){
        return devUserService.listDevUser(pageNum, pageSize, devName);
    }

    @GetMapping("/dev/{id}")
    public String devInfo(@PathVariable Long id, Model model){
        model.addAttribute("devUser", devUserService.getByDevId(id));
        return "admin/dev-info";
    }

    @GetMapping("/dev-delete/{id}")
    public String deleteDevUser(@PathVariable Long id, Model model, HttpServletRequest request){
        int resultCount = devUserService.deleteDevById(id);
        if(resultCount > 0){
            model.addAttribute("message", "操作成功！");
        }else{
            model.addAttribute("message", "操作失败！");
        }
        return "forward:" + request.getContextPath() + "/admin/home";
    }

}
