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
    <style>
        .inactiveLink
        {
            pointer-events: none;
            cursor: default;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-12 text-center">
            <h1 class="text-center display-4"><small>Оформить заявку просто</small></h1>
            <h3 class="text-center lead">При оформлении заявки через сайт скидка 5%</h3>
            <div class="row justify-content-center">
                <div class="col-md-8 ">
                    <ul class="text-justify list-group">
                        <li class="list-group-item list-group-item-primary">1.Пройти процесс регистрации в системе</li>
                        <li class="list-group-item list-group-item-primary">2.Оформить заявку, прикрепив все необходимые документы</li>
                        <li class="list-group-item list-group-item-primary">3.Оплатить необходимую сумму по полученным на указанную электронную почту реквизитам</li>
                        <li class="list-group-item list-group-item-primary">4.Получить уведомление об окончании работ и забрать результаты работы на почте или в офисе</li>
                    </ul>
                </div>
            </div>
            <hr>
        </div>
        <div class="col-12 text-center">
            <h1 class="text-center display-4"><small>Почему мы?</small></h1>
            <div class="row justify-content-center">
                <div class="col-12 rounded border border-secondary m-2" style="background-color: white">
                    <h3 class="text-center"><strong>Низкие цены</strong></h3>
                    <div class="row justify-content-center">
                        <div class="col-md-3 m-auto">
                            <h4 class="text-center">Межевание земельных участков</h4>
                            <img src="/resources/images/worktTypes/inwentaryzacje_powykonawcze_obiektow_budowlanych-1024x683.jpg" class="img-thumbnail rounded m-auto m-2 img-fluid">
                            <div class="text-left">
                                Межевание земельных участков различных категорий земель разрешенного использования и разработка межевых планов по заявкам юридических и физических лиц для целей их постановки на кадастровый учет
                                <br/>
                                <strong>Цена:7000 рублей</strong>
                            </div>
                        </div>
                        <div class="col-md-3 m-auto">
                            <h4 class="text-center">Разработка проектов межевания</h4>
                            <img src="/resources/images/worktTypes/РазработкаПроектовМежевания.jpg" class="img-thumbnail rounded m-auto m-2 img-fluid ">
                            <div class="text-left">
                                Разработка проектов межевания и межевых планов на выделение земель сельскохозяйственного назначения, включая и земельные доли
                                <br/>
                                <strong>Цена:1000 рублей за 1 гектар </strong>
                            </div>
                        </div>
                        <div class="col-md-3 m-auto">
                            <h4 class="text-center">Подготовка и оформление технических планов</h4>
                            <img src="/resources/images/worktTypes/Технический%20план.jpg" class="img-thumbnail rounded m-auto m-2 img-fluid">
                            <div class="text-left">
                                Подготовка и оформление технических планов на жилые и производственные здания, сооружения, объекты незавершённого строительства с целью постановки их на кадастровый учет
                                <br/>
                                <strong>Цена:5000 рублей</strong>
                            </div>
                        </div>
                        <div class="col-md-3 m-auto">
                            <h4 class="text-center">Вынос границ</h4>
                            <img src="/resources/images/worktTypes/Топографо-графич.jpg" class="img-thumbnail rounded m-auto m-2 img-fluid">
                            <div class="text-left">
                                Вынос в натуру границ земельных участков, топографо-геодезические работы
                                <br/>
                                <strong>Цена:1500 рублей за 1 точку</strong>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <div class="row justify-content-center">
                <div class="col rounded border border-secondary m-2" style="background-color: white">
                    <h3><strong>Наши специалисты и оборудование</strong></h3>
                    <div class="text-justify">
                        Штат сотрудников составляют высококвалифицированные специалисты,прошедшие аттестацию кадастрового инженера.Все выполняемые работы производятся при помощи высокотехнологичного оборудовани
                    </div>
                </div>
                <div class="col rounded border border-secondary m-2" style="background-color: white">
                    <h3><strong>Наши партнеры</strong></h3>
                    <div class="text-justify">
                        Среди наших партнеров:
                        Управление Федерального агентства кадастра объектов недвижимости по Брянской области.
                        ОАО «Магистральные нефтепроводы «Дружба»
                        Управление имущественных отношений Брянской и Курской области.
                        ОАО «Брянскэнерго»
                        Упрдор Москва-Харьков
                        ОАО«Связьстрой-1»
                        ООО "Газпром Трансгаз Москва" и др.
                    </div>
                </div>
                <div class="col rounded border border-secondary m-2" style="background-color: white">
                    <h3><strong>Сроки и отзывы</strong></h3>
                    <div class="text-justify">
                        Все работы выполняются в кратчайшие сроки.За долгое время существования наша компания выполнила тысячи землеустроительных проектов и отлично зарекомандовала себя на рынке.
                    </div>
                </div>
            </div>
            <hr>
        </div>
        <div class="col-12 justify-content-center">
            <h1 class="text-center display-4"><small>Наши новости</small></h1>
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
            <c:if test="${!empty(userMessagesEntities)}">
                <div class="row mt-2 justify-content-center">
                    <div class="nav nav-pills">
                        <a class="nav-link  m-1" id="firstPage" style="background-color: #b94964;color: black;" href="#">Первая</a>
                        <a class="nav-link  m-1" id="prevPage" style="background-color: #b94964;color: black;" href="#">Предыдущая</a>
                        <a class="nav-link  m-1" id="pageNumber1" style="background-color: #b94964;color: black;" href="#">1</a>
                        <a class="nav-link  m-1" id="pageNumber2" style="background-color: #b94964;color: black;" href="#">2</a>
                        <a class="nav-link  m-1" id="pageNumber3" style="background-color: #b94964;color: black;" href="#">3</a>
                        <a class="nav-link  m-1" id="pageNumber4" style="background-color: #b94964;color: black;" href="#">4</a>
                        <a class="nav-link  m-1" id="pageNumber5" style="background-color: #b94964;color: black;" href="#">5</a>
                        <a class="nav-link  m-1" id="nextPage" style="background-color: #b94964;color: black;" href="#">Следующая</a>
                        <a class="nav-link  m-1" id="lastPage" style="background-color: #b94964;color: black;" href="/allRequestInSystem?pageNumber=${endPageNumber}">Последняя</a>
                    </div>
                </div>
            </c:if>
        </div>
    </div>
</div>
<script>
    $(function () {
        //если первая страница
        if((${pageNumber})==0)
        {
            $('#firstPage').addClass('inactiveLink disabled');
            $('#prevPage').addClass('inactiveLink disabled');
            $('#pageNumber1').css('color','white');
            $('#pageNumber1').prop('href','/');
            var differenceBetweenPages=${endPageNumber}-${pageNumber};
            switch (differenceBetweenPages)
            {
                case 0:
                    $('#pageNumber2').remove();
                    $('#pageNumber3').remove();
                    $('#pageNumber4').remove();
                    $('#pageNumber5').remove();
                    $('#nextPage').addClass('inactiveLink disabled');
                    $('#lastPage').addClass('inactiveLink disabled');
                    break;
                case 1:
                    $('#pageNumber2').prop('href','/?pageNumber=${pageNumber+1}');
                    $('#pageNumber3').remove();
                    $('#pageNumber4').remove();
                    $('#pageNumber5').remove();
                    $('#nextPage').prop('href','/?pageNumber=${pageNumber+1}');
                    $('#lastPage').prop('href','/?pageNumber=${endPageNumber}');
                    break;
                case 2:
                    $('#pageNumber2').prop('href','/?pageNumber=${pageNumber+1}');
                    $('#pageNumber3').prop('href','/?pageNumber=${pageNumber+2}');
                    $('#pageNumber4').remove();
                    $('#pageNumber5').remove();
                    $('#nextPage').prop('href','/?pageNumber=${pageNumber+1}');
                    $('#lastPage').prop('href','/?pageNumber=${endPageNumber}');
                    break;
                case 3:
                    $('#pageNumber2').prop('href','/?pageNumber=${pageNumber+1}');
                    $('#pageNumber3').prop('href','/?pageNumber=${pageNumber+2}');
                    $('#pageNumber4').prop('href','/?pageNumber=${pageNumber+3}');
                    $('#pageNumber5').remove();
                    $('#nextPage').prop('href','/?pageNumber=${pageNumber+1}');
                    $('#lastPage').prop('href','/?pageNumber=${endPageNumber}');
                    break;
                default:
                    $('#pageNumber2').prop('href','/?pageNumber=${pageNumber+1}');
                    $('#pageNumber3').prop('href','/?pageNumber=${pageNumber+2}');
                    $('#pageNumber4').prop('href','/?pageNumber=${pageNumber+3}');
                    $('#pageNumber5').prop('href','/?pageNumber=${pageNumber+4}');
                    $('#nextPage').prop('href','/?pageNumber=${pageNumber+1}');
                    $('#lastPage').prop('href','/?pageNumber=${endPageNumber}');
                    break;
            }

        }
        //если вторая страница
        else if((${pageNumber})==1)
        {
            $('#firstPage').prop('href','/?pageNumber=0');
            $('#prevPage').prop('href','/?pageNumber=${pageNumber-1}');
            $('#pageNumber1').prop('href','/?pageNumber=${pageNumber-1}')
            $('#pageNumber2').css('color','white');
            $('#pageNumber2').prop('href','/?pageNumber=${pageNumber}');
            var differenceBetweenPages=${endPageNumber}-${pageNumber};
            switch (differenceBetweenPages)
            {
                case 0:
                    $('#pageNumber3').remove();
                    $('#pageNumber4').remove();
                    $('#pageNumber5').remove();
                    $('#nextPage').addClass('inactiveLink disabled');
                    $('#lastPage').addClass('inactiveLink disabled');
                    break;
                case 1:
                    $('#pageNumber3').prop('href','/?pageNumber=${pageNumber+1}');
                    $('#pageNumber4').remove();
                    $('#pageNumber5').remove();
                    $('#nextPage').prop('href','/?pageNumber=${pageNumber+1}');
                    $('#lastPage').prop('href','/?pageNumber=${endPageNumber}');
                    break;
                case 2:
                    $('#pageNumber3').prop('href','/?pageNumber=${pageNumber+1}');
                    $('#pageNumber4').prop('href','/?pageNumber=${pageNumber+2}');
                    $('#pageNumber5').remove();
                    $('#nextPage').prop('href','/?pageNumber=${pageNumber+1}');
                    $('#lastPage').prop('href','/?pageNumber=${endPageNumber}');
                    break;
                default:
                    $('#pageNumber3').prop('href','/?pageNumber=${pageNumber+1}');
                    $('#pageNumber4').prop('href','/?pageNumber=${pageNumber+2}');
                    $('#pageNumber5').prop('href','/?pageNumber=${pageNumber+3}');
                    $('#nextPage').prop('href','/?pageNumber=${pageNumber+1}');
                    $('#lastPage').prop('href','/?pageNumber=${endPageNumber}');
                    break;
            }
        }
        //если последняя страница
        else if((${pageNumber})==${endPageNumber})
        {   $('#firstPage').prop('href','/?pageNumber=0');
            $('#prevPage').prop('href','/?pageNumber=${pageNumber-1}');
            $('#lastPage').addClass('inactiveLink disabled');
            $('#nextPage').addClass('inactiveLink disabled');

            switch (${endPageNumber})
            {
                case 0:
                    $('#pageNumber1').css('color','white');
                    $('#pageNumber1').prop('href','/?pageNumber=${endPageNumber}');
                    $('#pageNumber2').remove();
                    $('#pageNumber3').remove();
                    $('#pageNumber4').remove();
                    $('#pageNumber5').remove();
                    $('#prevPage').addClass('inactiveLink disabled');
                    $('#firstPage').addClass('inactiveLink disabled');
                    break;
                case 1:
                    $('#pageNumber1').prop('href','/?pageNumber=${endPageNumber-1}');
                    $('#pageNumber2').css('color','white');
                    $('#pageNumber2').prop('href','/?pageNumber=${endPageNumber}');
                    $('#pageNumber3').remove();
                    $('#pageNumber4').remove();
                    $('#pageNumber5').remove();
                    break;
                case 2:
                    $('#pageNumber1').prop('href','/?pageNumber=${endPageNumber-2}');
                    $('#pageNumber2').prop('href','/?pageNumber=${endPageNumber-1}');
                    $('#pageNumber3').css('color','white');
                    $('#pageNumber3').prop('href','/?pageNumber=${endPageNumber}');
                    $('#pageNumber4').remove();
                    $('#pageNumber5').remove();
                    break;
                case 3:
                    $('#pageNumber1').prop('href','/?pageNumber=${endPageNumber-3}');
                    $('#pageNumber2').prop('href','/?pageNumber=${endPageNumber-2}');
                    $('#pageNumber3').prop('href','/?pageNumber=${endPageNumber-1}');
                    $('#pageNumber4').css('color','white');
                    $('#pageNumber4').prop('href','/?pageNumber=${endPageNumber}');
                    $('#pageNumber5').remove();
                    break;
                default:
                    $('#pageNumber1').prop('href','/?pageNumber=${endPageNumber-4}');
                    $('#pageNumber1').prop('innerHTML','${endPageNumber-3}');
                    $('#pageNumber2').prop('href','/?pageNumber=${endPageNumber-3}');
                    $('#pageNumber2').prop('innerHTML','${endPageNumber-2}');
                    $('#pageNumber3').prop('href','/?pageNumber=${endPageNumber-2}');
                    $('#pageNumber3').prop('innerHTML','${endPageNumber-1}');
                    $('#pageNumber4').prop('href','/?pageNumber=${endPageNumber-1}');
                    $('#pageNumber4').prop('innerHTML','${endPageNumber}');
                    $('#pageNumber5').css('color','white');
                    $('#pageNumber5').prop('href','/?pageNumber=${endPageNumber}');
                    $('#pageNumber5').prop('innerHTML','${endPageNumber+1}');
                    break;

            }

        }
        //если предпоследняя страница
        else if((${pageNumber})==(${endPageNumber}-1))
        {
            $('#firstPage').prop('href','/?pageNumber=0');
            $('#prevPage').prop('href','/?pageNumber=${pageNumber-1}');
            $('#lastPage').prop('href','/?pageNumber=${endPageNumber}');
            $('#nextPage').prop('href','/?pageNumber=${pageNumber+1}');
            if((${pageNumber})==2)
            {
                $('#pageNumber1').prop('href','/?pageNumber=${pageNumber-2}');
                $('#pageNumber2').prop('href','/?pageNumber=${pageNumber-1}');
                $('#pageNumber3').prop('href','/?pageNumber=${pageNumber}');
                $('#pageNumber3').css('color','white');
                $('#pageNumber4').prop('href','/?pageNumber=${pageNumber+1}');
                $('#pageNumber5').remove();
            }
            else
            {
                $('#pageNumber1').prop('href','/?pageNumber=${pageNumber-3}');
                $('#pageNumber1').prop('innerHTML','${pageNumber-2}');
                $('#pageNumber2').prop('href','/?pageNumber=${pageNumber-2}');
                $('#pageNumber2').prop('innerHTML','${pageNumber-1}');
                $('#pageNumber3').prop('href','/?pageNumber=${pageNumber-1}');
                $('#pageNumber3').prop('innerHTML','${pageNumber}');
                $('#pageNumber4').prop('href','/?pageNumber=${pageNumber}');
                $('#pageNumber4').prop('innerHTML','${pageNumber+1}');
                $('#pageNumber4').css('color','white');
                $('#pageNumber5').prop('href','/?pageNumber=${pageNumber+1}');
                $('#pageNumber5').prop('innerHTML','${pageNumber+2}');
            }
        }
        //если между первыми двумя и последними двумя
        else if((${pageNumber})>1&&(${pageNumber})<${endPageNumber-1})
        {
            $('#firstPage').prop('href','/?pageNumber=0');
            $('#prevPage').prop('href','/?pageNumber=${pageNumber-1}');
            $('#lastPage').prop('href','/?pageNumber=${endPageNumber}');
            $('#nextPage').prop('href','/?pageNumber=${pageNumber+1}');
            $('#pageNumber3').css('color','white');
            $('#pageNumber3').prop('innerHTML','${pageNumber+1}');
            $('#pageNumber3').prop('href','/?pageNumber=${pageNumber}');
            $('#pageNumber2').prop('innerHTML','${pageNumber}');
            $('#pageNumber2').prop('href','/?pageNumber=${pageNumber-1}');
            $('#pageNumber1').prop('innerHTML','${pageNumber-1}');
            $('#pageNumber1').prop('href','/?pageNumber=${pageNumber-2}');
            $('#pageNumber4').prop('innerHTML','${pageNumber+2}');
            $('#pageNumber4').prop('href','/?pageNumber=${pageNumber+1}');
            $('#pageNumber5').prop('innerHTML','${pageNumber+3}');
            $('#pageNumber5').prop('href','/?pageNumber=${pageNumber+2}');
        }

    })
</script>
</body>
</html>
