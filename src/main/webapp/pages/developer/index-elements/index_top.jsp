<%--
  Created by IntelliJ IDEA.
  User: 21969
  Date: 2019/8/12
  Time: 上午 09:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>index_top</title>
</head>
<body>
<!-- partial:partials/_navbar.html -->
<nav class="navbar default-layout-navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
    <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
        <a class="navbar-brand brand-logo" href="${pageContext.request.contextPath}/developer/home"><img src="../../images/logo.svg" alt="logo" /></a>
        <a class="navbar-brand brand-logo-mini" href="${pageContext.request.contextPath}/developer/home"><img src="../../images/logo-mini.svg"
                                                                                                              alt="logo" /></a>
    </div>
    <div class="navbar-menu-wrapper d-flex align-items-stretch">
        <div class="search-field d-none d-md-block">
            <form class="d-flex align-items-center h-100" method="post" action="${pageContext.request.contextPath}/developer/name-search">
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
                        <p class="mb-1 text-black">${sessionScope.current_user.getDevName()}</p>
                    </div>
                </a>
                <div class="dropdown-menu navbar-dropdown" aria-labelledby="profileDropdown">
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/developer/logout">
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
</body>
</html>
