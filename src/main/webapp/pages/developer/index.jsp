<%--
  Created by IntelliJ IDEA.
  User: 21969
  Date: 2019/8/9
  Time: 上午 08:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>APP开发者后台</title>
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
                        APP 账户管理
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
                                <h4 class="card-title">开发者列表</h4>
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                        <tr>
                                            <th>姓名</th>
                                            <th>邮箱</th>
                                            <th>信息</th>
                                            <th>删除</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td>
                                                <img src="../../images/faces/face1.jpg" class="mr-2" alt="image">
                                                David Grey
                                            </td>
                                            <td>
                                                Fund is not recieved
                                            </td>
                                            <td>
                                                <label class="badge badge-gradient-success">DONE</label>
                                            </td>
                                            <td>
                                                <button class="btn btn-gradient-primary btn-rounded btn-icon btn-sm">
                                                    <i class="mdi mdi-content-cut menu-icon"></i>
                                                </button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <img src="../../images/faces/face2.jpg" class="mr-2" alt="image">
                                                Stella Johnson
                                            </td>
                                            <td>
                                                High loading time
                                            </td>
                                            <td>
                                                <label class="badge badge-gradient-warning">PROGRESS</label>
                                            </td>
                                            <td>
                                                <button class="btn btn-gradient-primary btn-rounded btn-icon btn-sm">
                                                    <i class="mdi mdi-content-cut menu-icon"></i>
                                                </button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <img src="../../images/faces/face3.jpg" class="mr-2" alt="image">
                                                Marina Michel
                                            </td>
                                            <td>
                                                Website down for one week
                                            </td>
                                            <td>
                                                <label class="badge badge-gradient-info">ON HOLD</label>
                                            </td>
                                            <td>
                                                <button class="btn btn-gradient-primary btn-rounded btn-icon btn-sm">
                                                    <i class="mdi mdi-content-cut menu-icon"></i>
                                                </button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <img src="../../images/faces/face4.jpg" class="mr-2" alt="image">
                                                John Doe
                                            </td>
                                            <td>
                                                Loosing control on server
                                            </td>
                                            <td>
                                                <label class="badge badge-gradient-danger">REJECTED</label>
                                            </td>
                                            <td>
                                                <button class="btn btn-gradient-primary btn-rounded btn-icon btn-sm">
                                                    <i class="mdi mdi-content-cut menu-icon"></i>
                                                </button>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
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

</html>


