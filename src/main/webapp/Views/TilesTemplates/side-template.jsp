<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Максим
  Date: 20.05.2018
  Time: 3:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div>
    <div>
        <a href="/privateOffice?username=<security:authentication property='principal.username'/>">Мои заявки</a>
    </div>
    <div>
        <a href="/privateOfficeInfo?username=<security:authentication property='principal.username'/>">Личные данные</a>
    </div>
    <div>
        <a href="/">Вернуться</a>
    </div>
</div>
</body>
</html>
