<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Sean
  Date: 2019/8/8
  Time: 15:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

当前登录的用户是:${sessionScope.current_user.getDevName()}
<a href="${pageContext.request.contextPath}/developer/logout">退出</a>

</body>
</html>
