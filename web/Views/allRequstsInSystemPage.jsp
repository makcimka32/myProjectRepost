<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Максим
  Date: 28.05.2018
  Time: 0:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        .defaultButton
        {
            background-color: #b94964;
            color:black;
        }
      .inactiveLink
      {
          pointer-events: none;
          cursor: default;
      }
    </style>
</head>
<body>
<div class="container">
    <div class="row">
        <c:forEach var="request" items="${requestsEntities}">
            <div class="col-md-6 col-lg-4">
                <div class="card m-2 text-left  rounded border-secondary ">
                    <sf:form action="/" cssClass="m-1">
                        <h3 class="card-title text-center"> Id заявки:${request.requestId}</h3>
                        <c:out value="Тип заявки:${request.requestType}"/><br/>
                        <c:out value="Автор заявки:${request.usersEntity.username}"/><br/>
                        <c:out value="Статус выполнения:${request.workStatus}"/><br/>
                        <c:out value="Дата создания:${request.creationDate}"/><br/>
                        <c:if test="${request.worker!=null}">
                            <c:out value="Исполнитель:${request.worker}"/><br/>
                        </c:if>
                        <div class="nav nav-pills  justify-content-center">
                            <c:if test="${request.workStatus=='В обработке'}">
                                <a class="nav-link  active m-1" style="background-color: #b94964" href="/rejectRequest?requestId=${request.requestId}">Отклонить</a>
                                <a class="nav-link  active m-1" style="background-color: #b94964" href="/executeRequest/${request.requestId}?username=<security:authentication property="principal.username"/>">Исполнять</a>
                            </c:if>
                            <c:if test="${request.workStatus=='Отклонена'}">
                                <a class="nav-link  active m-1" style="background-color: #b94964" href="/handleRequest/${request.requestId}?username=<security:authentication property="principal.username"/>">Обработать</a>
                            </c:if>
                            <security:authentication property="principal.username"  var="tempUsername"/>
                            <c:if test="${request.workStatus=='Исполняется'&& request.worker==tempUsername}">
                                <a class="nav-link  active m-1" style="background-color: #b94964"  href="/rejectRequest?requestId=${request.requestId}">Отклонить</a>
                                <a class="nav-link  active m-1" style="background-color: #b94964" href="/handleRequest/${request.requestId}?username=<security:authentication property="principal.username"/>">Обработать</a>
                                <a class="nav-link  active m-1" style="background-color: #b94964" href="/performRequest/${request.requestId}?username=<security:authentication property="principal.username"/>">Выполнить</a>
                            </c:if>
                            <c:if test="${request.workStatus=='Выполнена'&& request.worker==tempUsername}">
                                <a class="nav-link  active m-1" style="background-color: #b94964" href="/rejectRequest?requestId=${request.requestId}">Отклонить</a>
                                <a class="nav-link  active m-1" style="background-color: #b94964" href="/handleRequest/${request.requestId}?username=<security:authentication property="principal.username"/>">Обработать</a>
                                <a class="nav-link  active m-1" style="background-color: #b94964" href="/executeRequest/${request.requestId}?username=<security:authentication property="principal.username"/>">Исполнять</a>
                            </c:if>
                            <br/><a class="nav-link  active m-1" style="background-color: #b94964" href="/requestDetail?requestId=${request.requestId}">См.Детали</a>
                        </div>
                    </sf:form>
                </div>
            </div>
        </c:forEach>
    </div>
   <div class="row mt-2 justify-content-center">
       <div class="nav nav-pills">
           <a class="nav-link  m-1" style="background-color: #b94964;color: black;" href="#">Первая</a>
           <a class="nav-link  m-1" style="background-color: #b94964;color: black;" href="#">Предыдущая</a>
           <a class="nav-link  m-1" style="background-color: #b94964;color: black;" href="#">1</a>
           <a class="nav-link  m-1" style="background-color: #b94964;color: black;" href="#">2</a>
           <a class="nav-link  m-1" style="background-color: #b94964;color: black;" href="#">3</a>
           <a class="nav-link  m-1" style="background-color: #b94964;color: black;" href="#">4</a>
           <a class="nav-link  m-1" style="background-color: #b94964;color: black;" href="#">5</a>
           <a class="nav-link  m-1" style="background-color: #b94964;color: black;" href="#">Следующая</a>
           <a class="nav-link  m-1" style="background-color: #b94964;color: black;" href="/allRequestInSystem?pageNumber=${endPageNumber}">Последняя</a>
       </div>
   </div>
</div>
</body>
</html>
