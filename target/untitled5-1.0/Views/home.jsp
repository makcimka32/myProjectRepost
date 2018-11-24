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

        /* The dots/bullets/indicators */
        .dot {
            cursor: pointer;
            height: 20px;
            width: 20px;
            margin: 4px;
            background-color: #bbb;
            border-radius: 50%;
            display: inline-block;
            transition: background-color 1.6s ease;
        }

       .activeDot, .dot:hover {
            background-color: #717171;
        }

        /* Next & previous buttons */
        .prev, .next {
            cursor: pointer;
            position: absolute;
            top: 50%;
            padding: 16px;
            color: white;
            transition: 1s ease;
            border-radius: 0 3px 3px 0;
        }

        /* Position the "next button" to the right */
        .next {
            right: 16px;
        }
        .prev{
            left: 16px;
        }

        /* On hover, add a black background color with a little bit see-through */
        .prev:hover, .next:hover {
            background-color: rgba(0,0,0,0.8);
        }

    </style>


</head>
<body>
<div class="container">
    <div class="row justify-content-center">
        <h2>Оформить заявку просто</h2>
        <div class="col-12 text-center">

            <div class="row justify-content-center">
                <div class="col-md-3 mainPageCard m-2" data-toggle="tooltip" data-placement="bottom"  title="Чтобы зарегистрироваться необходимо нажать на кнопку 'Регистрация'">
                    <div class="row justify-content-center">
                        <div class="col-12">
                            <strong>Зарегистрируйся</strong>
                        </div>
                        <div class="col-12">
                            <i class="far fa-address-card fa-4x "></i>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 mainPageCard m-2"  data-toggle="tooltip" data-placement="bottom"  title="После оформления заявки на электронную почту будет выслано письмо с информацией о заявке и реквизитами об оплате">
                    <div class="row justify-content-center">
                        <div class="col-12">
                            <strong>Создай заявку</strong>
                        </div>
                        <div class="col-12">
                            <i class="fas fa-pen-square fa-4x "></i>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 mainPageCard m-2">
                    <div class="row justify-content-center">
                        <div class="col-12">
                            <strong>Оплати заявку полностью или внеси предоплату</strong>
                        </div>
                        <div class="col-12">
                            <i class="far fa-credit-card fa-4x "></i>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 mainPageCard m-2" data-toggle="tooltip" data-placement="bottom"  title="По окончанию всех работ на электронную почту будет выслано письмо с информацией о проделанной работе. Результаты можно забрать непосредственно в офисе">
                    <div class="row justify-content-center">
                        <div class="col-12">
                           <strong>По окончанию работ, на почтовый ящик придёт уведомление</strong>
                        </div>
                        <div class="col-12">
                            <i class="far fa-envelope fa-4x"></i>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 mainPageCard m-2">
                    <div class="row justify-content-center">
                        <div class="col-12">
                            <strong>После полной оплаты заявки, результат работы можно забрать в нашем офисе</strong>
                        </div>
                        <div class="col-12 m-1">
                            <i class="fas fa-file-alt fa-4x"></i>
                        </div>
                    </div>
                </div>
            </div>
            <hr>
        </div>
        <div class="row justify-content-center m-2">
            <div class="col-md-3">
                <p><i class="fas fa-clock fa-2x"></i> Быстрые сроки</p>
            </div>
            <div class="col-md-3">
                <p><i class="fas fa-user-graduate fa-2x"></i> Квалифицированные специалисты</p>
            </div>
            <div class="col-md-3">
                <p><i class="fas fa-desktop fa-2x"></i> Лицензированное оборудование</p>
            </div>
            <div class="col-md-3">
                <p><i class="fas fa-briefcase fa-2x"></i> Свыше 15 лет стабильной работы</p>
            </div>
        </div>
        <div class="row justify-content-center">
            <div class="col-12 m-2">
                <div class="row justify-content-center">
                    <div class="col-md-3 m-auto card">
                        <h4 class="text-center">Межевание земельных участков</h4>
                        <img src="/resources/images/worktTypes/inwentaryzacje_powykonawcze_obiektow_budowlanych-1024x683.jpg" class="img-thumbnail rounded m-auto m-2 img-fluid">
                        <div class="text-left">
                            Межевание земельных участков различных категорий земель разрешенного использования и разработка межевых планов по заявкам юридических и физических лиц для целей их постановки на кадастровый учет
                            <br/>
                            <strong>Цена:7000 рублей</strong>
                        </div>
                    </div>
                    <div class="col-md-3 m-auto card">
                        <h4 class="text-center">Разработка проектов межевания</h4>
                        <img src="/resources/images/worktTypes/РазработкаПроектовМежевания.jpg" class="img-thumbnail rounded m-auto m-2 img-fluid ">
                        <div class="text-left">
                            Разработка проектов межевания и межевых планов на выделение земель сельскохозяйственного назначения, включая и земельные доли
                            <br/>
                            <strong>Цена:3000 рублей за 1 гектар </strong>
                        </div>
                    </div>
                    <div class="col-md-3 m-auto card">
                        <h4 class="text-center">Подготовка и оформление технических планов</h4>
                        <img src="/resources/images/worktTypes/Технический%20план.jpg" class="img-thumbnail rounded m-auto m-2 img-fluid">
                        <div class="text-left">
                            Подготовка и оформление технических планов на жилые и производственные здания, сооружения, объекты незавершённого строительства с целью постановки их на кадастровый учет
                            <br/>
                            <strong>Цена:6000 рублей</strong>
                        </div>
                    </div>
                    <div class="col-md-2 m-auto card">
                        <h4 class="text-center">Вынос границ</h4>
                        <img src="/resources/images/worktTypes/Топографо-графич.jpg" class="img-thumbnail rounded m-auto m-2 img-fluid">
                        <div class="text-left">
                            Вынос в натуру границ земельных участков, топографо-геодезические работы
                            <br/>
                            <strong>Цена:1500 рублей за 1 точку</strong>
                        </div>
                    </div>
                </div>
                <hr>
            </div>

        </div>

        <div class="row justify-content-center">
                <div class="col-12  m-1 m-auto " >
                    <h3 class="text-center"><strong>Наши партнеры</strong></h3>
                        <img src="/resources/images/Partners/GazpromTrans.jpg" class="img-fluid mySlideImage" style="width:100%">

                        <img src="/resources/images/Partners/Транснефть.jpg" class="img-fluid mySlideImage" style="width: 100%;display: none">

                        <img src="/resources/images/Partners/ГосРегистр.jpg" class="img-fluid mySlideImage" style="width: 100%;display: none">

                       <img src="/resources/images/Partners/БрянскЭнерго1.jpg" class="img-fluid mySlideImage" style="width: 100%; display: none;">
                        <a class="prev" onclick="showPrev()">&#10094;</a>

                        <a class="next" onclick="showNext()">&#10095;</a>


                    <div class="text-center m-2">
                        <span class="dot activeDot" onclick="show(0)"></span>
                        <span class="dot" onclick="show(1)"></span>
                        <span class="dot" onclick="show(2)"></span>
                        <span class="dot" onclick="show(3)"></span>
                    </div>
                </div>
            <hr>
        </div>

        <div class="col-12 justify-content-center">

            <c:if test="${!empty(userMessagesEntities)}">
                <h1 class="text-center display-4"><small>Наши новости</small></h1>
                <div class="row">
                    <c:forEach var="message" items="${userMessagesEntities}">
                        <div class="col-md-6">
                            <div class="card text-left m-2 news" onclick="window.location=('/news?messageId=${message.messageId}')">
                                <p class="m-2 text-left " style="font-size: 14pt;"><strong>${message.titleMessage}</strong></p>
                                <p class="mx-2" style="color:darkgray">Автор:${message.usersEntity.secondName} ${message.usersEntity.firstName} <br/>
                                    Дата редактирования:${message.editDate}</p>
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
                <div class="row mt-2 justify-content-center">
                    <div class="nav nav-pills">
                        <a class="myLinkButton  m-1" id="firstPage"  href="#">Первая</a>
                        <a class="myLinkButton  m-1" id="prevPage"  href="#">Предыдущая</a>
                        <a class="myLinkButton m-1" id="pageNumber1"  href="#">1</a>
                        <a class="myLinkButton  m-1" id="pageNumber2"  href="#">2</a>
                        <a class="myLinkButton  m-1" id="pageNumber3"  href="#">3</a>
                        <a class="myLinkButton m-1" id="pageNumber4"  href="#">4</a>
                        <a class="myLinkButton m-1" id="pageNumber5"  href="#">5</a>
                        <a class="myLinkButton  m-1" id="nextPage" href="#">Следующая</a>
                        <a class="myLinkButton  m-1" id="lastPage"  href="/allRequestInSystem?pageNumber=${endPageNumber}">Последняя</a>
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
            $('#pageNumber1').css('backgroundColor','#b94964');
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
            $('#pageNumber2').css('backgroundColor','#b94964');
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
                    $('#pageNumber1').css('backgroundColor','#b94964');
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
                    $('#pageNumber2').css('backgroundColor','#b94964');
                    $('#pageNumber2').prop('href','/?pageNumber=${endPageNumber}');
                    $('#pageNumber3').remove();
                    $('#pageNumber4').remove();
                    $('#pageNumber5').remove();
                    break;
                case 2:
                    $('#pageNumber1').prop('href','/?pageNumber=${endPageNumber-2}');
                    $('#pageNumber2').prop('href','/?pageNumber=${endPageNumber-1}');
                    $('#pageNumber3').css('color','white');
                    $('#pageNumber3').css('backgroundColor','#b94964');
                    $('#pageNumber3').prop('href','/?pageNumber=${endPageNumber}');
                    $('#pageNumber4').remove();
                    $('#pageNumber5').remove();
                    break;
                case 3:
                    $('#pageNumber1').prop('href','/?pageNumber=${endPageNumber-3}');
                    $('#pageNumber2').prop('href','/?pageNumber=${endPageNumber-2}');
                    $('#pageNumber3').prop('href','/?pageNumber=${endPageNumber-1}');
                    $('#pageNumber4').css('color','white');
                    $('#pageNumber4').css('backgroundColor','#b94964');
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
                    $('#pageNumber5').css('backgroundColor','#b94964');
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
                $('#pageNumber3').css('backgroundColor','#b94964');
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
                $('#pageNumber4').css('backgroundColor','#b94964');
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
            $('#pageNumber3').css('backgroundColor','#b94964');
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
<!--Карусель-->
    <script>
        var slideIndex = 0;
        function showNext() {
            show(++slideIndex)
        }
        function showPrev() {
            show(--slideIndex)
            
        }

        function show(imageNumber) {

            slideIndex=imageNumber;
            var images=$('.mySlideImage');
            if(imageNumber>=images.length)
            {
                slideIndex=0;
            }
            else if(imageNumber<0)
            {
                slideIndex=images.length-1;
            }
            else {
                slideIndex=imageNumber;
            }

            for( i=0; i<images.length;i++)
            {
                images[i].style.display="none";
            }
            images[slideIndex].style.display="block";
            var dots=$(".dot");
            //добавляем цвет кнопкам
            for(i=0;i<dots.length;i++)
            {

                 dots.eq(i).removeClass("activeDot");

            }
            dots.eq(slideIndex).addClass("activeDot");
        }
        $(function () {

            setInterval (showNext,4000);


        })


</script>

</body>
</html>
