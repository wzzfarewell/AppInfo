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
    <title>APP信息管理平台</title>
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
                                <form:input type="text" path="username" class="form-control form-control-lg" placeholder="用户名"/>
                            </div>
                            <div class="form-group">
                                <form:input type="password" path="password" class="form-control form-control-lg" id="exampleInputPassword1" placeholder="密码"/>
                            </div>
                            <ul class="list-star">
                                <c:forEach items="${messages}" var="msg">
                                    <li class="text-muted">${msg}</li>
                                </c:forEach>
                            </ul>
                            <div class="mt-3">
                                <button type="submit" class="btn btn-block btn-gradient-primary btn-lg font-weight-medium auth-form-btn">登录</button>
                            </div>
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
</body>

</html>

