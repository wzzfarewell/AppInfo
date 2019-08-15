<%--
  Created by IntelliJ IDEA.
  User: wzzap
  Date: 2019/8/6
  Time: 16:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>APP开发者平台-登录</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="../../vendors/iconfonts/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="../../vendors/css/vendor.bundle.base.css">
    <!-- endinject -->
    <!-- plugin css for this page -->
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <link rel="stylesheet" href="../../css/style.css">
    <!-- endinject -->
    <link rel="shortcut icon" href="../../images/favicon.png" />
</head>

<body>
<div class="container-scroller">
    <div class="container-fluid page-body-wrapper full-page-wrapper">
        <div class="content-wrapper d-flex align-items-center auth">
            <div class="row w-100">
                <div class="col-lg-4 mx-auto">
                    <div class="auth-form-light text-left p-5">
                        <div class="brand-logo">
                            <img src="../../images/logo.svg">
                        </div>
                        <h4>欢迎进入开发人员登录界面</h4>
                        <h6 class="font-weight-light">请登录后继续操作</h6>
                        <form:form class="pt-3" action="${pageContext.request.contextPath}/developer/login" modelAttribute="userVo" method="post">
                            <div class="form-group">
                                <form:input type="text" name="username" path="username" class="form-control form-control-lg" placeholder="用户名"/>
                            </div>
                            <ul class="list-star" id="usernameVal" style="display: none;">
                                <li class="text-muted">用户名输入不合法,必须是2-16个字符</li>
                            </ul>
                            <div class="form-group">
                                <form:input type="password" name="password" path="password" class="form-control form-control-lg" id="exampleInputPassword1" placeholder="密码"/>
                            </div>
                            <ul class="list-star" id="passwordVal" style="display: none;">
                                <li class="text-muted">密码输入不合法</li>
                            </ul>
                            <div class="form-row">
                                <label for="" class="col-sm-3 col-form-label">验证码</label>
                                <div class="col-sm-5">
                                    <input type="text" name="code" class="form-control" placeholder="">
                                </div>
                                <div class="col-sm-4">
                                    <img id="checkCodeImg" src="/admin/authCode" onclick="changeImg();" alt="验证码">
                                </div>
                            </div>
                            <ul class="list-star">
                                <c:forEach items="${messages}" var="msg">
                                    <li class="text-muted">${msg}</li>
                                </c:forEach>
                            </ul>
                            <div class="mt-3">
                                <button type="submit" id="subBtn" class="btn btn-block btn-gradient-primary btn-lg font-weight-medium auth-form-btn">登录</button>
                            </div>
                        </form:form>
                            <div class="my-2 d-flex justify-content-between align-items-center">
                                <div class="form-check">
                                    <label class="form-check-label text-muted">
                                        <input type="checkbox" class="form-check-input">
                                        记住密码
                                    </label>
                                </div>
                                <a href="#" class="auth-link text-black">忘记密码？</a>
                            </div>
                            <div class="text-center mt-4 font-weight-light">
                              还没有账号? <a href="${pageContext.request.contextPath}/developer/register" class="text-primary">注册</a>
                            </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- content-wrapper ends -->
    </div>
    <!-- page-body-wrapper ends -->
</div>
<!-- container-scroller -->
<!-- plugins:js -->
<script src="../../vendors/js/vendor.bundle.base.js"></script>
<script src="../../vendors/js/vendor.bundle.addons.js"></script>
<!-- endinject -->
<!-- inject:js -->
<script src="../../js/off-canvas.js"></script>
<script src="../../js/misc.js"></script>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.2/dist/jquery.min.js"></script>
<script>
    $(function(){
        $("#subBtn").click(function(){
            return validateForm();
        });
        <%--$("#checkCodeImg").attr("src", "<%=request.getContextPath()%>" + "/admin/checkCodeImg")--%>
    });
    // 登录表单验证
    function validateForm(){
        var username = $("input[name='username']").val();
        var password = $("input[name='password']").val();
        var code = $("input[name='code']").val();
        if(username == ""){
            alert("用户名为空，请输入用户名!")
            return false;
        }
        if(password == ""){
            alert("密码为空，请输入密码!")
            return false;
        }
        if(code == ""){
            alert("验证码为空，请输入验证码!")
            return false;
        }
        var uPattern =  /^[\u4e00-\u9fff\w]{2,16}$/;
        var test1 = uPattern.test(username);
        var pPattern = /^[\w_-]{6,16}$/;
        var test2 = pPattern.test(password);
        if(!test1){
            $("#usernameVal").show();
        }else{
            $("#usernameVal").hide();
        }
        if(!test2){
            $("#passwordVal").show();
        }else{
            $("#passwordVal").hide();
        }
        if(test1 && test2){
            return true;
        }else{
            return false;
        }
    }

    function changeImg() {
        var imgSrc = $("#checkCodeImg");
        var src = imgSrc.attr("src");
        imgSrc.attr("src", chgUrl(src));
    }

    //为了使每次生成图片不一致，即不让浏览器读缓存，所以需要加上时间戳
    function chgUrl(url) {
        var timestamp = (new Date()).valueOf();
        url = url.substring(0, 15);
        if ((url.indexOf("&") >= 0)) {
            url = url + "×tamp=" + timestamp;
        } else {
            url = url + "?timestamp=" + timestamp;
        }
        return url;
    }
</script>

<!-- endinject -->
</body>

</html>

