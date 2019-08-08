package com.ncu.appinfo.vo;

import org.hibernate.validator.constraints.NotBlank;

import javax.validation.constraints.Size;

/**
 * UserVo
 *
 * @author wzzfarewell
 * @date 2019/8/7
 **/
public class UserVo {

    @NotBlank(message = "用户名不能为空")
    @Size(max = 64, message = "用户名不超过64个字符")
    private String username;

    @NotBlank(message = "密码不能为空")
    @Size(max = 16, min = 6, message = "密码长度应为6-16个字符")
    private String password;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
