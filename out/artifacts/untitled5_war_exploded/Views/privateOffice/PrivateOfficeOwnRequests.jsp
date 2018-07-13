<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Максим
  Date: 24.05.2018
  Time: 0:44
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
        <div class="col-3  justify-content-center position-fixed " >
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
            <c:forEach var="request" items="${listRequests}">
                <%--@elvariable id="requestsEntity" type="Database.Entities.RequestsEntity"--%>
                <div class="row justify-content-center">
                    <div class="col-10">
                        <sf:form action="/privateOffice" modelAttribute="requestsEntity" method="post" >
                            <input type="hidden" value="${request.requestId}" name="id">
                            <h2>Номер заявки: ${request.requestId}</h2>
                            <c:out value="Дата последних изменений: ${request.creationDate}"/><br/>
                            <c:out value="Тип проводимых работ: ${request.requestType}"/><br/>
                            <c:out value="Статус выполнения работы: ${request.workStatus}"/><br/>

                            <a href="/requestDetail?requestId=${request.requestId}">См.Детали</a><br/>
                            <div class="row">
                                <div class="col-12">
                                    <div class="row justify-content-center">
                                        <c:forEach var="temp" items="${mapFiles}">
                                            <c:if test="${temp.key==request.requestId}">
                                                <c:forEach var="imageName" items="${temp.value}">
                                                    <div id="${imageName}" class="col-md-6 col-lg-4">
                                                        <img class="rounded img-fluid m-1 myImg" src="/images/${request.usersEntity.username}/${request.requestId}/${imageName}" alt="${imageName}"/>
                                                        <security:authentication property="principal.username" var="tempUsername"/>
                                                        <div  class="nav nav-pills  justify-content-center">
                                                            <c:if test="${request.usersEntity.username==tempUsername}">
                                                             <!--   <a class="nav-link  active m-1" style="background-color: #b94964" href="/deleteImage?imageName=${imageName}&username=${request.usersEntity.username}&requestId=${request.requestId}">Удалить</a>-->
                                                                <a class="nav-link  active m-1" style="background-color: #b94964" href="#" onclick="function exec() {
                                                                  $.get('/deleteImage?imageName=${imageName}&username=${request.usersEntity.username}&requestId=${request.requestId}');};exec();document.getElementById('${imageName}').remove(); return false;">Удалить</a>

                                                            </c:if>
                                                        </div>
                                                    </div>
                                                    <!-- The Modal -->
                                                    <div id="myModal" class="modal">

                                                        <!-- The Close Button -->
                                                        <span class="close">&times;</span>

                                                        <!-- Modal Content (The Image) -->
                                                        <img class="modal-content" id="img01">

                                                        <!-- Modal Caption (Image Text) -->
                                                        <div id="caption"></div>
                                                    </div>
                                                </c:forEach>

                                            </c:if>
                                        </c:forEach>

                                    </div>
                                </div>
                            </div>
                        </sf:form>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>

</body>
</html>
