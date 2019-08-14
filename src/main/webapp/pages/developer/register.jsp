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
                                <form:input path="devName" type="text" class="form-control form-control-lg" id="exampleInputUsername1" placeholder="用户名"/>
                            </div>
                            <div class="form-group">
                                <form:input path="devEmail" type="email" class="form-control form-control-lg" id="exampleInputEmail1" placeholder="Email"/>
                            </div>
                            <div class="form-group">
                                <form:input path="devPassword" type="password" class="form-control form-control-lg" id="exampleInputPassword1" placeholder="密码"/>
                            </div>

                            <div class="form-group">
                                <form:input path="devInfo" type="text" class="form-control form-control-lg" id="exampleInputUsername1" placeholder="个人简介"/>
                            </div>

                            <div class="mb-4">
                                <div class="form-check">
                                    <label class="form-check-label text-muted">
                                        <input type="checkbox" class="form-check-input">
                                        我同意条约
                                    </label>
                                </div>
                            </div>
                            <div class="mt-3">
                                <button type="submit" class="btn btn-block btn-gradient-primary btn-lg font-weight-medium auth-form-btn">注册</button>
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
</body>

</html>
