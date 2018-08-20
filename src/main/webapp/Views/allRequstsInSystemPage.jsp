<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%--
  Created by IntelliJ IDEA.
  User: Максим
  Date: 28.05.2018
  Time: 0:21
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
    <div class="row">
        <c:forEach var="request" items="${requestsEntities}">
            <div class="col-md-6 col-lg-4">
                <div class="card m-2 text-left  rounded border-secondary ">
                    <sf:form action="/" cssClass="m-1">
                        <h3 class="card-title text-center"> Id заявки:${request.requestId}</h3>
                        <c:out value="Тип заявки:${request.requestType}"/><br/>
                        <c:out value="Автор заявки:${request.usersEntity.username}"/><br/>
                        <c:out value="Статус выполнения:${request.workStatus}"/><br/>
                        <c:out value="Дата создания:${request.creationDate}"/><br/>
                        <c:if test="${request.worker!=null}">
                            <c:out value="Исполнитель:${request.worker}"/><br/>
                        </c:if>
                        <div class="nav nav-pills  justify-content-center">
                            <c:if test="${request.workStatus=='В обработке'}">
                                <a class="nav-link  active m-1" style="background-color: #b94964" href="/rejectRequest?requestId=${request.requestId}">Отклонить</a>
                                <a class="nav-link  active m-1" style="background-color: #b94964" href="/executeRequest/${request.requestId}?username=<security:authentication property="principal.username"/>">Исполнять</a>
                            </c:if>
                            <c:if test="${request.workStatus=='Отклонена'}">
                                <a class="nav-link  active m-1" style="background-color: #b94964" href="/handleRequest/${request.requestId}?username=<security:authentication property="principal.username"/>">Обработать</a>
                            </c:if>
                            <security:authentication property="principal.username"  var="tempUsername"/>
                            <c:if test="${request.workStatus=='Исполняется'&& request.worker==tempUsername}">
                                <a class="nav-link  active m-1" style="background-color: #b94964"  href="/rejectRequest?requestId=${request.requestId}">Отклонить</a>
                                <a class="nav-link  active m-1" style="background-color: #b94964" href="/handleRequest/${request.requestId}?username=<security:authentication property="principal.username"/>">Обработать</a>
                                <a class="nav-link  active m-1" style="background-color: #b94964" href="/performRequest/${request.requestId}?username=<security:authentication property="principal.username"/>">Выполнить</a>
                            </c:if>
                            <c:if test="${request.workStatus=='Выполнена'&& request.worker==tempUsername}">
                                <a class="nav-link  active m-1" style="background-color: #b94964" href="/rejectRequest?requestId=${request.requestId}">Отклонить</a>
                                <a class="nav-link  active m-1" style="background-color: #b94964" href="/handleRequest/${request.requestId}?username=<security:authentication property="principal.username"/>">Обработать</a>
                                <a class="nav-link  active m-1" style="background-color: #b94964" href="/executeRequest/${request.requestId}?username=<security:authentication property="principal.username"/>">Исполнять</a>
                            </c:if>
                            <br/><a class="nav-link  active m-1" style="background-color: #b94964" href="/requestDetail?requestId=${request.requestId}">См.Детали</a>
                        </div>
                    </sf:form>
                </div>
            </div>
        </c:forEach>
    </div>
    <c:if test="${!empty(requestsEntities)}">
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
<script >
    $(function () {
        //если первая страница
        if((${pageNumber})==0)
        {
            $('#firstPage').addClass('inactiveLink disabled');
            $('#prevPage').addClass('inactiveLink disabled');
            $('#pageNumber1').css('color','white');
            $('#pageNumber1').prop('href','/allRequestInSystem');
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
                    $('#pageNumber2').prop('href','/allRequestInSystem?pageNumber=${pageNumber+1}');
                    $('#pageNumber3').remove();
                    $('#pageNumber4').remove();
                    $('#pageNumber5').remove();
                    $('#nextPage').prop('href','/allRequestInSystem?pageNumber=${pageNumber+1}');
                    $('#lastPage').prop('href','/allRequestInSystem?pageNumber=${endPageNumber}');
                    break;
                case 2:
                    $('#pageNumber2').prop('href','/allRequestInSystem?pageNumber=${pageNumber+1}');
                    $('#pageNumber3').prop('href','/allRequestInSystem?pageNumber=${pageNumber+2}');
                    $('#pageNumber4').remove();
                    $('#pageNumber5').remove();
                    $('#nextPage').prop('href','/allRequestInSystem?pageNumber=${pageNumber+1}');
                    $('#lastPage').prop('href','/allRequestInSystem?pageNumber=${endPageNumber}');
                    break;
                case 3:
                    $('#pageNumber2').prop('href','/allRequestInSystem?pageNumber=${pageNumber+1}');
                    $('#pageNumber3').prop('href','/allRequestInSystem?pageNumber=${pageNumber+2}');
                    $('#pageNumber4').prop('href','/allRequestInSystem?pageNumber=${pageNumber+3}');
                    $('#pageNumber5').remove();
                    $('#nextPage').prop('href','/allRequestInSystem?pageNumber=${pageNumber+1}');
                    $('#lastPage').prop('href','/allRequestInSystem?pageNumber=${endPageNumber}');
                    break;
                default:
                    $('#pageNumber2').prop('href','/allRequestInSystem?pageNumber=${pageNumber+1}');
                    $('#pageNumber3').prop('href','/allRequestInSystem?pageNumber=${pageNumber+2}');
                    $('#pageNumber4').prop('href','/allRequestInSystem?pageNumber=${pageNumber+3}');
                    $('#pageNumber5').prop('href','/allRequestInSystem?pageNumber=${pageNumber+4}');
                    $('#nextPage').prop('href','/allRequestInSystem?pageNumber=${pageNumber+1}');
                    $('#lastPage').prop('href','/allRequestInSystem?pageNumber=${endPageNumber}');
                    break;
            }

        }
        //если вторая страница
        else if((${pageNumber})==1)
        {
            $('#firstPage').prop('href','/allRequestInSystem?pageNumber=0');
            $('#prevPage').prop('href','/allRequestInSystem?pageNumber=${pageNumber-1}');
            $('#pageNumber1').prop('href','/allRequestInSystem?pageNumber=${pageNumber-1}')
            $('#pageNumber2').css('color','white');
            $('#pageNumber2').prop('href','/allRequestInSystem?pageNumber=${pageNumber}');
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
                    $('#pageNumber3').prop('href','/allRequestInSystem?pageNumber=${pageNumber+1}');
                    $('#pageNumber4').remove();
                    $('#pageNumber5').remove();
                    $('#nextPage').prop('href','/allRequestInSystem?pageNumber=${pageNumber+1}');
                    $('#lastPage').prop('href','/allRequestInSystem?pageNumber=${endPageNumber}');
                    break;
                case 2:
                    $('#pageNumber3').prop('href','/allRequestInSystem?pageNumber=${pageNumber+1}');
                    $('#pageNumber4').prop('href','/allRequestInSystem?pageNumber=${pageNumber+2}');
                    $('#pageNumber5').remove();
                    $('#nextPage').prop('href','/allRequestInSystem?pageNumber=${pageNumber+1}');
                    $('#lastPage').prop('href','/allRequestInSystem?pageNumber=${endPageNumber}');
                    break;
                default:
                    $('#pageNumber3').prop('href','/allRequestInSystem?pageNumber=${pageNumber+1}');
                    $('#pageNumber4').prop('href','/allRequestInSystem?pageNumber=${pageNumber+2}');
                    $('#pageNumber5').prop('href','/allRequestInSystem?pageNumber=${pageNumber+3}');
                    $('#nextPage').prop('href','/allRequestInSystem?pageNumber=${pageNumber+1}');
                    $('#lastPage').prop('href','/allRequestInSystem?pageNumber=${endPageNumber}');
                    break;
            }
        }
        //если последняя страница
        else if((${pageNumber})==${endPageNumber})
        {   $('#firstPage').prop('href','/allRequestInSystem?pageNumber=0');
            $('#prevPage').prop('href','/allRequestInSystem?pageNumber=${pageNumber-1}');
            $('#lastPage').addClass('inactiveLink disabled');
            $('#nextPage').addClass('inactiveLink disabled');

            switch (${endPageNumber})
            {
                case 0:
                    $('#pageNumber1').css('color','white');
                    $('#pageNumber1').prop('href','/allRequestInSystem?pageNumber=${endPageNumber}');
                    $('#pageNumber2').remove();
                    $('#pageNumber3').remove();
                    $('#pageNumber4').remove();
                    $('#pageNumber5').remove();
                    $('#prevPage').addClass('inactiveLink disabled');
                    $('#firstPage').addClass('inactiveLink disabled');
                    break;
                case 1:
                    $('#pageNumber1').prop('href','/allRequestInSystem?pageNumber=${endPageNumber-1}');
                    $('#pageNumber2').css('color','white');
                    $('#pageNumber2').prop('href','/allRequestInSystem?pageNumber=${endPageNumber}');
                    $('#pageNumber3').remove();
                    $('#pageNumber4').remove();
                    $('#pageNumber5').remove();
                    break;
                case 2:
                    $('#pageNumber1').prop('href','/allRequestInSystem?pageNumber=${endPageNumber-2}');
                    $('#pageNumber2').prop('href','/allRequestInSystem?pageNumber=${endPageNumber-1}');
                    $('#pageNumber3').css('color','white');
                    $('#pageNumber3').prop('href','/allRequestInSystem?pageNumber=${endPageNumber}');
                    $('#pageNumber4').remove();
                    $('#pageNumber5').remove();
                    break;
                case 3:
                    $('#pageNumber1').prop('href','/allRequestInSystem?pageNumber=${endPageNumber-3}');
                    $('#pageNumber2').prop('href','/allRequestInSystem?pageNumber=${endPageNumber-2}');
                    $('#pageNumber3').prop('href','/allRequestInSystem?pageNumber=${endPageNumber-1}');
                    $('#pageNumber4').css('color','white');
                    $('#pageNumber4').prop('href','/allRequestInSystem?pageNumber=${endPageNumber}');
                    $('#pageNumber5').remove();
                    break;
                default:
                    $('#pageNumber1').prop('href','/allRequestInSystem?pageNumber=${endPageNumber-4}');
                    $('#pageNumber1').prop('innerHTML','${endPageNumber-3}');
                    $('#pageNumber2').prop('href','/allRequestInSystem?pageNumber=${endPageNumber-3}');
                    $('#pageNumber2').prop('innerHTML','${endPageNumber-2}');
                    $('#pageNumber3').prop('href','/allRequestInSystem?pageNumber=${endPageNumber-2}');
                    $('#pageNumber3').prop('innerHTML','${endPageNumber-1}');
                    $('#pageNumber4').prop('href','/allRequestInSystem?pageNumber=${endPageNumber-1}');
                    $('#pageNumber4').prop('innerHTML','${endPageNumber}');
                    $('#pageNumber5').css('color','white');
                    $('#pageNumber5').prop('href','/allRequestInSystem?pageNumber=${endPageNumber}');
                    $('#pageNumber5').prop('innerHTML','${endPageNumber+1}');
                    break;

            }

        }
        //если предпоследняя страница
        else if((${pageNumber})==(${endPageNumber}-1))
        {
            $('#firstPage').prop('href','/allRequestInSystem?pageNumber=0');
            $('#prevPage').prop('href','/allRequestInSystem?pageNumber=${pageNumber-1}');
            $('#lastPage').prop('href','/allRequestInSystem?pageNumber=${endPageNumber}');
            $('#nextPage').prop('href','/allRequestInSystem?pageNumber=${pageNumber+1}');
            if((${pageNumber})==2)
            {
                $('#pageNumber1').prop('href','/allRequestInSystem?pageNumber=${pageNumber-2}');
                $('#pageNumber2').prop('href','/allRequestInSystem?pageNumber=${pageNumber-1}');
                $('#pageNumber3').prop('href','/allRequestInSystem?pageNumber=${pageNumber}');
                $('#pageNumber3').css('color','white');
                $('#pageNumber4').prop('href','/allRequestInSystem?pageNumber=${pageNumber+1}');
                $('#pageNumber5').remove();
            }
            else
            {
                $('#pageNumber1').prop('href','/allRequestInSystem?pageNumber=${pageNumber-3}');
                $('#pageNumber1').prop('innerHTML','${pageNumber-2}');
                $('#pageNumber2').prop('href','/allRequestInSystem?pageNumber=${pageNumber-2}');
                $('#pageNumber2').prop('innerHTML','${pageNumber-1}');
                $('#pageNumber3').prop('href','/allRequestInSystem?pageNumber=${pageNumber-1}');
                $('#pageNumber3').prop('innerHTML','${pageNumber}');
                $('#pageNumber4').prop('href','/allRequestInSystem?pageNumber=${pageNumber}');
                $('#pageNumber4').prop('innerHTML','${pageNumber+1}');
                $('#pageNumber4').css('color','white');
                $('#pageNumber5').prop('href','/allRequestInSystem?pageNumber=${pageNumber+1}');
                $('#pageNumber5').prop('innerHTML','${pageNumber+2}');
            }
        }
        //если между первыми двумя и последними двумя
        else if((${pageNumber})>1&&(${pageNumber})<${endPageNumber-1})
        {
            $('#firstPage').prop('href','/allRequestInSystem?pageNumber=0');
            $('#prevPage').prop('href','/allRequestInSystem?pageNumber=${pageNumber-1}');
            $('#lastPage').prop('href','/allRequestInSystem?pageNumber=${endPageNumber}');
            $('#nextPage').prop('href','/allRequestInSystem?pageNumber=${pageNumber+1}');
            $('#pageNumber3').css('color','white');
            $('#pageNumber3').prop('innerHTML','${pageNumber+1}');
            $('#pageNumber3').prop('href','/allRequestInSystem?pageNumber=${pageNumber}');
            $('#pageNumber2').prop('innerHTML','${pageNumber}');
            $('#pageNumber2').prop('href','/allRequestInSystem?pageNumber=${pageNumber-1}');
            $('#pageNumber1').prop('innerHTML','${pageNumber-1}');
            $('#pageNumber1').prop('href','/allRequestInSystem?pageNumber=${pageNumber-2}');
            $('#pageNumber4').prop('innerHTML','${pageNumber+2}');
            $('#pageNumber4').prop('href','/allRequestInSystem?pageNumber=${pageNumber+1}');
            $('#pageNumber5').prop('innerHTML','${pageNumber+3}');
            $('#pageNumber5').prop('href','/allRequestInSystem?pageNumber=${pageNumber+2}');
        }

    })
</script>
</body>
</html>
