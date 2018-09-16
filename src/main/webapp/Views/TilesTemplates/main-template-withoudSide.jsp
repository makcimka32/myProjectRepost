<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%--
  Created by IntelliJ IDEA.
  User: Максим
  Date: 20.05.2018
  Time: 3:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>БрянскГипроЗем</title>
    <!--Шрифт---->
    <link href="https://fonts.googleapis.com/css?family=Fira+Sans|Vollkorn" rel="stylesheet">
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
    <!--Шрифты и иконки-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
    <!--yandexMapApi-->
    <script src="https://api-maps.yandex.ru/2.1/?lang=ru_RU" type="text/javascript"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        body{
            font-family:Georgia,Arial;
            font-family: 'Vollkorn', serif;
            font-family: 'Fira Sans', sans-serif;

            min-height: 100%;
            background-color: aliceblue;
        }
        .myLinkButton{
            display: block;
            border: 3px solid #b94964 ;
            border-radius: 8px;
            padding: 7px;
            background-color: aliceblue;
            color: #b94964;
            text-align: center;
        }
        .myLinkButton:hover{
            background-color: #b94964;
            color: white;
            text-decoration: none;
        }
        .myLinkButton:active{


            transform: translateY(2px);

        }
        .top{
            z-index: 1;
            overflow: hidden;
            top:0;
            background-color: #303161;
            position: fixed;
            transition: top 0.3s;
        }
        .content
        {   z-index: 0;
            position: relative;
            min-height: 90%;
            margin-bottom: 50px;
        }
       .footer
        {
           left: 0;
            bottom: 0;
            text-align: center;
            background-color: #303161;
        }
    </style>
<!--подключаем для изображений стили-->
    <style>
        .mainPageCard{
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
            background-color: aliceblue;
        }
        .mainPageCard:hover{
            background-color: white;
        }

        .card{
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
            background-color: white;
        }
        .card:hover
        {
            background-color: cornsilk;
        }
        .news:hover{
            cursor: pointer;
        }

        .myImg {
            border-radius: 5px;
            cursor: pointer;
            transition: 0.3s;
        }


        .myImg:hover {opacity: 0.7;}

        /* The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.9); /* Black w/ opacity */
        }

        /* Modal Content (Image) */
        .modal-content {
            margin: auto;
            margin-top: 5%;

            display: block;
            width: 80%;
            max-width: 1000px;

        }

        /* Caption of Modal Image (Image Text) - Same Width as the Image */
        #caption {
            margin: auto;
            display: block;
            width: 80%;
            max-width: 700px;
            text-align: center;
            color: #ccc;
            padding: 10px 0;
            height: 150px;
        }

        /* Add Animation - Zoom in the Modal */
        .modal-content, #caption {
            animation-name: zoom;
            animation-duration: 0.6s;
        }

        @keyframes zoom {
            from {transform:scale(0)}
            to {transform:scale(1)}
        }

        /* The Close Button */
        .close {
            position: absolute;
            top: 15px;
            right: 35px;
            color: #f1f1f1;
            font-size: 40px;
            font-weight: bold;
            transition: 0.3s;
        }

        .close:hover,
        .close:focus {
            color: #bbb;
            text-decoration: none;
            cursor: pointer;
        }

        /* 100% Image Width on Smaller Screens */
        @media only screen and (max-width: 700px){
            .modal-content {
                width: 100%;
            }
        }
    </style>

</head>
<body>
<div class="container-fluid top">
           <tiles:insertAttribute name="top"/>
</div>
<div class="container-fluid content">
    <tiles:insertAttribute name="content"/>

</div>

<div id="myModal" class="modal">
    <!-- Modal Content (The Image) -->
    <img class="modal-content" id="img01">
    <!-- Modal Caption (Image Text) -->
    <div id="caption"></div>
</div>
<div class="container-fluid footer ">
            <tiles:insertAttribute name="bottom"/>
</div>

<script>
    // Get the modal
    var modal = document.getElementById('myModal');
    // Get the image and insert it inside the modal - use its "alt" text as a caption
    var img =$('.myImg');
    var modalImg = document.getElementById("img01");
    var captionText = document.getElementById("caption");
    for(var i=0;i<img.length;i++)
    {
        img[i].onclick = function(){
            modal.style.display = "block";
            modalImg.src = this.src;
            captionText.innerHTML = this.alt;
        }
    }

    modal.onclick=function () {
        modal.style.display="none";

    }



</script>
<!-- add margin to body dymanicly-->
<script>
    $(function () {
        $('.content').css('marginTop',$('.top').height());
        $('.modal').css('marginTop',($('.top').height()));

        $(window).resize(function () {
            $('.content').css('marginTop',$('.top').height());
            $('.modal').css('marginTop',$('.top').height());
        })
    })

    $('[data-toggle="tooltip"]').tooltip();

</script>


</body>
</html>
