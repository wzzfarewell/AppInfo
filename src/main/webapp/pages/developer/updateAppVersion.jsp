<%--
  Created by IntelliJ IDEA.
  User: Sean
  Date: 2019/8/9
  Time: 9:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>修改APP版本信息</title>
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
                        APP 信息管理维护
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
                    <div class="col-md-12 grid-margin stretch-card">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">历史版本列表</h4>
                                <table id="appLoadTable" class="table table-bordered">
                                    <thead>
                                    <tr class="text-primary">
                                        <th>软件名称</th>
                                        <th>版本号</th>
                                        <th>版本大小(单位:M)</th>
                                        <th>发布状态</th>
                                        <th>APK文件下载</th>
                                        <th>最新更新时间</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${page.list}" var="obj">
                                        <tr>
                                            <td>${obj.appName}</td>
                                            <td>${obj.versionNo}</td>
                                            <td>${obj.versionSize}</td>
                                            <td>${obj.statusName}</td>
                                            <td>${obj.apkFileName}</td>
                                            <td>${obj.updateTime}</td>

                                            <td><a href="javascript:void(0);" onclick="onclick1('${obj.versionId}','${obj.statusName}')" > <i class="mdi mdi-pencil-box icon-md"></i></a></td>  <!-- 点这个按钮把obj的值填到表格 -->
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                    <tfoot>
                                    <tr>
                                        <th colspan="9">
                                            <c:if test="${!page.isFirstPage}">
                                                <a href="${pageContext.request.contextPath}/developer/appVersion?appId=${page.list[0].appId}&method=2 & pageNum=${page.pageNum - 1}" class="">上一页</a>
                                            </c:if>
                                            <c:if test="${!page.isLastPage}">
                                                <a href="${pageContext.request.contextPath}/developer/appVersion?appId=${page.list[0].appId}&method=2 & pageNum=${page.pageNum + 1}"  class="">下一页</a>
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
                    <div class="col-12 grid-margin">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">修改APP版本信息</h4>

                                <form:form class="forms-sample" method="post" modelAttribute="appVersionVo" action="${pageContext.request.contextPath}/developer/updateAppVersion" >
                                    <form:hidden path="appId" value="${appId}" />
                                    <form:hidden path="updateTime" value="" />
                                    <form:hidden path="versionId" value="" />
                                    <form:hidden path="statusName" value="未发布" />

                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">版本号</label>
                                        <div class="col-sm-10">
                                            <form:input path="versionNo" type="text" class="form-control" placeholder="请输入版本号" readonly="true"/>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">版本大小</label>
                                        <div class="col-sm-10">
                                            <form:input path="versionSize" type="text" class="form-control" placeholder="请输入版本大小,单位为Mb" />
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">版本简介</label>
                                        <div class="col-sm-10">
                                            <form:textarea path="versionInfo" class="form-control" rows="5" placeholder="请输入本版本的相关信息,本信息作为该版本的详细信息进行版本介绍" />
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">apk文件</label>
                                        <div class="col-sm-10">
                                            <span id="apkFileName"></span><span id="fileArea"><a id="download" href="javascript:alert('找不到文件!');">下载</a><a style="margin-left: 20px" id="delete" href="javascript:alert('找不到文件!');">删除</a></span>
                                        </div>
                                    </div>
                                    <button type="submit" class="btn btn-gradient-primary mr-2">保存</button>
                                    <a href="${pageContext.request.contextPath}/developer/app-list" class="btn btn-light">返回</a>
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
<script src="../../js/jquery-1.12.4.js"></script>

<script>
    function onclick1(id,statusName){
        $.getJSON("${pageContext.request.contextPath}/developer/selectVersion/"+id,function(data){
            if (statusName== "已发布"){
                alert("已发布版本不能修改!")
            }else {
                $("#versionNo").val(data["versionNo"]);
                $("#versionSize").val(data["versionSize"]);
                $("#versionInfo").val(data["versionInfo"]);
                $("#apkFileName").html(data["apkFileName"]);
                $("#versionId").val(data["id"]);
                $("#statusName").val(statusName);
                if (data["downloadUrl"]!=""){
                    $("#download").attr("href","${pageContext.request.contextPath}/developer/download?filename="+data["downloadUrl"]);
                    $("#delete").attr("href","${pageContext.request.contextPath}/developer/deleteFile?filename="+data["downloadUrl"]+"&versionid="+data["id"]);
                }
            }
        });
    }

</script>

</body>

</html>
