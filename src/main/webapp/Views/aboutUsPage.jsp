<%--
  Created by IntelliJ IDEA.
  User: Максим
  Date: 11.06.2018
  Time: 2:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>




    <script src="https://api-maps.yandex.ru/2.1/?lang=ru_RU" type="text/javascript"></script>



</head>
<body>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <h2 class="text-center">БрянскГипроЗем</h2>
            <div class="text-left" style="word-wrap: break-word">
                Предприятие основано в 1998 году. Решением собрания учредителей генеральным директором ООО «БрянскГипроЗем» стал Чернявский В.Г.
                Заслуженный землеустроитель Российской Федерации.Наш коллектив - это команда высококвалифицированных специалистов с высшим и средне-техническим образованием (инженеров и техников-землеустроителей, инженеров городского и земельного кадастра) с большим стажем геодезических и землеустроительных работ.Мы делаем ставку на современные технологии в области инженерных изысканий и землеустройства.В составе предприятия квалифицированные специалисты-землеустроители, из них 4 кадастровых инженера. Работы выполняются с использованием современных электронных тахеометров и приборов спутниковой системы определения координат. Парк геодезических приборов укомплектован электронными тахеометрами Sokkia, Nikon, системами спутниковой навигации(GPS) ProMakr-3, трассоискателями Metrotech.
                Все работы выполняются в кратчайшие сроки.За долгое время существования наша компания выполнила тысячи землеустроительных проектов и отлично зарекомандовала себя на рынке. Уделяемое пристальное внимание к качеству выполненных работ по оформлению земли согласно требованиям нормативно-технических документов и законодательства РФ, позволяет гарантировать высокое качество работ.
                Специалисты ООО «БрянскГипроЗем» разработали ряд специализированных компьютерных программ, позволяющих повысить качество и скорость работ.
            </div>
        </div>
        <div class="col-md-12 justify-content-center">
        </div>
        <div class="col-12">
            <h2 class="text-center">Наши партнеры</h2>
            <div class="row justify-content-center">
              <div class="col-md-3 m-auto">
                  <img src="/resources/images/Partners/ГосРегистр.jpg" alt="Управление Федерального агентства кадастра объектов недви-жимости по Брянской области" class="img-thumbnail rounded mx-auto m-2 img-fluid">
              </div>
                <div class="col-md-3 m-auto">
                   <img src="/resources/images/Partners/БрянскЭнерго1.jpg" alt="ОАО «БрянскЭнерго»" class="img-thumbnail rounded mx-auto m-2 img-fluid">
                </div>
                <div class="col-md-3 m-auto">
                    <img src="/resources/images/Partners/Транснефть.jpg" alt="ОАО «Магистральные нефтепроводы Дружба»" class="img-thumbnail rounded mx-auto m-2 img-fluid">
                </div>
                <div class="col-md-3 m-auto">
                    <img src="/resources/images/Partners/GazpromTrans.jpg" alt="ООО «Газпром Траснгаз Москва»" class="img-thumbnail rounded mx-auto m-2 img-fluid">
                </div>
            </div>
        </div>

        <div class="col-12">
            <h2 class="text-center">Сертификаты</h2>

            <div class="row justify-content-center">
                <div class="col-md-3">
                    <img class="img-thumbnail rounded m-2 myImg" src="/resources/images/ourSertificates/Свидетельство%20СРО%20Семиленкова-001.jpg">
                    <img class="img-thumbnail rounded m-2 myImg" src="/resources/images/ourSertificates/Квал.Аттестат%20КИ%20Семиленкова.jpg">
                </div>
                <div class="col-md-3">
                    <img class="img-thumbnail rounded m-2 myImg" style="rotatate:270deg" src="/resources/images/ourSertificates/Свиетельство%20СРО%20Чернявский.jpg">
                    <img class="img-thumbnail rounded m-2 myImg" src="/resources/images/ourSertificates/Квал.%20Аттестат%20КИ%20Чернявский.jpg">
                </div>
                <div class="col-md-3">
                    <img class="img-thumbnail rounded m-2 myImg" src="/resources/images/ourSertificates/Свидетельство%20СРО%20Тарасов.jpg">
                    <img class="img-thumbnail rounded m-2 myImg" src="/resources/images/ourSertificates/Квал.%20Аттестат%20КИ%20Тарасов.jpg">
                </div>
                <div class="col-md-3">
                    <img class="img-thumbnail rounded m-2 myImg" src="/resources/images/ourSertificates/Свидетельство%20СРО%20Пеньков%20А%20В-001.jpg">
                    <img class="img-thumbnail rounded m-2 myImg" src="/resources/images/ourSertificates/Квал.%20Аттестат%20КИ%20Пеньков.jpg">
                </div>
                <div class="col-md-3">
                    <img class="img-thumbnail rounded m-2 myImg" src="/resources/images/ourSertificates/Лицензия1.jpg">
                </div>
                <div class="col-md-3">
                    <img class="img-thumbnail rounded m-2 myImg" src="/resources/images/ourSertificates/Лицензия2.jpg">
                </div>
            </div>



        </div>
        <div class="col-12"  >
            <h2 class="text-center">Расположение</h2>
            <div class="row justify-content-center">
                <div id="map" style="width: 60%;height: 400px">
                </div>
            </div>
        </div>
    </div>
</div>


<script>

    var map;


    ymaps.ready(function(){
        map = new ymaps.Map("map", {
            center: [53.233012, 34.328190],
            zoom: 17
        });

        var myPlacemark = new ymaps.Placemark([53.233012, 34.328190], {
            balloonContentHeader: 'БрянскГипроЗем',
            balloonContentBody: 'Мы располагаемся здесь',
            hintContent: 'БрянскГипроЗем'
        });
        map.geoObjects.add(myPlacemark);
    });




</script>
</body>
</html>
