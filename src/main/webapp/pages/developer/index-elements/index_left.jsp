<%--
  Created by IntelliJ IDEA.
  User: 21969
  Date: 2019/8/12
  Time: 上午 09:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>index_left</title>
</head>
<body>
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
                    <span class="font-weight-bold mb-2">${sessionScope.current_user.getDevName()}</span>
                    <span class="text-secondary text-small">开发人员</span>
                </div>
                <i class="mdi mdi-bookmark-check text-success nav-profile-badge"></i>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/developer/home">
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
                    <li class="nav-item"> <a class="nav-link" href="${pageContext.request.contextPath}/developer/app-add">APP添加</a></li>
                    <li class="nav-item"> <a class="nav-link" href="${pageContext.request.contextPath}/developer/app-list">APP维护</a></li>
                </ul>
            </div>
        </li>
    </ul>
</nav>
</body>
</html>
