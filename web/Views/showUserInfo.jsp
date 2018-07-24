<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Максим
  Date: 29.05.2018
  Time: 3:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-3  justify-content-center position-fixed ">
            <div class="nav nav-pills justify-content-center">
                <div class="row  justify-content-center">
                    <div class="col-lg-8">
                        <a class="nav-link text-center  active m-1" style="background-color: #b94964" href="/privateOffice?username=<security:authentication property='principal.username'/>">Мои заявки</a>
                    </div>
                    <div class="col-lg-8">
                        <a class="nav-link text-center  active m-1" style="background-color: #b94964" href="/privateOfficeInfo?username=<security:authentication property='principal.username'/>">Личные данные</a>
                    </div>
                    <div class="col-lg-8">
                        <a class="nav-link text-center  active m-1" style="background-color: #b94964" href="/">Вернуться</a>
                    </div>
                </div>
            </div>

        </div>
        <div class="col-9 offset-3 ">
            <form action='/editUserInformation?username=${usersEntity.username}' method="post">
                <h2>Id пользователя:${usersEntity.userId}</h2>
                <c:out value="Имя:${usersEntity.firstName}"/><br/>
                <c:out value="Фамилия:${usersEntity.secondName}"/><br/>
                <c:out value="Логин:${usersEntity.username}"/><br/>
                <c:out value="Пароль:${usersEntity.password}"/><br/>
                <c:out value="Номер телефона:${usersEntity.phoneNumber}"/><br/>
                <input type="submit" class="btn btn-success" value="Редактировать">
            </form>
        </div>
    </div>
</div>

</body>
</html>
