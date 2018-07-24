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
<<<<<<< HEAD
=======
    <style>
<<<<<<< HEAD

=======
        .row > .column {
            padding: 0 8px;
        }

        .row:after {
            content: "";
            display: table;
            clear: both;
        }

        /* Create four equal columns that floats next to eachother */
        .column {
            float: left;
            width: 25%;
        }

        /* The Modal (background) */
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            padding-top: 100px;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: black;
        }

        /* Modal Content */
        .modal-content {
            position: relative;
            background-color: #fefefe;
            margin: auto;
            padding: 0;
            width: 90%;
            max-width: 1200px;
        }

        /* The Close Button */
        .close {
            color: white;
            position: absolute;
            top: 10px;
            right: 25px;
            font-size: 35px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: #999;
            text-decoration: none;
            cursor: pointer;
        }

        /* Hide the slides by default */
        .mySlides {
            display: none;
        }

        /* Next & previous buttons */
        .prev,
        .next {
            cursor: pointer;
            position: absolute;
            top: 50%;
            width: auto;
            padding: 16px;
            margin-top: -50px;
            color: white;
            font-weight: bold;
            font-size: 20px;
            transition: 0.6s ease;
            border-radius: 0 3px 3px 0;
            user-select: none;
            -webkit-user-select: none;
        }

        /* Position the "next button" to the right */
        .next {
            right: 0;
            border-radius: 3px 0 0 3px;
        }

        /* On hover, add a black background color with a little bit see-through */
        .prev:hover,
        .next:hover {
            background-color: rgba(0, 0, 0, 0.8);
        }

        /* Number text (1/3 etc) */
        .numbertext {
            color: #f2f2f2;
            font-size: 12px;
            padding: 8px 12px;
            position: absolute;
            top: 0;
        }

        /* Caption text */
        .caption-container {
            text-align: center;
            background-color: black;
            padding: 2px 16px;
            color: white;
        }

        img.demo {
            opacity: 0.6;
        }

        .active,
        .demo:hover {
            opacity: 1;
        }

        img.hover-shadow {
            transition: 0.3s;
        }

        .hover-shadow:hover {
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
        }
>>>>>>> d34c3d5722835f0080d1081930c54e45f72cf3b1
    </style>
>>>>>>> origin/master

    <script src="https://api-maps.yandex.ru/2.1/?lang=ru_RU" type="text/javascript"></script>


    <script>
<<<<<<< HEAD
        var map;
=======
<<<<<<< HEAD
        var map;
=======
        var map
