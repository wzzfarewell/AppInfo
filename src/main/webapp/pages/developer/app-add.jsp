<%--
  Created by IntelliJ IDEA.
  User: 21969
  Date: 2019/8/12
  Time: 上午 08:58
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
    <title>APP开发者平台-APP添加</title>
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
                        新增APP
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
                                <br><br>
                                <form:form class="forms-sample" modelAttribute="appVo" method="post" action="${pageContext.request.contextPath}/developer/app-add" enctype="multipart/form-data">
                                    <form:hidden path="devId" value="${sessionScope.current_user.getId()}" />
                                    <form:hidden path="appStatus" value="待审核" />
                                    <div class="form-group row">
                                        <label class="col-sm-2 offset-sm-1 col-form-label">软件名称</label>
                                        <div class="col-sm-8">
                                            <form:input type="text" path="appName" class="form-control" placeholder="请输入软件名称"/>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 offset-sm-1 col-form-label">APK名称</label>
                                        <div class="col-sm-8">
                                            <form:input type="text" path="apkName"  class="form-control" placeholder="请输入APK名称"/>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 offset-sm-1 col-form-label">支持的Rom</label>
                                        <div class="col-sm-8">
                                            <form:input type="text" path="supportRom"  class="form-control" placeholder="请输入支持的Rom"/>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 offset-sm-1 col-form-label">界面语言</label>
                                        <div class="col-sm-8">
                                            <form:input type="text" path="language"  class="form-control" placeholder="请输入软件支持的界面语言"/>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 offset-sm-1 col-form-label">软件大小</label>
                                        <div class="col-sm-8">
                                            <form:input type="text" path="appSize"  class="form-control" placeholder="请输入软件大小，单位为Mb"/>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 offset-sm-1 col-form-label">所属平台</label>
                                        <div class="col-sm-8">
                                            <form:select path="appPlatform" class="form-control">
                                                <option disabled selected>--请选择平台--</option>
                                                <c:forEach items="${appPlatform}" var="item">
                                                    <option>${item}</option>
                                                </c:forEach>
                                            </form:select>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 offset-sm-1 col-form-label">一级分类</label>
                                        <div class="col-sm-8">
                                            <form:select path="firstCategory" class="form-control">
                                                <option disabled selected>--请选择分类--</option>
                                                <c:forEach items="${firstCategory}" var="item">
                                                    <option>${item}</option>
                                                </c:forEach>
                                            </form:select>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 offset-sm-1 col-form-label">二级分类</label>
                                        <div class="col-sm-8">
                                            <form:select path="secondCategory" class="form-control">
                                                <option disabled selected>--请选择分类--</option>
                                                <c:forEach items="${secondCategory}" var="item">
                                                    <option>${item}</option>
                                                </c:forEach>
                                            </form:select>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 offset-sm-1 col-form-label">三级分类</label>
                                        <div class="col-sm-8">
                                            <form:select path="thirdCategory" class="form-control">
                                                <option disabled selected>--请选择分类--</option>
                                                <c:forEach items="${thirdCategory}" var="item">
                                                    <option>${item}</option>
                                                </c:forEach>
                                            </form:select>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 offset-sm-1 col-form-label">APP状态</label>
                                        <div class="col-sm-8">
                                            <input type="text" value="待审核" id="appStatus"  class="form-control" readonly placeholder="">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 offset-sm-1 col-form-label">应用简介</label>
                                        <div class="col-sm-8">
                                            <%--请输入本软件的相关信息，本信息作为软件的详细信息对软件进行介绍--%>
                                            <form:textarea path="appInfo" class="form-control" rows="5"></form:textarea>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 offset-sm-1 col-form-label">LOGO图片</label>
                                        <div class="col-sm-8">
                                            <c:if test="${appVo.logoPicPath != null}">
                                                <img src="${pageContext.request.contextPath}/${appVo.logoPicPath}" width="100" height="100"/>
                                            </c:if>
                                            <input type="file" name="logoPic" class="form-control" accept=".jpg,.jpeg,.png" placeholder="请选择.jpg,.jpeg,.png格式的图片">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-4 offset-sm-4">
                                            <button type="submit" class="btn btn-gradient-primary mr-2">添加</button>
                                            <button type="reset" class="btn btn-gradient-primary mr-2">重置</button>
                                        </div>
                                    </div>
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

