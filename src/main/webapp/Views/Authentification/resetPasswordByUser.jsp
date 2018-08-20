<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
  Created by IntelliJ IDEA.
  User: Максим
  Date: 21.05.2018
  Time: 18:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Восстановление пароля</title>
</head>
<body>
<div>
    <h1>Восстановление пароля</h1>
</div>

<div>
    <h3>Введите почтовый адрес, на который зарегистрирован аккаунт</h3>
    <c:if test="${Error!=null}">
        <div>${Error}</div>
    </c:if>
    <sf:form action="/reset">
        <label for="email">Почтовый адрес:</label>
        <input type="email" id="email" name="email">
        <input type="submit" value="Отправить">
    </sf:form>
</div>
</body>
</html>
