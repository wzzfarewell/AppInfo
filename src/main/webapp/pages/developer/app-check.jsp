<%--
  Created by IntelliJ IDEA.
  User: 21969
  Date: 2019/8/13
  Time: 下午 04:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>APP开发者平台-查看APP信息</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="../../vendors/iconfonts/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="../../vendors/css/vendor.bundle.base.css">
    <!-- endinject -->
    <!-- inject:css -->
    <link rel="stylesheet" href="../../css/style.css">
    <!-- endinject -->
    <link rel="shortcut icon" href="../../images/favicon.png" />
</head>

<body onload="editApp(getRequest())">
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
                        查看APP信息
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
                                <form class="forms-sample" id="edit_appDetail_form">
                                    <div class="form-group row">
                                        <label class="col-sm-2 offset-sm-1 col-form-label">软件名称</label>
                                        <div class="col-sm-8">
                                            <input type="text" name="appName" value="${appVo.appName}" class="form-control" readonly placeholder=""/>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 offset-sm-1 col-form-label">APK名称</label>
                                        <div class="col-sm-8">
                                            <input type="text" name="apkName" value="${appVo.apkName}" class="form-control" readonly placeholder=""/>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 offset-sm-1 col-form-label">支持的Rom</label>
                                        <div class="col-sm-8">
                                            <input type="text" name="supportRom" value="${appVo.supportRom}" class="form-control" readonly placeholder=""/>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 offset-sm-1 col-form-label">界面语言</label>
                                        <div class="col-sm-8">
                                            <input type="text" name="language" value="${appVo.language}" class="form-control" readonly placeholder=""/>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 offset-sm-1 col-form-label">软件大小</label>
                                        <div class="col-sm-8">
                                            <input type="text" name="appSize" value="${appVo.appSize}" class="form-control" readonly placeholder=""/>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 offset-sm-1 col-form-label">所属平台</label>
                                        <div class="col-sm-8">
                                            <select name="appPlatform" class="form-control" disabled>
                                                <c:forEach items="${appPlatform}" var="item">
                                                    <option <c:if test="${item == appVo.appPlatform}"> selected</c:if>>${item}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 offset-sm-1 col-form-label">一级分类</label>
                                        <div class="col-sm-8">
                                            <select name="firstCategory" class="form-control" disabled>
                                                <c:forEach items="${firstCategory}" var="item">
                                                    <option <c:if test="${item == appVo.firstCategory}"> selected</c:if>>${item}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 offset-sm-1 col-form-label">二级分类</label>
                                        <div class="col-sm-8">
                                            <select name="secondCategory" class="form-control" disabled>
                                                <c:forEach items="${secondCategory}" var="item">
                                                    <option <c:if test="${item == appVo.secondCategory}"> selected</c:if>>${item}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 offset-sm-1 col-form-label">三级分类</label>
                                        <div class="col-sm-8">
                                            <select name="thirdCategory" class="form-control" disabled>
                                                <c:forEach items="${thirdCategory}" var="item">
                                                    <option <c:if test="${item == appVo.thirdCategory}"> selected</c:if>>${item}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 offset-sm-1 col-form-label">APP状态</label>
                                        <div class="col-sm-8">
                                            <input type="text" value="${appVo.appStatus}" name="appStatus"  class="form-control" readonly placeholder="">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 offset-sm-1 col-form-label">应用简介</label>
                                        <div class="col-sm-8">
                                            <textarea name="appInfo" class="form-control" rows="5" readonly>${appVo.appInfo}</textarea>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 offset-sm-1 col-form-label">LOGO图片</label>
                                        <div class="col-sm-8">
                                            <c:choose>
                                                <c:when test="${appVo.logoPicPath != null}">
                                                    <img src="${pageContext.request.contextPath}/${appVo.logoPicPath}" width="100" height="100"/>
                                                </c:when>
                                                <c:otherwise>
                                                    暂无图标
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12 grid-margin stretch-card">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">历史版本列表</h4>
                                <br><br>
                                <table id="appLoadTable" class="table table-bordered">
                                    <thead>
                                    <tr class="text-primary">
                                        <th>软件名称</th>
                                        <th>版本号</th>
                                        <th>版本大小(单位:M)</th>
                                        <th>发布状态</th>
                                        <th>APK文件下载</th>
                                        <th>最新更新时间</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${page.list}" var="obj">
                                        <tr>
                                            <td>${obj.appName}</td>
                                            <td>${obj.versionNo}</td>
                                            <td>${obj.versionSize}</td>
                                            <td>${obj.statusName}</td>
                                            <td>${obj.downloadUrl}</td>
                                            <td>${obj.updateTime}</td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                    <tfoot>
                                    <tr>
                                        <th colspan="9">
                                            <c:if test="${!page.isFirstPage}">
                                                <a href="${pageContext.request.contextPath}/developer/appVersion?pageNum=${page.pageNum - 1}" class="">上一页</a>
                                            </c:if>
                                            <c:if test="${!page.isLastPage}">
                                                <a href="${pageContext.request.contextPath}/developer/appVersion?pageNum=${page.pageNum + 1}"  class="">下一页</a>
                                            </c:if>
                                        </th>
                                    </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-2 offset-sm-5">
                        <a href="${pageContext.request.contextPath}/developer/app-list" class="btn btn-gradient-primary mr-2">返回</a>
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