>>>>>>> d34c3d5722835f0080d1081930c54e45f72cf3b1
>>>>>>> origin/master
        ymaps.ready(function(){
            map = new ymaps.Map(document.getElementById('map'), {
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
</head>
<body>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <h2 class="text-center">БрянскГипроЗем</h2>
            <div class="text-justify" style="word-wrap: break-word">
                Предприятие основано в 1998 году. Решением собрания учредителей генеральным директором ООО «БрянскГипроЗем» стал Чернявский В.Г.
                Заслуженный землеустроитель Российской Федерации.Наш коллектив - это команда высококвалифицированных специалистов с высшим и средне-техническим образованием (инженеров и техников-землеустроителей, инженеров городского и земельного кадастра) с большим стажем геодезических и землеустроительных работ.Мы делаем ставку на современные технологии в области инженерных изысканий и землеустройства.В составе предприятия квалифицированные специалисты-землеустроители, из них 4 кадастровых инженера. Работы выполняются с использованием современных электронных тахеометров и приборов спутниковой системы определения координат. Парк геодезических приборов укомплектован электронными тахеометрами Sokkia, Nikon, системами спутниковой навигации(GPS) ProMakr-3, трассоискателями Metrotech.
                Специалисты ООО «БрянскГипроЗем» разработали ряд специализированных компьютерных программ, позволяющих повысить качество и скорость работ.
            </div>
        </div>
        <div class="col-md-12 justify-content-center">
            <h2 class="text-center">Виды работ</h2>
            <div class="row justify-content-center">
                <div class="col rounded border border-secondary m-2" style="background-color: white">
                    <img src="/resources/images/worktTypes/inwentaryzacje_powykonawcze_obiektow_budowlanych-1024x683.jpg" class="img-thumbnail rounded m-auto m-2 img-fluid">
                    <div class="text-left">
                        Межевание земельных участков различных категорий земель разрешенного использования и разработка межевых планов по заявкам юридических и физических лиц для целей их постановки на кадастровый учет
                    </div>
                </div>
                <div class="col rounded border border-secondary m-2" style="background-color: white">
                    <img src="/resources/images/worktTypes/РазработкаПроектовМежевания.jpg" class="img-thumbnail rounded m-auto m-2 img-fluid ">
                    <div class="text-left">
                        Разработка проектов межевания и межевых планов на выделение земель сельскохозяйственного назначения, включая и земельные доли
                    </div>
                </div>
                <div class="col rounded border border-secondary m-2" style="background-color: white">
                    <img src="/resources/images/worktTypes/Технический%20план.jpg" class="img-thumbnail rounded m-auto m-2 img-fluid">
                    <div class="text-left">
                        Подготовка и оформление технических планов на жилые и производственные здания, сооружения, объекты незавершённого строительства с целью постановки их на кадастровый учет
                    </div>
                </div>
                <div class="col rounded border border-secondary m-2" style="background-color: white">
                    <img src="/resources/images/worktTypes/Топографо-графич.jpg" class="img-thumbnail rounded m-auto m-2 img-fluid">
                    <div class="text-left">
                        Вынос в натуру границ земельных участков, топографо-геодезические работы
                    </div>
                </div>
            </div>

        </div>
        <div class="col-12">
            <h2 class="text-center">Наши партнеры</h2>
            <div class="row justify-content-center">
              <div class="col-md-3 m-auto">
                  <img src="/resources/images/Partners/ГосРегистр.jpg" alt="Управление Федерального агентства кадастра объектов недви-жимости по Брянской области" class="img-thumbnail rounded mx-auto m-2 img-fluid">
              </div>
                <div class="col-md-3 m-auto">
                   <img src="/resources/images/Partners/БрянскЭнерго.jpg" alt="ОАО «БрянскЭнерго»" class="img-thumbnail rounded mx-auto m-2 img-fluid">
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
<<<<<<< HEAD
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
            </div>
=======
<<<<<<< HEAD
            <div class="row justify-content-center">
                <div class="col-md-3">
                    <img class="img-thumbnail rounded m-auto m-2 " src="/resources/images/ourSertificates/Квал.%20Аттестат%20КИ%20Пеньков.jpg">
                    <img class="img-thumbnail rounded m-auto m-2  " src="/resources/images/ourSertificates/Квал.%20Аттестат%20КИ%20Тарасов.jpg">
                </div>
                <div class="col-md-3">
                    <img class="img-thumbnail rounded m-auto m-2  " src="/resources/images/ourSertificates/Квал.%20Аттестат%20КИ%20Чернявский.jpg">
                    <img class="img-thumbnail rounded m-auto m-2  " src="/resources/images/ourSertificates/Квал.Аттестат%20КИ%20Семиленкова.jpg">
                </div>
                <div class="col-md-3">
                    <img class="img-thumbnail rounded m-auto m-2  " src="/resources/images/ourSertificates/Свидетельство%20СРО%20Пеньков%20А%20В-001.jpg">
                    <img class="img-thumbnail rounded m-auto m-2  " src="/resources/images/ourSertificates/Свидетельство%20СРО%20Тарасов.jpg">
                </div>
                <div class="col-md-3">
                    <img class="img-thumbnail rounded m-auto m-2  " src="/resources/images/ourSertificates/Свидетельство%20СРО%20Семиленкова-001.jpg">
                    <img class="img-thumbnail rounded m-auto m-2 " style="rotatate:270deg" src="/resources/images/ourSertificates/Свиетельство%20СРО%20Чернявский.jpg">
                </div>
            </div>
=======
>>>>>>> d34c3d5722835f0080d1081930c54e45f72cf3b1
>>>>>>> origin/master
        </div>
        <div class="col-12">
            <h2 class="text-center">Расположение</h2>
            <div class="row justify-content-center">
                <div id="map" class=" col-md-8" style="width: 80%;height: 40%">
                </div>
            </div>
        </div>
<<<<<<< HEAD
        <div id="myModal" class="modal">


            <!-- Modal Content (The Image) -->
            <img class="modal-content" id="img01">

            <!-- Modal Caption (Image Text) -->
            <div id="caption"></div>
        </div>
=======

>>>>>>> origin/master
    </div>
</div>



</body>
</html>
