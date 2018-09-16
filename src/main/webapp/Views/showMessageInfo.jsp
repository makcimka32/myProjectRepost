<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Максим
  Date: 08.09.2018
  Time: 22:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="container">
    <div class="row justify-content-center" >
        <div class="col-12 text-left card m-4">
            <h4 class="m-4"><strong>${mainNews.titleMessage}</strong></h4>
            <p class="my-2 mx-4"><i class="far fa-user fa-2x"></i> : ${mainNews.usersEntity.username} <i class="far fa-calendar-alt fa-2x"></i> :<time datatype="">${mainNews.editDate}</time> </p>
            <p class="my-2 mx-4">${mainNews.textMessage}</p>
            <security:authorize access="hasRole('ROLE_WORKER_USER')">
                <div class="row">
                    <div class="col-md-6 text-center">
                        <a class="btn btn-outline-primary m-2" style="width: 80%"href="/editNews?messageId=${mainNews.messageId}">Редактировать</a>
                    </div>
                    <div class="col-md-6 text-center ">
                        <form action="/deleteNews?messageId=${mainNews.messageId}" method="post">
                            <button  class="btn btn-outline-danger m-2"style="width: 80%">Удалить</button>
                        </form>
                    </div>
                </div>
            </security:authorize>
        </div>
    </div>
    <div class="row justify-content-center">
        <div class="col-12">
            <h4 class="m-2 text-center"><strong>Смотрите также</strong></h4>
        </div>
        <div class="row justify-content-center">
            <c:forEach var="message" items="${userMessagesEntities}">
                <div class="col-md-6">
                    <div class="card text-left m-2 news" onclick="window.location=('/news?messageId=${message.messageId}')">
                        <p class="m-2 text-left " style="font-size: 14pt;"><strong>${message.titleMessage}</strong></p>
                        <p class="mx-2" style="color:darkgray">Автор:${message.usersEntity.secondName} ${message.usersEntity.firstName} <br/>
                            Дата редактирования:${message.editDate}</p>
                    </div>
                </div>
            </c:forEach>
        </div>

    </div>
</div>
</body>
</html>
