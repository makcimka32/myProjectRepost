<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Максим
  Date: 20.05.2018
  Time: 13:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="container">
    <h2 class="text-center">
        Создайте нового пользователя
    </h2>
</div>
<div class="container">
    <div class="row  justify-content-center">

            <%--@elvariable id="usersEntity" type="Database.Entities.UsersEntity"--%>
            <sf:form  method="POST" modelAttribute="usersEntity" action="/createUser">
                <sf:hidden path="userId"/>
                <div class="form-group justify-content-center">
                   <div>
                       <label for="firstName" class="col-form-label">Имя:</label>
                       <sf:input path="firstName" id="firstName" cssClass="form-control " placeholder="Максим" data-toggle="tooltip" data-placement="bottom"  title="Имя должно состоять от 3-20 символов" />
                       <sf:errors path="firstName" cssClass="small text-danger"/>
                   </div>
                    <div>
                        <label for="secondName" class="control-label">Фамилия:</label>
                        <sf:input path="secondName" id="secondName" cssClass="form-control" placeholder="Гавриков"  data-toggle="tooltip" data-placement="bottom"  title="Фамилия должна состоять от 3-20 символов"/>
                        <sf:errors path="secondName" cssClass="small text-danger"/>
                    </div>
                    <div>
                        <label for="phoneNumber" class="control-label">Номер телефона:</label>
                        <sf:input path="phoneNumber" cssClass="form-control " id="phoneNumber" placeholder="8-920-888-88-88" data-toggle="tooltip" data-placement="bottom"  title="Номер телефона должен быть формата 8-920-888-88-88"/>
                        <sf:errors path="phoneNumber" cssClass="small text-danger"/>
                    </div>
                    <security:authorize  access="isAnonymous()">
                        <div>
                            <label for="username" class="control-label">Логин:</label>
                            <sf:input path="username" cssClass="form-control" id="username" placeholder="GavrikovMaks"  data-toggle="tooltip" data-placement="bottom"  title="Логин должен состоять от 3-20 символов и только из букв Английского алфавита"/>
                            <sf:errors path="username" cssClass="small text-danger"/>
                            <C:if test="${usernameErrorMessage!=null}"><p class="small text-danger">${usernameErrorMessage}</p></C:if>
                        </div>
                    </security:authorize>
                    <div>
                        <label for="password" class="control-label">Пароль:</label>
                        <sf:password path="password" cssClass="form-control" id="password"  data-toggle="tooltip" data-placement="bottom"  title="Пароль должен состоять от 6-20 символов"/>
                        <sf:errors path="password" cssClass="small text-danger"/>
                    </div>
                    <div>
                        <label for="email" class="control-label">Почта:</label>
                        <sf:input path="email" type="email" cssClass="form-control" placeholder="testmail@gmail.com" id="email"  data-toggle="tooltip" data-placement="bottom"  title="Почта должна быть формата xxxx@xxx.ru/com/net "/>
                        <sf:errors path="email" cssClass="small text-danger"/>
                        <C:if test="${emailErrorMessage!=null}"><p class="small text-danger">${emailErrorMessage}</p></C:if>
                    </div>
                    <div>
                        <label class="control-label" for="emailNewsletter">Подписаться на новости:</label>
                        <sf:checkbox path="emailNewsletter" id="emailNewsletter"/>
                    </div>
                    <security:authorize access="isAnonymous()">
                        <div>
                            <C:if test="${privacyError!=null}"><p class="small text-danger">${privacyError}</p></C:if>
                            <label class="control-label" for="emailNewsletter">Я принимаю <a href="/BRGZPrivacy" target="_blank">пользовательское соглашение</a>:</label>
                            <input type="checkbox" name="privacyIndicator">
                        </div>
                    </security:authorize>
                </div>
                <input type="submit" class="btn btn-success" value="Сохранить">
            </sf:form>

    </div>
</div>
</body>
</html>
