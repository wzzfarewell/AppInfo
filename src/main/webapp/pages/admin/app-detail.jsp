<%--
  Created by IntelliJ IDEA.
  User: wzzap
  Date: 2019/8/7
  Time: 9:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>APP审核</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="../../vendors/iconfonts/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="../../vendors/css/vendor.bundle.base.css">
    <!-- endinject -->
    <!-- inject:css -->
    <link rel="stylesheet" href="../../css/style.css">
    <!-- endinject -->
    <link rel="shortcut icon" href="../../images/favicon.png" />
</head>

<body>
<div class="container-scroller">
    <!-- partial:partials/_navbar.html -->
    <nav class="navbar default-layout-navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
        <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
            <a class="navbar-brand brand-logo" href="${pageContext.request.contextPath}/admin/home"><img src="../../images/logo.svg" alt="logo" /></a>
            <a class="navbar-brand brand-logo-mini" href="${pageContext.request.contextPath}/admin/home"><img src="../../images/logo-mini.svg"
                                                                           alt="logo" /></a>
        </div>
        <div class="navbar-menu-wrapper d-flex align-items-stretch">
            <div class="search-field d-none d-md-block">
                <form class="d-flex align-items-center h-100" method="post" action="${pageContext.request.contextPath}/admin/name-search">
                    <div class="input-group">
                        <div class="input-group-prepend bg-transparent">
                            <button type="submit" class="btn btn-sm mdi mdi-magnify"></button>
                        </div>
                        <input type="text" name="appName" class="form-control bg-transparent border-0" placeholder="查找APP">
                    </div>
                </form>
            </div>
            <ul class="navbar-nav navbar-nav-right">
                <li class="nav-item nav-profile dropdown">
                    <a class="nav-link dropdown-toggle" id="profileDropdown" href="#" data-toggle="dropdown"
                       aria-expanded="false">
                        <div class="nav-profile-img">
                            <img src="../../images/faces/face1.jpg" alt="image">
                            <span class="availability-status online"></span>
                        </div>
                        <div class="nav-profile-text">
                            <p class="mb-1 text-black">${sessionScope['current_user'].username}</p>
                        </div>
                    </a>
                    <div class="dropdown-menu navbar-dropdown" aria-labelledby="profileDropdown">
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#">
                            <i class="mdi mdi-logout mr-2 text-primary"></i>
                            登出
                        </a>
                    </div>
                </li>
                <li class="nav-item d-none d-lg-block full-screen-link">
                    <a class="nav-link">
                        <i class="mdi mdi-fullscreen" id="fullscreen-button"></i>
                    </a>
                </li>
                <li class="nav-item nav-settings d-none d-lg-block">
                    <a class="nav-link" href="#">
                        <i class="mdi mdi-format-line-spacing"></i>
                    </a>
                </li>
            </ul>
            <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button"
                    data-toggle="offcanvas">
                <span class="mdi mdi-menu"></span>
            </button>
        </div>
    </nav>
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
        <!-- partial:partials/_sidebar.html -->
        <nav class="sidebar sidebar-offcanvas" id="sidebar">
            <ul class="nav">
                <li class="nav-item nav-profile">
                    <a href="#" class="nav-link">
                        <div class="nav-profile-image">
                            <img src="../../images/faces/face1.jpg" alt="profile">
                            <span class="login-status online"></span>
                            <!--change to offline or busy as needed-->
                        </div>
                        <div class="nav-profile-text d-flex flex-column">
                            <span class="font-weight-bold mb-2">${sessionScope['current_user'].username}</span>
                            <span class="text-secondary text-small">后台管理员</span>
                        </div>
                        <i class="mdi mdi-bookmark-check text-success nav-profile-badge"></i>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/admin/home">
                        <span class="menu-title">APP开发者管理</span>
                        <i class="mdi mdi-account-multiple menu-icon"></i>
                    </a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" data-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
                        <span class="menu-title">APP应用管理</span>
                        <i class="menu-arrow"></i>
                        <i class="mdi mdi-android menu-icon"></i>
                    </a>
                    <div class="collapse" id="ui-basic">
                        <ul class="nav flex-column sub-menu">
                            <li class="nav-item"> <a class="nav-link" href="${pageContext.request.contextPath}/admin/app-manage">APP审核</a></li>
                        </ul>
                    </div>
                </li>
            </ul>
        </nav>
        <!-- partial -->
        <div class="main-panel">
            <div class="content-wrapper">
                <div class="page-header">
                    <h3 class="page-title">
              <span class="page-title-icon bg-gradient-primary text-white mr-2">
                <i class="mdi mdi-home"></i>
              </span>
                        APP 信息审核
                    </h3>
                    <nav aria-label="breadcrumb">
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item active" aria-current="page">
                                <span></span>Overview
                                <i class="mdi mdi-alert-circle-outline icon-sm text-primary align-middle"></i>
                            </li>
                        </ul>
                    </nav>
                </div>
                <div class="row">
                    <div class="col-12 grid-margin">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">APP详情</h4>
                                <p class="card-description">
                                    您可以通过查看APP的这些内容来决定是否通过审核
                                </p>
                                <form class="forms-sample" method="GET" action="${pageContext.request.contextPath}/admin/app-check/${appDetail.app.appId}">
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">软件名称</label>
                                        <div class="col-sm-10">
                                            <input type="text" value="${appDetail.app.appName}" class="form-control" readonly placeholder="">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">APK名称</label>
                                        <div class="col-sm-10">
                                            <input type="text" value="${appDetail.app.apkName}"  class="form-control" readonly placeholder="">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">支持的Rom</label>
                                        <div class="col-sm-10">
                                            <input type="text" value="${appDetail.app.supportRom}"  class="form-control" readonly placeholder="">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">语言</label>
                                        <div class="col-sm-10">
                                            <input type="text" value="${appDetail.app.language}"  class="form-control" readonly placeholder="">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">软件大小</label>
                                        <div class="col-sm-10">
                                            <input type="text" value="${appDetail.app.appSize}"  class="form-control" readonly placeholder="">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">创建时间</label>
                                        <div class="col-sm-10">
                                            <input type="text" value="<fmt:formatDate value='${appDetail.app.createTime}' pattern="yyyy-MM-dd HH:mm:ss"/>"  class="form-control" readonly placeholder="">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">更新时间</label>
                                        <div class="col-sm-10">
                                            <input type="text" value="<fmt:formatDate value='${appDetail.app.updateTime}' pattern="yyyy-MM-dd HH:mm:ss"/>"  class="form-control" readonly placeholder="">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">分类</label>
                                        <div class="col-sm-10">
                                            <input type="text" value="${appDetail.categoryMap.get("一级分类").categoryName}>>${appDetail.categoryMap.get("二级分类").categoryName}>>${appDetail.categoryMap.get("三级分类").categoryName}" class="form-control" readonly placeholder="">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">所属平台</label>
                                        <div class="col-sm-10">
                                            <input type="text" value="${appDetail.statusMap.get("AppPlatform").statusName}" class="form-control" readonly placeholder="">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">版本信息</label>
                                        <div class="col-sm-10">
                                            <select class="form-control">
                                                <c:forEach var="version" items="${appDetail.versions}">
                                                    <option>${version.versionNo}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">开发者</label>
                                        <div class="col-sm-10">
                                            <select class="form-control">
                                                <c:forEach var="dev" items="${appDetail.devUsers}">
                                                    <option>${dev.devName}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">简介</label>
                                        <div class="col-sm-10">
                        <textarea class="form-control" rows="5" readonly>
                            ${appDetail.app.appInfo}
                        </textarea>
                                        </div>
                                    </div>
                                    <button type="submit" class="btn btn-gradient-primary mr-2">审核通过</button>
                                    <a href="${pageContext.request.contextPath}/admin/app-uncheck/${appDetail.app.appId}" class="btn btn-light">审核不通过</a>
                                    <a href="${pageContext.request.contextPath}/admin/app-manage" class="btn btn-light">返回</a>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <!-- content-wrapper ends -->
            <!-- partial:partials/_footer.html -->
            <footer class="footer">
                <div class="d-sm-flex justify-content-center justify-content-sm-between">
                    <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Copyright © 2019 All rights reserved.</span>
                    <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">farewell & made with <i
                            class="mdi mdi-heart text-danger"></i></span>
                </div>
            </footer>
            <!-- partial -->
        </div>
        <!-- main-panel ends -->
    </div>
    <!-- page-body-wrapper ends -->
</div>
<!-- container-scroller -->

<!-- plugins:js -->
<script src="../../vendors/js/vendor.bundle.base.js"></script>
<script src="../../vendors/js/vendor.bundle.addons.js"></script>
<!-- endinject -->
<!-- Plugin js for this page-->
<!-- End plugin js for this page-->
<!-- inject:js -->
<script src="../../js/off-canvas.js"></script>
<script src="../../js/misc.js"></script>
<!-- endinject -->
<!-- Custom js for this page-->
<script src="../../js/dashboard.js"></script>
<!-- End custom js for this page-->
</body>

</html>