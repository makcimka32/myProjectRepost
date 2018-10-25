<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Максим
  Date: 21.08.2018
  Time: 1:18
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
        Создание новости
    </h2>
</div>
<div class="container">
    <div class="row justify-content-center">
        <%--@elvariable id="userMessagesEntity" type="Database.Entities.UserMessagesEntity"--%>
        <sf:form  method="POST" modelAttribute="userMessagesEntity" action="/createMessage">
            <div class="form-group text-center">
                 <sf:hidden path="messageId"/>
                <div class="row justify-content-center">
                    <div class="m-2 col-10">
                        <label for="titleMessage" class="control-label">Заголовок новости:</label>
                        <sf:input id="titleMessage" class="form-control" path="titleMessage" data-toggle="tooltip" data-placement="bottom"  title="Данное поле должно состоять от 1 до 200 символов"/>
                        <sf:errors path="titleMessage" cssClass="small text-danger"/>
                    </div>
                </div>
                <div class="m-2">
                    <label for="textMessage" class="control-label">Текст сообщения:</label>
                    <sf:textarea path="textMessage" class="form-control" cols="80" rows="10" data-toggle="tooltip" data-placement="bottom"  title="Данное поле должно состоять от 1 до 4000 символов"/>
                    <sf:errors path="textMessage" cssClass="small text-danger"/>
                </div>
                <input type="submit" class="btn btn-success" value="Сохранить">
            </div>
        </sf:form>
    </div>
</div>
<script>

</script>
</body>
</html>
