<%--
  Created by IntelliJ IDEA.
  User: Максим
  Date: 21.05.2018
  Time: 13:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
    <title>Вход в систему</title>
</head>
<body>
<fmt:setBundle basename="messages" />
<div class="container justify-content-center">
    <h2 class="text-center">Вход в систему</h2>
</div>
<div class="container ">
    <div class="row justify-content-center">
       <!-- <div class="col-6">-->

            <sf:form method="post" class="signin text-center" action="/j_spring_security_check" >
                <c:if test="${param.login_error != null}">
                    <div id="error">
                        <p class="small  text-danger">Данные на форме заполненны некорректно</p>
                    </div>
                </c:if>

                <label for="username_or_email" >Логин пользователя</label><br/>
                <input id="username_or_email"        name="j_username"  type="text" /><br/>

                <label for="password" >Пароль</label><br/>
                <input id="password"    name="j_password"      type="password" /><br/>

                <small ><a href="/reset">Забыли пароль?</a></small><br/>

                <input id="remember_me" name="_spring_security_remember_me" type="checkbox"/>
                <label  for="remember_me"     class="inline">Запомнить меня</label><br/>
                <!-- Флажок "запомнить меня" -->

                <input name="commit" class="btn btn-outline-success" type="submit" value="Войти" />

            </sf:form>
        <!--</div>-->
    </div>





    <script type="text/javascript">  document.getElementById('username_or_email').focus(); </script>
</div>

</body>
</html>
