package com.ncu.appinfo.web.controller.backend;

import com.ncu.appinfo.entity.BackendUser;
import com.ncu.appinfo.global.Constant;
import com.ncu.appinfo.service.AdminService;
import com.ncu.appinfo.vo.UserVo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Random;

/**
 * LoginController
 * 管理员登录有关的控制器
 * @author wzzfarewell
 * @date 2019/8/12
 **/
@Controller
@RequestMapping("/admin")
public class LoginController {
    private static final Logger LOG = LoggerFactory.getLogger(LoginController.class);

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

    @RequestMapping(value = "/authCode")
    public void getAuthCode(HttpServletRequest request, HttpServletResponse response,HttpSession session)
            throws IOException {
        int width = 63;
        int height = 37;
        Random random = new Random();
        //设置response头信息
        //禁止缓存
        response.setHeader("Pragma", "No-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);

        //生成缓冲区image类
        BufferedImage image = new BufferedImage(width, height, 1);
        //产生image类的Graphics用于绘制操作
        Graphics g = image.getGraphics();
        //Graphics类的样式
        g.setColor(this.getRandColor(200, 250));
        g.setFont(new Font("Times New Roman",0,28));
        g.fillRect(0, 0, width, height);
        //绘制干扰线
        for(int i=0;i<40;i++){
            g.setColor(this.getRandColor(130, 200));
            int x = random.nextInt(width);
            int y = random.nextInt(height);
            int x1 = random.nextInt(12);
            int y1 = random.nextInt(12);
            g.drawLine(x, y, x + x1, y + y1);
        }

        //绘制字符
        String strCode = "";
        for(int i=0;i<4;i++){
            String rand = String.valueOf(random.nextInt(10));
            strCode = strCode + rand;
            g.setColor(new Color(20+random.nextInt(110),20+random.nextInt(110),20+random.nextInt(110)));
            g.drawString(rand, 13*i+6, 28);
        }
        //将字符保存到session中用于前端的验证
        LOG.info("session中的验证码：" + strCode);
        session.setAttribute(Constant.CHECK_CODE, strCode);
        g.dispose();

        ImageIO.write(image, "JPEG", response.getOutputStream());
        response.getOutputStream().flush();

    }

    private Color getRandColor(int fc,int bc){
        Random random = new Random();
        if(fc>255) {
            fc = 255;
        }
        if(bc>255) {
            bc = 255;
        }
        int r = fc + random.nextInt(bc - fc);
        int g = fc + random.nextInt(bc - fc);
        int b = fc + random.nextInt(bc - fc);
        return new Color(r,g,b);
    }

    @PostMapping("/login")
    public String login(@Valid UserVo userVo, BindingResult bindingResult, String code, HttpSession session,
                        RedirectAttributes attributes){
        List<String> messages = new ArrayList<>();
        LOG.info("输入的验证码：" + code);
        if(!code.equals(session.getAttribute(Constant.CHECK_CODE))){
            messages.add("验证码输入不正确，请重新输入！");
            attributes.addFlashAttribute("messages", messages);
            return "redirect:login";
        }
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
