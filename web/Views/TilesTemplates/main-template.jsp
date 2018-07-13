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
    <title>Title</title>

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
<div class=" h-100 w-100">
        <div class="row bg-success" >
            <div class="col-12">
                <tiles:insertAttribute name="top"/>
            </div>
        </div>
        <div class="row">
                <div class="col-6 bg-danger">
                    <tiles:insertAttribute name="side"/>
                </div>
                <div class="col-6 bg-info">
                        <tiles:insertAttribute name="content"/>
                </div>

        </div>
        <div class="row">
            <div class="col-12 bg-dark">
                <tiles:insertAttribute name="bottom"/>
            </div>
        </div>
</div>
</body>
</html>
