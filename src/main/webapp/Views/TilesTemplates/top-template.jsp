<%--
  Created by IntelliJ IDEA.
  User: Максим
  Date: 20.05.2018
  Time: 3:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<html>
<head>
    <title>Title</title>
    <style>
    .myLinkHome {
        color: white;

    }
    .myLinkHome:hover{
        color: white;
        text-decoration: none;
        }

    /* Large desktops and laptops */
      @media (min-width: 1000px) {
      .lowerThenMedium{
          display: none;

      }
      }
      @media (min-width: 300px) and (max-width:1000px) {
        .higherThenMedium{
            display: none;
        }
      }
       #myLinks{
           display: none;
       }

    </style>
</head>
<body>
<div class="higherThenMedium">
    <div class="row">
        <div class="col-4 my-auto topInfo">
            <div class="container text-white  text-center" style="background-color: #303161">
                <div class="row">
                    <div class="col-xl-8 m-auto">
                        <h2><a href="/"  class="myLinkHome"> БрянскГипроЗем</a></h2>
                    </div>
                    <div class="col-xl-4 m-auto text-center" style="font-size: 0.8rem;opacity: 0.9">
                        <p class="pt-1"><i class="fas fa-phone fa-2x"></i> 41-17-28/ 41-17-41</p>
                        <p ><i class="far fa-envelope-open fa-2x"></i> brjanskgiprozem@mail.ru</p>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-8 my-auto">

            <security:authorize access="isAuthenticated()">
               <%-- <p class="text-right text-white" style="font-size: 1.5rem;">Добро пожаловать <security:authentication property="principal.username"/>!</p>--%>

                <div class="nav justify-content-end">
                    <security:authorize access="hasRole('ROLE_WORKER_USER')">
                        <a class="myLinkButton m-2"  href="/createNewMessage">Создать новость</a>
                    </security:authorize>
                    <security:authorize access="hasRole('ROLE_DEFAULT_USER')">
                        <a class="myLinkButton m-2"  href="/createNewRequest">Создать заказ</a>
                    </security:authorize>
                    <security:authorize  access="hasRole('ROLE_WORKER_USER')">
                        <a class="myLinkButton m-2"  href="/allRequestInSystem">Заявки в системе</a>
                        <a class="myLinkButton m-2 "   href="/createAdminUser?new"><param name="new" value="">Регистрация</a>
                    </security:authorize>
                    <a class="myLinkButton m-2"  href="/privateOffice?username=<security:authentication property="principal.username"/>">Личный кабинет</a>
                    <a class="myLinkButton m-2 redColor" href="/aboutUs">О нас</a>
                    <a class="myLinkButton m-2"  href="/j_spring_security_logout">Выйти</a>
                </div>
            </security:authorize>
            <security:authorize access="isAnonymous()">
                <div class="nav justify-content-end ">
                    <a class="myLinkButton m-1 "   href="/createUser?new"><param name="new" value="">Регистрация</a>
                    <a class="myLinkButton m-1 "   href="/aboutUs">О нас</a>
                    <a class="myLinkButton  m-1 "  href="/login">Войти</a>
                </div>
            </security:authorize>

        </div>
    </div>
</div>
<div class="lowerThenMedium">
    <div class="row">
        <div class="col-9 m-auto text-center" >
            <h4><a href="/"  class="myLinkHome"> БрянскГипроЗем</a></h4>
            <div  style="color: white;font-size: 0.8rem;opacity: 0.9">
                <p class="pt-1"><i class="fas fa-phone fa-2x"></i> 41-17-28/ 41-17-41</p>
                <p ><i class="far fa-envelope-open fa-2x"></i> brjanskgiprozem@mail.ru</p>
            </div>
        </div>
        <div class="col-3 m-auto text-center" style="color:white;">
            <i class="fa fa-bars fa-2x" id="myIconMobile"></i>
        </div>
        <div class="row " style="width: 100%">
            <div class="col-12">
                <div id="myLinks">
                    <security:authorize access="isAuthenticated()">
                        <div class="nav justify-content-end">
                            <security:authorize access="hasRole('ROLE_WORKER_USER')">
                                <a class="myLinkButton m-2"  href="/createNewMessage">Создать новость</a>
                            </security:authorize>
                            <security:authorize access="hasRole('ROLE_DEFAULT_USER')">
                                <a class="myLinkButton m-2"  href="/createNewRequest">Создать заказ</a>
                            </security:authorize>
                            <security:authorize  access="hasRole('ROLE_WORKER_USER')">
                                <a class="myLinkButton m-2"  href="/allRequestInSystem">Заявки в системе</a>
                                <a class="myLinkButton m-2 "   href="/createAdminUser?new"><param name="new" value="">Регистрация</a>
                            </security:authorize>
                            <a class="myLinkButton m-2"  href="/privateOffice?username=<security:authentication property="principal.username"/>">Личный кабинет</a>
                            <a class="myLinkButton m-2 redColor" href="/aboutUs">О нас</a>
                            <a class="myLinkButton m-2"  href="/j_spring_security_logout">Выйти</a>
                        </div>
                    </security:authorize>
                    <security:authorize access="isAnonymous()">
                        <div class="nav justify-content-end ">
                            <a class="myLinkButton m-1 "   href="/createUser?new"><param name="new" value="">Регистрация</a>
                            <a class="myLinkButton m-1 "   href="/aboutUs">О нас</a>
                            <a class="myLinkButton  m-1 "  href="/login">Войти</a>
                        </div>
                    </security:authorize>

                </div>
            </div>
        </div>
    </div>
</div>




</body>
<script>
function showMyLinks() {

    if($("#myLinks").css("display")=="none")
    {
        $("#myLinks").css("display","block");

    }
    else {
        $("#myLinks").css("display","none");
    }

}
$(function () {
    $("#myIconMobile").click(showMyLinks)
})

</script>
</html>
