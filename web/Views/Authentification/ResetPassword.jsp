<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Максим
  Date: 21.05.2018
  Time: 21:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Обновление пароля</title>
</head>
<body>
<div id="myBlock">
    <h3>Смена пароля для пользователя ${usersEntity.username} </h3>
    <sf:form action="/resetPassword" modelAttribute="usersEntity">
        <label for="password">Пароль</label>
        <sf:password path="password" id="password"/><br/>
        <sf:errors path="password"/><br/>
        <label for="repeatPassword">Повторите пароль:</label>
        <input type="password" name="repeatPassword" id="repeatPassword">
        <input type="submit" onclick="


comparePasswords()" value="Подтвердить">
    </sf:form>

</div>
<script>
    function comparePasswords() {
        if(document.getElementById('password').innerText!=document.getElementById('repeatPassword').innerText)
        {

            var elem= document.getElementById('myBlock');

            var error=document.createElement('p');
            var errorText=document.createTextNode('Пароли не совпадают');
            error.appendChild(errorText);
            elem.appendChild(error);

        }
    }
</script>
</body>
</html>
