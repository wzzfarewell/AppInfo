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
    <title>新增APP版本信息</title>
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

                                            <td><i class="mdi mdi-pencil-box icon-md"></i></td>
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
                    <div class="col-12 grid-margin">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">增加APP版本信息</h4>

                                <form:form class="forms-sample" method="post" modelAttribute="appVersionVo" action="${pageContext.request.contextPath}/developer/addAppVersion"  enctype="multipart/form-data" >
                                    <form:hidden path="appId" value="${appId}" />
                                    <form:hidden path="updateTime" value="" />
                                    <form:hidden path="statusName" value="未发布" />

                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">版本号</label>
                                        <div class="col-sm-10">
                                            <form:input path="versionNo" type="text" class="form-control" id="versionNo" placeholder="请输入版本号"/>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">版本大小</label>
                                        <div class="col-sm-10">
                                            <form:input path="versionSize" type="text" class="form-control" id="versionSize" placeholder="请输入版本大小,单位为Mb" />
                                        </div>
                                    </div>
                                    <ul class="list-star" id="versionSizeVal" style="display: none;">
                                        <li class="text-muted">版本大小为0-500的数字</li>
                                    </ul>
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">版本简介</label>
                                        <div class="col-sm-10">
                                            <form:textarea path="versionInfo" class="form-control" rows="5" id="versionInfo" placeholder="请输入本版本的相关信息,本信息作为该版本的详细信息进行版本介绍" />
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">apk文件</label>
                                        <div class="col-sm-10">
                                            <input type="file" accept="application/vnd.android.package-archive" name="apk" class="form-control">
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
<script src="https://cdn.jsdelivr.net/npm/jquery@3.2/dist/jquery.min.js"></script>

<script>
    $(function () {

        $(":submit").click(function () {
            var versionNo = $("#versionNo").val();
            var versionSize = $("#versionSize").val();
            var versionInfo = $("#versionInfo").val();

            if(versionNo == ""){
                alert("版本号不能为空!")
                return false;
            }
            if(versionSize == ""){
                alert("版本大小不能为空!")
                return false;
            }
            if(versionInfo == ""){
                alert("版本简介不能为空!")
                return false;
            }

            var Pattern =   /^\+?[1-9][0-9]*$/;
            var test = Pattern.test(versionSize);
            if (parseInt(versionSize)<=0 || parseInt(versionSize)>=500 ){
                test =false;
            }

            if(!test){
                $("#versionSizeVal").show();
            }else{
                $("#versionSizeVal").hide();
            }

            if(test){
                return true;
            }else{
                return false;
            }
        });
    })

</script>

<!-- End custom js for this page-->
</body>

</html>
