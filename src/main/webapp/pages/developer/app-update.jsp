<%--
  Created by IntelliJ IDEA.
  User: 21969
  Date: 2019/8/12
  Time: 下午 07:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
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
    <jsp:include page="index-elements/index_top.jsp"/>
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
        <!-- partial:partials/_sidebar.html -->
        <jsp:include page="index-elements/index_left.jsp"/>
        <!-- partial -->
        <div class="main-panel">
            <div class="content-wrapper">
                <div class="page-header">
                    <h3 class="page-title">
              <span class="page-title-icon bg-gradient-primary text-white mr-2">
                <i class="mdi mdi-home"></i>
              </span>
                        修改APP基础信息
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
                                <h4 class="card-title">APP基础信息</h4>
                                <p class="card-description">
                                    请修改相应APP基础信息并保存
                                </p>
                                <form:form class="forms-sample" modelAttribute="appVo" method="post" action="${pageContext.request.contextPath}/developer/app-add">
                                    <form:hidden path="devId" value="${sessionScope.current_user.getId()}" />
                                    <form:hidden path="appStatus" value="待审核" />
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">软件名称</label>
                                        <div class="col-sm-10">
                                            <form:input type="text" path="appName" class="form-control" placeholder=""/>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">APK名称</label>
                                        <div class="col-sm-10">
                                            <form:input type="text" path="apkName"  class="form-control" placeholder=""/>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">支持的Rom</label>
                                        <div class="col-sm-10">
                                            <form:input type="text" path="supportRom"  class="form-control" placeholder=""/>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">界面语言</label>
                                        <div class="col-sm-10">
                                            <form:input type="text" path="language"  class="form-control" placeholder=""/>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">软件大小</label>
                                        <div class="col-sm-10">
                                            <form:input type="text" path="appSize"  class="form-control" placeholder=""/>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">所属平台</label>
                                        <div class="col-sm-10">
                                            <form:select path="appPlatform" class="form-control">
                                                <option value="">--选择平台--</option>
                                                <c:forEach items="${appPlatform}" var="item">
                                                    <option>${item}</option>
                                                </c:forEach>
                                            </form:select>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">一级分类</label>
                                        <div class="col-sm-10">
                                            <form:select path="firstCategory" class="form-control">
                                                <option value="">--选择分类--</option>
                                                <c:forEach items="${firstCategory}" var="item">
                                                    <option>${item}</option>
                                                </c:forEach>
                                            </form:select>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">二级分类</label>
                                        <div class="col-sm-10">
                                            <form:select path="secondCategory" class="form-control">
                                                <option value="">--选择分类--</option>
                                                <c:forEach items="${secondCategory}" var="item">
                                                    <option>${item}</option>
                                                </c:forEach>
                                            </form:select>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">三级分类</label>
                                        <div class="col-sm-10">
                                            <form:select path="thirdCategory" class="form-control">
                                                <option value="">--选择分类--</option>
                                                <c:forEach items="${thirdCategory}" var="item">
                                                    <option>${item}</option>
                                                </c:forEach>
                                            </form:select>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">APP状态</label>
                                        <div class="col-sm-10">
                                            <input type="text" value="待审核" id="appStatus"  class="form-control" readonly placeholder="">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">应用简介</label>
                                        <div class="col-sm-10">
                                            <form:textarea path="appInfo" class="form-control" rows="5"></form:textarea>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">LOGO图片</label>
                                        <div class="col-sm-10">
                                            <input type="file" path="logo" class="form-control" accept=".jpg,.jpeg,.png" placeholder="">
                                        </div>
                                    </div>
                                    <button type="submit" class="btn btn-gradient-primary mr-2">添加</button>
                                    <button type="reset" class="btn btn-gradient-primary mr-2">重置</button>
                                </form:form>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <!-- content-wrapper ends -->
            <!-- partial:partials/_footer.html -->
            <jsp:include page="index-elements/index_bottom.jsp"/>
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