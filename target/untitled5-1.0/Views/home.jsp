<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Максим
  Date: 20.05.2018
  Time: 2:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-12 text-center">Блок с картинкой для указания процесса выполнения заказа</div>
        <div class="col-12 justify-content-center">
            <h1 class="text-center display-4">Наши новости</h1>
            <hr>
            <div class="row">
                <c:forEach var="message" items="${userMessagesEntities}">
                    <div class="col-md-6">
                        <div class="card rounded border-secondary text-left m-2">
                            <h2 class="text-center ">${message.titleMessage}</h2>
                            <p class="mx-2" style="color:darkgray">Автор:${message.usersEntity.secondName} ${message.usersEntity.firstName} <br/>
                                Дата редактирования:${message.editDate}</p>
                            <p class="mx-2 text-justify">${message.textMessage}</p>
                            <security:authorize access="hasRole('ROLE_WORKER_USER')">
                                <div class="row">
                                    <div class="col-md-6 text-center">
                                        <a class="btn btn-outline-primary m-2" style="width: 80%"href="/editNews?messageId=${message.messageId}">Редактировать</a>
                                    </div>
                                    <div class="col-md-6 text-center ">
                                        <form action="/deleteNews?messageId=${message.messageId}" method="post">
                                            <button  class="btn btn-outline-danger m-2"style="width: 80%">Удалить</button>
                                        </form>

                                    </div>
                                </div>
                            </security:authorize>
                        </div>
                    </div>

                </c:forEach>
            </div>
        </div>
    </div>
</div>
</body>
</html>
