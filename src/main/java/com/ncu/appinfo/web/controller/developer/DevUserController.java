package com.ncu.appinfo.web.controller.developer;

import com.ncu.appinfo.entity.DevUser;
import com.ncu.appinfo.entity.Version;
import com.ncu.appinfo.global.Constant;
import com.ncu.appinfo.service.AppService;
import com.ncu.appinfo.service.DevUserService;
import com.ncu.appinfo.service.VersionService;
import com.ncu.appinfo.vo.AppSearchVo;
import com.ncu.appinfo.vo.AppVersionVo;
import com.ncu.appinfo.vo.AppVo;
import com.ncu.appinfo.vo.UserVo;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.util.*;

@Controller
@RequestMapping("/developer")
public class DevUserController {

    private static final Logger LOG = LoggerFactory.getLogger(DevUserService.class);


    @Autowired
    private final DevUserService devUserService;
    private final AppService appService;
    private final VersionService versionService;

    @Autowired
    public DevUserController(DevUserService devUserService, AppService appService, VersionService versionService) {
        this.devUserService = devUserService;
        this.appService = appService;
        this.versionService=versionService;
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
        DevUser user = (DevUser) session.getAttribute(Constant.CURRENT_USER);
        if(user != null){
            session.removeAttribute(Constant.CURRENT_USER);
            session.invalidate();
        }
        return "redirect:home";
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
    public String appList(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
                            @RequestParam(value = "pageSize", defaultValue = "8") int pageSize,
                            HttpSession session,Model model){
        DevUser devUser=(DevUser)session.getAttribute("current_user");
        model.addAttribute("appSearchVo", new AppSearchVo());
        model.addAttribute("page", appService.listAppByDevUser(pageNum, pageSize, devUser.getId(),null));
        return "developer/app-list";
    }

    @PostMapping("/search-app")
    public String searchApp(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
                            @RequestParam(value = "pageSize", defaultValue = "8") int pageSize,
                            AppSearchVo appSearchVo, HttpSession session,Model model){
        DevUser devUser=(DevUser)session.getAttribute("current_user");
        model.addAttribute("appSearchVo", appSearchVo);
        model.addAttribute("page", appService.listAppByDevUser(pageNum, pageSize, devUser.getId(),appSearchVo));
        return "developer/app-list";
    }

    @GetMapping("/app-add")
    public String toAddApp(Map<String, Object> map){
        map.put("appVo", new AppVo());
        return "developer/app-add";
    }
    /**
     * 添加APP基础信息
     * @return
     */
    @PostMapping("/app-add")
    public String addApp(HttpServletRequest request ,@ModelAttribute("appVo")AppVo appVo, MultipartFile logoPic, BindingResult bindingResult) throws Exception {
        if (bindingResult.hasErrors()){
            return "developer/app-add";
        }
        // 图片上传
        // 设置图片名称，不能重复，可以使用uuid
        String picName = UUID.randomUUID().toString().replaceAll("-", "");
        // 获取文件名
        String oriName = logoPic.getOriginalFilename();
        // 获取图片后缀
        String extName = oriName.substring(oriName.lastIndexOf("."));

        String url = request.getSession().getServletContext().getRealPath("/upload");
        File fileUrl = new File(url);
        if(!fileUrl.exists()){
            fileUrl.mkdir();
        }
        String logoPicPath = url + "/" + picName + extName;

        // 开始上传
        logoPic.transferTo(new File(logoPicPath));

        appVo.setLogoPicPath("upload/"+ picName + extName);
        int result=appService.addAppDetail(appVo);
        System.out.println(result);
        return "redirect:app-list";
    }

    @GetMapping("/app-edit/{appId}")
    public String editApp(@PathVariable Long appId,Model model){
        AppVo appVo = appService.getAppVo(appId);
        model.addAttribute("appVo",appVo);
        return "developer/app-edit";
    }

    @RequestMapping("/app-update")
    public String updateApp(AppVo appVo) {
        appService.updateAppDetail(appVo);
        return "redirect:app-list";
    }

    @GetMapping("/app-check/{appId}")
    public String checkApp(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
                           @RequestParam(value = "pageSize", defaultValue = "8") int pageSize,
                           @PathVariable Long appId,
                           Model model){
        AppVo appVo = appService.getAppVo(appId);
        model.addAttribute("appVo",appVo);
        model.addAttribute("page", appService.listAppVersion(pageNum, pageSize, appId));
        return "developer/app-check";
    }

    @RequestMapping("/app-delete")
    @ResponseBody
    public String deleteApp(Long appId) {
        appService.deleteApp(appId);
        return "OK";
    }


    @GetMapping("/appVersion")
    public String appVersion(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
                                @RequestParam(value = "pageSize", defaultValue = "8") int pageSize,
                                @RequestParam(value = "appId") Long id,
                                @RequestParam(value = "method") int method,
                                Model model){
        model.addAttribute("page", appService.listAppVersion(pageNum, pageSize, id));
        model.addAttribute("appId",id);
        if (method==1){
            return "forward:addAppVersion";
        }
        if (method==2){
            return "forward:updateAppVersion";
        }
        return null;
    }

    @GetMapping("/addAppVersion")
    public String toAddAppVersion(Map<String, Object> map){
        map.put("appVersionVo", new AppVersionVo());
        return "developer/addAppVersion";
    }

    @PostMapping("/addAppVersion")
    public String addAppVersion(@Valid AppVersionVo appVersionVo,MultipartFile apk, BindingResult bindingResult , HttpServletRequest request) throws IOException {
        if (bindingResult.hasErrors()){
            return "developer/addAppVersion";
        }

        String contentType = apk.getContentType();

        if (contentType!=null && contentType.startsWith("application/vnd.android")) {

            ServletContext context = request.getServletContext();
            String realPath = context.getRealPath("/apk");//获取本地存储位置的绝对路径

            String filename = apk.getOriginalFilename();//获取上传时的文件名称
            appVersionVo.setApkFileName(filename);

            filename = UUID.randomUUID().toString()+"."+ FilenameUtils.getExtension(filename);//创建一个新的文件名称    getExtension(name):获取文件后缀名
            String downloadUrl = filename;
            appVersionVo.setDownloadUrl(downloadUrl);

            File f= new File(realPath, filename);
            apk.transferTo(f);//将上传的文件存储到指定位置

            int result = appService.addAppVersion(appVersionVo);
            System.out.println(result);
            return "redirect:app-list";
        }

        System.out.println("不是apk文件");
        return "developer/addAppVersion";

    }

    @GetMapping("/updateAppVersion")
    public String toUpdateAppVersion(Map<String, Object> map, HttpServletRequest request){
        map.put("appVersionVo", new AppVersionVo());
        return "developer/updateAppVersion";
    }

    @PostMapping("/updateAppVersion")
    public String updateAppVersion(@Valid AppVersionVo appVersionVo, BindingResult bindingResult){
        if (bindingResult.hasErrors()){
            return "developer/updateAppVersion";
        }
        int result=appService.updateAppVersion(appVersionVo);
        System.out.println(result);
        return "redirect:app-list";
    }

    @RequestMapping(value = "/download", method = RequestMethod.GET)
    public ResponseEntity<byte[]> download(HttpServletRequest request,@RequestParam("filename") String filename) throws IOException {
        String realPath = request.getServletContext().getRealPath("/apk");//获取下载文件的路径
        File file = new File(realPath, filename);//把下载文件构成一个文件处理   filename:前台传过来的文件名称

        HttpHeaders headers = new HttpHeaders();//设置头信息
        String downloadFileName = new String(filename.getBytes("UTF-8"), "UTF-8");//设置响应的文件名

        headers.setContentDispositionFormData("attachment", downloadFileName);
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);

        // MediaType:互联网媒介类型 contentType：具体请求中的媒体类型信息
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file), headers, HttpStatus.CREATED);
    }

    @GetMapping("/selectVersion/{id}")
    @ResponseBody
    public Version selectVersion(@PathVariable("id") Long id){
        return versionService.selectVersion(id);
    }

    @GetMapping("/putOn/{id}")
    @ResponseBody
    public Map<String, String> putOn(@PathVariable("id") Long id){
        System.out.println(appService.putOnApp(id));
        Map<String,String> result=new HashMap<>();
        result.put("appStatus","已上架");
        return result;
    }

    @GetMapping("/putOff/{id}")
    @ResponseBody
    public Map<String, String> putOff(@PathVariable("id") Long id){
        System.out.println(appService.putOffApp(id));
        Map<String,String> result=new HashMap<>();
        result.put("appStatus","已下架");
        return result;
    }

    @GetMapping("/deleteFile")
    public String delFile(@RequestParam("filename") String filename,@RequestParam("versionid") Long versionid, HttpServletRequest request) {
        String realPath = request.getServletContext().getRealPath("/apk");
        String filePath= realPath+"/"+filename;
        File delFile = new File(filePath);
        if(delFile.isFile() && delFile.exists()) {
            delFile.delete();
            System.out.println("删除文件成功");
        }else {
            System.out.println("没有该文件，删除失败");
        }
        int result= versionService.deleteApk(versionid);
        return "redirect:app-list";
    }

}
