<%--
  Created by IntelliJ IDEA.
  User: 21969
  Date: 2019/8/9
  Time: 上午 09:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    <title>APP开发者平台-APP维护</title>
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
                    <div class="col-12 grid-margin">
                        <div class="card">
                            <div class="card-body">
                                <form:form class="form-sample" action="${pageContext.request.contextPath}/developer/search-app" modelAttribute="appSearchVo" method="post">
                                    <p class="card-description">
                                        APP 查询
                                    </p>
                                    <hr>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label class="col-sm-3 col-form-label">软件名称</label>
                                                <div class="col-sm-9">
                                                    <form:input path="appName" type="text" class="form-control" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label class="col-sm-3 col-form-label">APP 状态</label>
                                                <div class="col-sm-9">
                                                    <form:select path="appStatus" class="form-control">
                                                        <option value="">--选择APP状态--</option>
                                                        <c:forEach items="${appStatus}" var="item">
                                                            <option>${item}</option>
                                                        </c:forEach>
                                                    </form:select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label class="col-sm-3 col-form-label">所属平台</label>
                                                <div class="col-sm-9">
                                                    <form:select path="appPlatform" class="form-control">
                                                        <option value="">--选择平台--</option>
                                                        <c:forEach items="${appPlatform}" var="item">
                                                            <option>${item}</option>
                                                        </c:forEach>
                                                    </form:select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label class="col-sm-3 col-form-label">一级分类</label>
                                                <div class="col-sm-9">
                                                    <form:select path="firstCategory" class="form-control">
                                                        <option value="">--选择分类--</option>
                                                        <c:forEach items="${firstCategory}" var="item">
                                                            <option>${item}</option>
                                                        </c:forEach>
                                                    </form:select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label class="col-sm-3 col-form-label">二级分类</label>
                                                <div class="col-sm-9">
                                                    <form:select path="secondCategory" class="form-control">
                                                        <option value="">--选择分类--</option>
                                                        <c:forEach items="${secondCategory}" var="item">
                                                            <option>${item}</option>
                                                        </c:forEach>
                                                    </form:select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label class="col-sm-3 col-form-label">三级分类</label>
                                                <div class="col-sm-9">
                                                    <form:select path="thirdCategory" class="form-control">
                                                        <option value="">--选择分类--</option>
                                                        <c:forEach items="${thirdCategory}" var="item">
                                                            <option>${item}</option>
                                                        </c:forEach>
                                                    </form:select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-4 offset-sm-4">
                                            <button type="submit" class="btn btn-gradient-dark mb-2">查询</button>
                                            &nbsp;&nbsp;
                                            <button type="reset" class="btn btn-gradient-dark mb-2">重置</button>
                                        </div>
                                    </div>
                                </form:form>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12 grid-margin stretch-card">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">APP列表</h4><br/>
                                <table id="appLoadTable" class="table table-bordered">
                                    <thead>
                                    <tr class="text-primary">
                                        <th>软件名称</th>
                                        <th>APK名称</th>
                                        <th>软件大小(/M)</th>
                                        <th>所属平台</th>
                                        <th>所属分类</th>
                                        <th>状态</th>
                                        <th>下载次数</th>
                                        <th>最新版本号</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${page.list}" var="app">
                                        <tr>
                                            <td>${app.appName}</td>
                                            <td>${app.apkName}</td>
                                            <td>${app.appSize}</td>
                                            <td>${app.appPlatform}</td>
                                            <td>${app.firstCategory}>>${app.secondCategory}>>${app.thirdCategory}</td>
                                            <td id="appStatus${app.appId}">${app.appStatus}</td>
                                            <td>${app.version.downloadCount}</td>
                                            <td>${app.version.versionNo}</td>
                                            <td>
                                                <div class="dropdown">
                                                    <button type="button" class="btn btn-primary dropdown-toggle btn-sm" data-toggle="dropdown">
                                                        点击操作
                                                    </button>
                                                    <div class="dropdown-menu">
                                                        <a class="dropdown-item" href="${pageContext.request.contextPath}/developer/appVersion?appId=${app.appId}&method=1" data-toggle="tooltip" data-placement="right" title="查看历史版本并添加新版本">新增版本</a>
                                                        <div class="dropdown-divider"></div>
                                                        <a class="dropdown-item" href="${pageContext.request.contextPath}/developer/appVersion?appId=${app.appId}&method=2" data-toggle="tooltip" data-placement="right" title="对历史版本进行修改">修改版本</a>
                                                        <div class="dropdown-divider"></div>
                                                        <a class="dropdown-item" href="${pageContext.request.contextPath}/developer/app-edit/${app.appId}" data-toggle="tooltip" data-placement="right" title="修改APP基础信息">修改</a>
                                                        <div class="dropdown-divider"></div>
                                                        <a class="dropdown-item" href="${pageContext.request.contextPath}/developer/app-check/${app.appId}" data-toggle="tooltip" data-placement="right" title="查看APP基础信息及历史版本信息">查看</a>
                                                        <div class="dropdown-divider"></div>
                                                        <a class="dropdown-item" href="javascript:void(0);" onclick="deleteApp('${app.appId}','${app.appName}')" data-toggle="tooltip" data-placement="right" title="删除APP及其所有版本">删除</a>
                                                        <div class="dropdown-divider"></div>
                                                        <a class="dropdown-item" href="javascript:void(0);" onclick="putOn('${app.appId}')" data-toggle="tooltip" data-placement="right" title="APP通过审核可选择上架">上架</a>
                                                        <div class="dropdown-divider"></div>
                                                        <a class="dropdown-item" href="javascript:void(0);" onclick="putOff('${app.appId}')" data-toggle="tooltip" data-placement="right" title="上架的APP可选择下架">下架</a>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                    <tfoot>
                                    <tr>
                                        <th colspan="9">
                                            <c:if test="${!page.isFirstPage}">
                                                <a href="${pageContext.request.contextPath}/developer/app-list?pageNum=${page.pageNum - 1}" class="">上一页</a>
                                            </c:if>
                                            <c:if test="${!page.isLastPage}">
                                                <a href="${pageContext.request.contextPath}/developer/app-list?pageNum=${page.pageNum + 1}"  class="">下一页</a>
                                            </c:if>
                                        </th>
                                    </tr>
                                    </tfoot>
                                </table>
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
    $(document).ready(function(){
        $('[data-toggle="tooltip"]').tooltip();
    });
    function deleteApp(appId,appName) {
        if(confirm('你确定要删除APP应用【'+appName+'】及其所有版本?')) {
            $.post("<%=basePath%>developer/app-delete",{"appId":appId},function(data){
                alert("APP应用【"+appName+"】及其所有版本删除成功！");
                window.location.reload();
            });
        }
    }

    function putOn(id){
        var status=$("#appStatus"+id).text();
        if (status=="审核通过" || status=="已下架") {
            $.ajax({url:"${pageContext.request.contextPath}/developer/putOn/"+id,success:function(data){
                    result=JSON.parse(data);
                    $("#appStatus"+id).html(result["appStatus"]);
                }});
        }
        else {
            alert("只能上架通过审核或下架的APP")
        }

    }

    function putOff(id){
        var status=$("#appStatus"+id).text();
        if (status=="已上架" ) {
            $.ajax({url:"${pageContext.request.contextPath}/developer/putOff/"+id,success:function(data){
                    result=JSON.parse(data);
                    $("#appStatus"+id).html(result["appStatus"]);
                }});
        }
        else {
            alert("只能下架已上架的APP")
        }
    }

</script>


</body>

</html>
