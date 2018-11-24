<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Максим
  Date: 28.05.2018
  Time: 19:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>


</head>
<body>
<div class="container-fluid">
    <div class="row ">
        <div class="col-3  justify-content-center position-fixed ">
            <div class="nav nav-pills justify-content-center">
                <div class="row  justify-content-center">
                    <div class="col-lg-8">
                        <a class="myLinkButton m-1"  href="/privateOffice?username=<security:authentication property='principal.username'/>">Мои заявки</a>
                    </div>
                    <div class="col-lg-8">
                        <a class="myLinkButton m-1"  href="/privateOfficeInfo?username=<security:authentication property='principal.username'/>">Личные данные</a>
                    </div>
                    <div class="col-lg-8">
                        <a class="myLinkButton m-1"  href="/">Вернуться</a>
                    </div>
                </div>
            </div>

        </div>
        <div class="col-9 offset-3 ">
            <div class="col-12 text-center">
                <%--@elvariable id="requestEntity" type="Database.Entities.RequestsEntity"--%>
                <sf:form action="/privateOffice" modelAttribute="requestEntity" method="post" >
                    <h2 class="">Id заявки:${requestEntity.requestId}</h2>
                    <c:out value="Серия паспорта:${requestEntity.pasportSeria}"/><br/>
                    <c:out value="Номер паспорта:${requestEntity.pasportNumber}"/><br/>
                    <c:out value="Кем выдан:${requestEntity.pasportWhoLet}"/><br/>
                    <c:out value="Когда выдан:${requestEntity.pasportDate}"/><br/>
                    <c:out value="СНИЛС:${requestEntity.snils}"/><br/>
                    <c:out value="Тип заявки:${requestEntity.requestType}"/><br/>
                    <c:out value="Автор заявки:${requestEntity.usersEntity.username}"/><br/>
                    <c:out value="Сумма заявки(руб.):${requestEntity.price}"/><br/>
                    <c:out value="Статус выполнения:${requestEntity.workStatus}"/><br/>
                    <c:if test="${requestEntity.worker!=null}">
                        <c:out value="Исполнитель:${requestEntity.worker}"/><br/>
                    </c:if>
                    <c:out value="Дата создания:${requestEntity.creationDate}"/><br/>
                    <c:if test="${requestEntity.messageToCustomer!=null}">
                        <div class="alert alert-warning col-8 justify-content-center my-auto mx-auto text-left" >
                          <p>
                              <strong>Причина отказа:</strong>
                              <c:out value="${requestEntity.messageToCustomer}"/>
                          </p>

                        </div>
                    </c:if>
                    <security:authentication property="principal.username" var="tempusername"/>
                    <c:if test="${requestEntity.usersEntity.username==tempusername}">
                        <input type="hidden" value="${requestEntity.requestId}" name="id">
                        <input type="submit" class="btn btn-success" value="Редактировать">
                    </c:if>
                    <div class="nav  justify-content-center">
                        <security:authorize access="hasRole('ROLE_WORKER_USER')">
                            <c:if test="${requestEntity.workStatus=='В обработке'}">
                                <a class="myLinkButton m-1"  href="/rejectRequest?requestId=${requestEntity.requestId}">Отклонить</a>
                                <a class="myLinkButton m-1"  href="/executeRequest/${requestEntity.requestId}?username=<security:authentication property="principal.username"/>">Исполнять</a>
                            </c:if>
                            <c:if test="${requestEntity.workStatus=='Отклонена'}">
                                <a class="myLinkButton m-1"  href="/handleRequest/${requestEntity.requestId}?username=<security:authentication property="principal.username"/>">Обработать</a>
                            </c:if>
                            <security:authentication property="principal.username"  var="tempUsername"/>
                            <c:if test="${requestEntity.workStatus=='Исполняется'&& requestEntity.worker==tempUsername}">
                                <a class="myLinkButton m-1"  href="/rejectRequest?requestId=${requestEntity.requestId}">Отклонить</a>
                                <a  class="myLinkButton m-1" href="/handleRequest/${requestEntity.requestId}?username=<security:authentication property="principal.username"/>">Обработать</a>
                                <a class="myLinkButton m-1" href="/performRequest/${requestEntity.requestId}?username=<security:authentication property="principal.username"/>">Выполнить</a>
                            </c:if>
                            <c:if test="${requestEntity.workStatus=='Выполнена'&& requestEntity.worker==tempUsername}">
                                <a class="myLinkButton m-1"  href="/rejectRequest?requestId=${requestEntity.requestId}">Отклонить</a>
                                <a class="myLinkButton m-1"  href="/handleRequest/${requestEntity.requestId}?username=<security:authentication property="principal.username"/>">Обработать</a>
                                <a class="myLinkButton m-1" href="/executeRequest/${requestEntity.requestId}?username=<security:authentication property="principal.username"/>">Исполнять</a>
                            </c:if>
                        </security:authorize>
                    </div>

                    <div  class="row justify-content-center">
                        <div class="col-12">
                            <div class="row justify-content-center">
                                <c:forEach var="item" items="${fileNames}">

                                    <div id="${item}" class="col-md-6 col-lg-4">
                                        <!-- <img   class="rounded img-fluid m-1 myImg " src=" /getImage?imageName=${item}&username=${requestEntity.usersEntity.username}&requestId=${requestEntity.requestId}" alt="${item}"/>-->
                                        <img  class="rounded img-fluid m-1 myImg " src="/images/${requestEntity.usersEntity.username}/${requestEntity.requestId}/${item}" alt="${item}"/>

                                        <c:if test="${requestEntity.usersEntity.username==tempusername}">
                                            <div class="nav   justify-content-center">
                                                <!--<a class="nav-link  active m-1 delImage" style="background-color: #b94964" href="/deleteImage?imageName=${item}&username=<security:authentication property="principal.username"/>&requestId=${requestEntity.requestId}">Удалить</a>-->
                                                <a class="myLinkButton m-1 " onclick="function exec() {
                                                        $.get('/deleteImage?imageName=${item}&username=<security:authentication property="principal.username"/>&requestId=${requestEntity.requestId}')};
                                                        exec(); document.getElementById('${item}').remove(); " href="#" return false;>Удалить</a>
                                            </div>
                                        </c:if>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </sf:form>


            </div>
        </div>
    </div>
</div>
</div>
</body>
</html>
