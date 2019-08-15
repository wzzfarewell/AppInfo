<%--
  Created by IntelliJ IDEA.
  User: Sean
  Date: 2019/8/8
  Time: 16:25
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
    <title>APP开发者平台-注册</title>
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
                        <h4>新来的?</h4>
                        <h6 class="font-weight-light">简单几步轻松注册.</h6>
                        <form:form class="pt-3" action="${pageContext.request.contextPath}/developer/register" modelAttribute="DevUser" method="post">
                            <div class="form-group">
                                <form:input path="devName" type="text" class="form-control form-control-lg" id="devName" placeholder="用户名"/>
                            </div>
                            <ul class="list-star" id="usernameVal" style="display: none;">
                                <li class="text-muted">用户名输入不合法</li>
                            </ul>
                            <div class="form-group">
                                <form:input path="devEmail" type="email" class="form-control form-control-lg" id="exampleInputEmail1" placeholder="Email"/>
                            </div>
                            <ul class="list-star" id="emailVal" style="display: none;">
                                <li class="text-muted">Email输入不合法</li>
                            </ul>
                            <div class="form-group">
                                <form:input path="devPassword" type="password" class="form-control form-control-lg" id="exampleInputPassword1" placeholder="密码"/>
                            </div>
                            <ul class="list-star" id="passwordVal" style="display: none;">
                                <li class="text-muted">密码输入不合法</li>
                            </ul>
                            <div class="form-group">
                                <form:input path="devInfo" type="text" class="form-control form-control-lg" id="exampleInput1" placeholder="个人简介"/>
                            </div>

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

                            <div class="mb-4">
                                <div class="form-check">
                                    <label class="form-check-label text-muted">
                                        <input id="agree" type="checkbox" class="form-check-input">
                                        我同意条约
                                    </label>
                                </div>
                            </div>
                            <div class="mt-3">
                                <button type="submit" disabled class="btn btn-block btn-gradient-primary btn-lg font-weight-medium auth-form-btn">注册</button>
                            </div>
                            <div class="text-center mt-4 font-weight-light">
                                已经有账号了? <a href="${pageContext.request.contextPath}/developer/login" class="text-primary">去登录</a>
                            </div>
                        </form:form>
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
<!-- endinject -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.2/dist/jquery.min.js"></script>

<script>
    $(function () {
        $("#agree").click(function(){
            if ($(this).is(":checked")) {
                $(":submit").removeAttr("disabled");
            }
            else {
                $(":submit").attr("disabled","disabled");
            }
        });

        $(":submit").click(function () {
            var devName = $("#devName").val();
            var devEmail = $("input[type='email']").val();
            var devPassword = $("input[type='password']").val();
            var code = $("input[name='code']").val();

            if(devName == ""){
                alert("用户名为空，请输入用户名!")
                return false;
            }
            if(devEmail == ""){
                alert("邮箱为空，请输入邮箱!")
                return false;
            }
            if(devPassword == ""){
                alert("密码为空，请输入密码!")
                return false;
            }
            if(code == ""){
                alert("验证码为空，请输入验证码!")
                return false;
            }
            var uPattern =  /^[\u4e00-\u9fff\w]{2,16}$/;
            var test1 = uPattern.test(devName);
            var pPattern = /^[\w_-]{6,16}$/;
            var test2 = pPattern.test(devPassword);
            var ePattern = /^(\w)+(\.\w+)*@(\w)+((\.\w{2,3}){1,3})$/;
            var test3 = ePattern.test(devEmail);
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
            if(!test3){
                $("#emailVal").show();
            }else{
                $("#emailVal").hide();
            }
            if(test1 && test2 && test3){
                return true;
            }else{
                return false;
            }
        });
    })

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

</body>

</html>
