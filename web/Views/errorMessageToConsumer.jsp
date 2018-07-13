<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Максим
  Date: 10.06.2018
  Time: 2:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="container jusitfy-content-center">
    <div class="row justify-content-center  text-center">
        <%--@elvariable id="requestEntity" type="Database.Entities.RequestsEntity"--%>
        <sf:form modelAttribute="requestEntity" method="post" action="/rejectRequest">
            <sf:hidden path="requestId"/>
            <sf:hidden path="pasportSeria"/>
            <sf:hidden path="pasportNumber"/>
            <sf:hidden path="pasportWhoLet"/>
            <sf:hidden path="pasportDate"/>
            <sf:hidden path="snils"/>
            <sf:hidden path="requestType"/>
            <sf:hidden path="workStatus"/>
            <sf:hidden path="worker"/>
            <sf:hidden path="creationDate"/>

            <h2 class="">Id заявки:${requestEntity.requestId}</h2>
            <c:out value="Серия паспорта:${requestEntity.pasportSeria}"/><br/>
            <c:out value="Номер паспорта:${requestEntity.pasportNumber}"/><br/>
            <c:out value="Кем выдан:${requestEntity.pasportWhoLet}"/><br/>
            <c:out value="Когда выдан:${requestEntity.pasportDate}"/><br/>
            <c:out value="СНИЛС:${requestEntity.snils}"/><br/>
            <c:out value="Тип заявки:${requestEntity.requestType}"/><br/>
           <c:out value="Автор заявки:${requestEntity.usersEntity.username}"/><br/>
            <c:out value="Статус выполнения:${requestEntity.workStatus}"/><br/>
            <c:if test="${requestEntity.worker!=null}">
                <c:out value="Исполнитель:${requestEntity.worker}"/><br/>
            </c:if>
            <c:out value="Дата создания:${requestEntity.creationDate}"/><br/>
            <h4>Опишите причину отказа</h4>
            <c:if test="${errorSize!=null}">
                <p class="small text-danger">${errorSize}</p>
            </c:if>
            <sf:textarea id="messageToCustomer" path="messageToCustomer" rows="5" cols="40"></sf:textarea><br/>
            <button type="submit">Отправить</button>
        </sf:form>
    </div>
</div>

</body>
</html>
