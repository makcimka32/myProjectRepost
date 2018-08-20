<%--
  Created by IntelliJ IDEA.
  User: Максим
  Date: 20.05.2018
  Time: 3:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<html>
<head>
    <title>Title</title>
    <style>


    </style>
</head>
<body>
<div class="row">
    <div class="col-lg-4 my-auto">
        <div class="container text-white  text-center" style="background-color: #303161">
            <h2>БрянскГипроЗем</h2>
        </div>
    </div>

    <div class="col-lg-8 my-auto">
        <security:authorize access="isAuthenticated()">
            <h4 class="text-right text-white">Добро пожаловать <security:authentication property="principal.username"/>!</h4>

            <div class="nav nav-pills  justify-content-end">
                <security:authorize access="hasRole('ROLE_DEFAULT_USER')">
                    <a class="nav-link  active m-2" style="background-color: #b94964" href="/createNewRequest">Создать заказ</a>

                </security:authorize>
                <security:authorize  access="hasRole('ROLE_WORKER_USER')">
                    <a class="nav-link redColor active m-2" style="background-color: #b94964" href="/allRequestInSystem">Заявки в системе</a>
                </security:authorize>
                <a class="nav-link  redColor active m-2" style="background-color: #b94964" href="/privateOffice?username=<security:authentication property="principal.username"/>">Личный кабинет</a>
                <a class="nav-link  active m-2 redColor"  style="background-color: #b94964" href="/aboutUs">О нас</a>
                <a class="nav-link redColor active m-2"  style="background-color: #b94964" href="/j_spring_security_logout">Выйти</a>
            </div>
        </security:authorize>
        <security:authorize access="isAnonymous()">
            <div class="nav nav-pills justify-content-end ">
                <a class="nav-link  active m-2 redColor"  style="background-color: #b94964" href="/createUser?new"><param name="new" value="">Создать нового пользователя</a>

                <a class="nav-link  active m-2 redColor"  style="background-color: #b94964" href="/aboutUs">О нас</a>
                <a class="redColor nav-link  active m-2" style="background-color: #b94964"  href="/login">Войти</a>
            </div>
        </security:authorize>
    </div>
</div>







</body>
</html>
