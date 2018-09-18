<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Максим
  Date: 24.05.2018
  Time: 0:44
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

<div class="container-fluid">
    <div class="row">
        <div class="col-2  justify-content-center position-fixed " >
            <div class="nav nav-pills justify-content-center">
              <div class="row  justify-content-center text-center">
                  <div class="col-lg-12">
                      <a class="myLinkButton m-1 mt-2"  href="/privateOffice?username=<security:authentication property='principal.username'/>">Мои заявки</a>
                  </div>
                  <div class="col-lg-12">
                      <a class="myLinkButton m-1"  href="/privateOfficeInfo?username=<security:authentication property='principal.username'/>">Личные данные</a>
                  </div>
                  <div class="col-lg-12">
                      <a class="myLinkButton m-1" href="/">Вернуться</a>
                  </div>
              </div>
            </div>
        </div>
        <div class="col-10 offset-2 ">
            <c:forEach var="request" items="${listRequests}">
                <%--@elvariable id="requestsEntity" type="Database.Entities.RequestsEntity"--%>
                <div class="row justify-content-center">
                    <div class="col-10  text-center">
                        <sf:form action="/privateOffice" modelAttribute="requestsEntity" method="post" >
                            <input type="hidden" value="${request.requestId}" name="id">
                            <h2>Номер заявки: ${request.requestId}</h2>
                            <c:out value="Дата последних изменений: ${request.creationDate}"/><br/>
                            <c:out value="Тип проводимых работ: ${request.requestType}"/><br/>
                            <c:out value="Статус выполнения работы: ${request.workStatus}"/><br/>
                            <a  class="myLinkButton m-1" style="display:inline-block" href="/requestDetail?requestId=${request.requestId}">Детали</a>

                            <div class="row">
                                <div class="col-12">
                                    <div class="row justify-content-center">
                                        <c:forEach var="temp" items="${mapFiles}">
                                            <c:if test="${temp.key==request.requestId}">
                                                <c:forEach var="imageName" items="${temp.value}">
                                                    <div id="${imageName}" class="col-md-6 col-lg-4  m-auto">
                                                        <img class="rounded img-fluid m-1 myImg" src="/images/${request.usersEntity.username}/${request.requestId}/${imageName}" alt="${imageName}"/>
                                                        <security:authentication property="principal.username" var="tempUsername"/>
                                                        <div  class="nav justify-content-center">
                                                            <c:if test="${request.usersEntity.username==tempUsername}">
                                                             <!--   <a class="nav-link  active m-1" style="background-color: #b94964" href="/deleteImage?imageName=${imageName}&username=${request.usersEntity.username}&requestId=${request.requestId}">Удалить</a>-->
                                                                <a class="myLinkButton m-1"  href="#" onclick="function exec() {
                                                                  $.get('/deleteImage?imageName=${imageName}&username=${request.usersEntity.username}&requestId=${request.requestId}');};exec();document.getElementById('${imageName}').remove(); return false;">Удалить</a>
                                                            </c:if>
                                                        </div>
                                                    </div>
                                                </c:forEach>

                                            </c:if>
                                        </c:forEach>

                                    </div>
                                </div>
                            </div>
                        </sf:form>
                    </div>
                </div>
            </c:forEach>
            <c:if test="${!empty(listRequests)}">
                <div class="row justify-content-center text-center mt-2">
                    <div class="nav nav-pills">
                        <a class="myLinkButton  m-1" id="firstPage"  href="#">Первая</a>
                        <a class="myLinkButton  m-1" id="prevPage"  href="#">Предыдущая</a>
                        <a class="myLinkButton  m-1" id="pageNumber1" href="#">1</a>
                        <a class="myLinkButton  m-1" id="pageNumber2"  href="#">2</a>
                        <a class="myLinkButton  m-1" id="pageNumber3"  href="#">3</a>
                        <a class="myLinkButton  m-1" id="pageNumber4"  href="#">4</a>
                        <a class="myLinkButton  m-1" id="pageNumber5"  href="#">5</a>
                        <a class="myLinkButton  m-1" id="nextPage"  href="#">Следующая</a>
                        <a class="myLinkButton  m-1" id="lastPage"  href="/privateOffice?username=<security:authentication property="principal.username"/>&pageNumber=${endPageNumber}">Последняя</a>
                    </div>
                </div>
            </c:if>
        </div>
    </div>
</div>

<script >
    $(function () {
        //если первая страница
        if((${pageNumber})==0)
        {
            $('#firstPage').addClass('inactiveLink disabled');
            $('#prevPage').addClass('inactiveLink disabled');
            $('#pageNumber1').css('color','white');
            $('#pageNumber1').css('backgroundColor','#b94964');
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
                    $('#pageNumber2').prop('href','/privateOffice?username=<security:authentication property="principal.username"/>&pageNumber=${pageNumber+1}');
                    $('#pageNumber3').remove();
                    $('#pageNumber4').remove();
                    $('#pageNumber5').remove();
                    $('#nextPage').prop('href','/privateOffice?username=<security:authentication property="principal.username"/>&pageNumber=${pageNumber+1}');
                    $('#lastPage').prop('href','/privateOffice?username=<security:authentication property="principal.username"/>&pageNumber=${endPageNumber}');
                    break;
                case 2:
                    $('#pageNumber2').prop('href','/privateOffice?username=<security:authentication property="principal.username"/>&pageNumber=${pageNumber+1}');
                    $('#pageNumber3').prop('href','/privateOffice?username=<security:authentication property="principal.username"/>&pageNumber=${pageNumber+2}');
                    $('#pageNumber4').remove();
                    $('#pageNumber5').remove();
                    $('#nextPage').prop('href','/privateOffice?username=<security:authentication property="principal.username"/>&pageNumber=${pageNumber+1}');
                    $('#lastPage').prop('href','/privateOffice?username=<security:authentication property="principal.username"/>&pageNumber=${endPageNumber}');
                    break;
                case 3:
                    $('#pageNumber2').prop('href','/privateOffice?username=<security:authentication property="principal.username"/>&pageNumber=${pageNumber+1}');
                    $('#pageNumber3').prop('href','/privateOffice?username=<security:authentication property="principal.username"/>&pageNumber=${pageNumber+2}');
                    $('#pageNumber4').prop('href','/privateOffice?username=<security:authentication property="principal.username"/>&pageNumber=${pageNumber+3}');
                    $('#pageNumber5').remove();
                    $('#nextPage').prop('href','/privateOffice?username=<security:authentication property="principal.username"/>&pageNumber=${pageNumber+1}');
                    $('#lastPage').prop('href','/privateOffice?username=<security:authentication property="principal.username"/>&pageNumber=${endPageNumber}');
                    break;
                default:
                    $('#pageNumber2').prop('href','/privateOffice?username=<security:authentication property="principal.username"/>&pageNumber=${pageNumber+1}');
                    $('#pageNumber3').prop('href','/privateOffice?username=<security:authentication property="principal.username"/>&pageNumber=${pageNumber+2}');
                    $('#pageNumber4').prop('href','/privateOffice?username=<security:authentication property="principal.username"/>&pageNumber=${pageNumber+3}');
                    $('#pageNumber5').prop('href','/privateOffice?username=<security:authentication property="principal.username"/>&pageNumber=${pageNumber+4}');
                    $('#nextPage').prop('href','/privateOffice?username=<security:authentication property="principal.username"/>&pageNumber=${pageNumber+1}');
                    $('#lastPage').prop('href','/privateOffice?username=<security:authentication property="principal.username"/>&pageNumber=${endPageNumber}');
                    break;
            }

        }
        //если вторая страница
        else if((${pageNumber})==1)
        {
            $('#firstPage').prop('href','/privateOffice?username=<security:authentication property="principal.username"/>&pageNumber=0');
            $('#prevPage').prop('href','/privateOffice?username=<security:authentication property="principal.username"/>&pageNumber=${pageNumber-1}');
            $('#pageNumber1').prop('href','/privateOffice?username=<security:authentication property="principal.username"/>&pageNumber=${pageNumber-1}')
            $('#pageNumber2').css('color','white');
            $('#pageNumber2').css('backgroundColor','#b94964');
            $('#pageNumber2').prop('href','/privateOffice?username=<security:authentication property="principal.username"/>&pageNumber=${pageNumber}');
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
                    $('#pageNumber3').prop('href','/privateOffice?username=<security:authentication property="principal.username"/>&pageNumber=${pageNumber+1}');
                    $('#pageNumber4').remove();
                    $('#pageNumber5').remove();
                    $('#nextPage').prop('href','/privateOffice?username=<security:authentication property="principal.username"/>&pageNumber=${pageNumber+1}');
                    $('#lastPage').prop('href','/privateOffice?username=<security:authentication property="principal.username"/>&pageNumber=${endPageNumber}');
                    break;
                case 2:
                    $('#pageNumber3').prop('href','/privateOffice?username=<security:authentication property="principal.username"/>&pageNumber=${pageNumber+1}');
                    $('#pageNumber4').prop('href','/privateOffice?username=<security:authentication property="principal.username"/>&pageNumber=${pageNumber+2}');
                    $('#pageNumber5').remove();
                    $('#nextPage').prop('href','/privateOffice?username=<security:authentication property="principal.username"/>&pageNumber=${pageNumber+1}');
                    $('#lastPage').prop('href','/privateOffice?username=<security:authentication property="principal.username"/>&pageNumber=${endPageNumber}');
                    break;
                default:
                    $('#pageNumber3').prop('href','/privateOffice?username=<security:authentication property="principal.username"/>&pageNumber=${pageNumber+1}');
                    $('#pageNumber4').prop('href','/privateOffice?username=<security:authentication property="principal.username"/>&pageNumber=${pageNumber+2}');
                    $('#pageNumber5').prop('href','/privateOffice?username=<security:authentication property="principal.username"/>&pageNumber=${pageNumber+3}');
                    $('#nextPage').prop('href','/privateOffice?username=<security:authentication property="principal.username"/>&pageNumber=${pageNumber+1}');
                    $('#lastPage').prop('href','/privateOffice?username=<security:authentication property="principal.username"/>&pageNumber=${endPageNumber}');
                    break;
            }
        }
        //если последняя страница
        else if((${pageNumber})==${endPageNumber})
        {   $('#firstPage').prop('href','/privateOffice?username=<security:authentication property="principal.username"/>&pageNumber=0');
            $('#prevPage').prop('href','/privateOffice?username=<security:authentication property="principal.username"/>&pageNumber=${pageNumber-1}');
            $('#lastPage').addClass('inactiveLink disabled');
            $('#nextPage').addClass('inactiveLink disabled');

            switch (${endPageNumber})
            {
                case 0:
                    $('#pageNumber1').css('color','white');
                    $('#pageNumber1').css('backgroundColor','#b94964');
                    $('#pageNumber1').prop('href','/privateOffice?username=<security:authentication property="principal.username"/>&pageNumber=${endPageNumber}');
                    $('#pageNumber2').remove();
                    $('#pageNumber3').remove();
                    $('#pageNumber4').remove();
                    $('#pageNumber5').remove();
                    $('#prevPage').addClass('inactiveLink disabled');
                    $('#firstPage').addClass('inactiveLink disabled');
                    break;
                case 1:
                    $('#pageNumber1').prop('href','/privateOffice?username=<security:authentication property="principal.username"/>&pageNumber=${endPageNumber-1}');
                    $('#pageNumber2').css('color','white');
                    $('#pageNumber2').css('backgroundColor','#b94964');
                    $('#pageNumber2').prop('href','/privateOffice?username=<security:authentication property="principal.username"/>&pageNumber=${endPageNumber}');
                    $('#pageNumber3').remove();
                    $('#pageNumber4').remove();
                    $('#pageNumber5').remove();
                    break;
                case 2:
                    $('#pageNumber1').prop('href','/privateOffice?username=<security:authentication property="principal.username"/>&pageNumber=${endPageNumber-2}');
                    $('#pageNumber2').prop('href','/privateOffice?username=<security:authentication property="principal.username"/>&pageNumber=${endPageNumber-1}');
                    $('#pageNumber3').css('color','white');
                    $('#pageNumber3').css('backgroundColor','#b94964');
                    $('#pageNumber3').prop('href','/privateOffice?username=<security:authentication property="principal.username"/>&pageNumber=${endPageNumber}');
                    $('#pageNumber4').remove();
                    $('#pageNumber5').remove();
                    break;
                case 3:
                    $('#pageNumber1').prop('href','/privateOffice?username=<security:authentication property="principal.username"/>&pageNumber=${endPageNumber-3}');
                    $('#pageNumber2').prop('href','/privateOffice?username=<security:authentication property="principal.username"/>&pageNumber=${endPageNumber-2}');
                    $('#pageNumber3').prop('href','/privateOffice?username=<security:authentication property="principal.username"/>&pageNumber=${endPageNumber-1}');
                    $('#pageNumber4').css('color','white');
                    $('#pageNumber4').css('backgroundColor','#b94964');
                    $('#pageNumber4').prop('href','/privateOffice?username=<security:authentication property="principal.username"/>&pageNumber=${endPageNumber}');
                    $('#pageNumber5').remove();
                    break;
                default:
                    $('#pageNumber1').prop('href','/privateOffice?username=<security:authentication property="principal.username"/>&pageNumber=${endPageNumber-4}');
                    $('#pageNumber1').prop('innerHTML','${endPageNumber-3}');
                    $('#pageNumber2').prop('href','/privateOffice?username=<security:authentication property="principal.username"/>&pageNumber=${endPageNumber-3}');
                    $('#pageNumber2').prop('innerHTML','${endPageNumber-2}');
                    $('#pageNumber3').prop('href','/privateOffice?username=<security:authentication property="principal.username"/>&pageNumber=${endPageNumber-2}');
                    $('#pageNumber3').prop('innerHTML','${endPageNumber-1}');
                    $('#pageNumber4').prop('href','/privateOffice?username=<security:authentication property="principal.username"/>&pageNumber=${endPageNumber-1}');
                    $('#pageNumber4').prop('innerHTML','${endPageNumber}');
                    $('#pageNumber5').css('color','white');
                    $('#pageNumber5').css('backgroundColor','#b94964');
                    $('#pageNumber5').prop('href','/privateOffice?username=<security:authentication property="principal.username"/>&pageNumber=${endPageNumber}');
                    $('#pageNumber5').prop('innerHTML','${endPageNumber+1}');
                    break;

            }

        }
        //если предпоследняя страница
        else if((${pageNumber})==(${endPageNumber}-1))
        {
            $('#firstPage').prop('href','/privateOffice?username=<security:authentication property="principal.username"/>&pageNumber=0');
            $('#prevPage').prop('href','/privateOffice?username=<security:authentication property="principal.username"/>&pageNumber=${pageNumber-1}');
            $('#lastPage').prop('href','/privateOffice?username=<security:authentication property="principal.username"/>&pageNumber=${endPageNumber}');
            $('#nextPage').prop('href','/privateOffice?username=<security:authentication property="principal.username"/>&pageNumber=${pageNumber+1}');
            if((${pageNumber})==2)
            {
                $('#pageNumber1').prop('href','/privateOffice?username=<security:authentication property="principal.username"/>&pageNumber=${pageNumber-2}');
                $('#pageNumber2').prop('href','/privateOffice?username=<security:authentication property="principal.username"/>&pageNumber=${pageNumber-1}');
                $('#pageNumber3').prop('href','/privateOffice?username=<security:authentication property="principal.username"/>&pageNumber=${pageNumber}');
                $('#pageNumber3').css('color','white');
                $('#pageNumber3').css('backgroundColor','#b94964');
                $('#pageNumber4').prop('href','/privateOffice?username=<security:authentication property="principal.username"/>&pageNumber=${pageNumber+1}');
                $('#pageNumber5').remove();
            }
            else
            {
                $('#pageNumber1').prop('href','/privateOffice?username=<security:authentication property="principal.username"/>&pageNumber=${pageNumber-3}');
                $('#pageNumber1').prop('innerHTML','${pageNumber-2}');
                $('#pageNumber2').prop('href','/privateOffice?username=<security:authentication property="principal.username"/>&pageNumber=${pageNumber-2}');
                $('#pageNumber2').prop('innerHTML','${pageNumber-1}');
                $('#pageNumber3').prop('href','/privateOffice?username=<security:authentication property="principal.username"/>&pageNumber=${pageNumber-1}');
                $('#pageNumber3').prop('innerHTML','${pageNumber}');
                $('#pageNumber4').prop('href','/privateOffice?username=<security:authentication property="principal.username"/>&pageNumber=${pageNumber}');
                $('#pageNumber4').prop('innerHTML','${pageNumber+1}');
                $('#pageNumber4').css('color','white');
                $('#pageNumber4').css('backgroundColor','#b94964');
                $('#pageNumber5').prop('href','/privateOffice?username=<security:authentication property="principal.username"/>&pageNumber=${pageNumber+1}');
                $('#pageNumber5').prop('innerHTML','${pageNumber+2}');
            }
        }
        //если между первыми двумя и последними двумя
        else if((${pageNumber})>1&&(${pageNumber})<${endPageNumber-1})
        {
            $('#firstPage').prop('href','/privateOffice?username=<security:authentication property="principal.username"/>&pageNumber=0');
            $('#prevPage').prop('href','/privateOffice?username=<security:authentication property="principal.username"/>&pageNumber=${pageNumber-1}');
            $('#lastPage').prop('href','/privateOffice?username=<security:authentication property="principal.username"/>&pageNumber=${endPageNumber}');
            $('#nextPage').prop('href','/privateOffice?username=<security:authentication property="principal.username"/>&pageNumber=${pageNumber+1}');
            $('#pageNumber3').css('color','white');
            $('#pageNumber3').css('backgroundColor','#b94964');
            $('#pageNumber3').prop('innerHTML','${pageNumber+1}');
            $('#pageNumber3').prop('href','/privateOffice?username=<security:authentication property="principal.username"/>&pageNumber=${pageNumber}');
            $('#pageNumber2').prop('innerHTML','${pageNumber}');
            $('#pageNumber2').prop('href','/privateOffice?username=<security:authentication property="principal.username"/>&pageNumber=${pageNumber-1}');
            $('#pageNumber1').prop('innerHTML','${pageNumber-1}');
            $('#pageNumber1').prop('href','/privateOffice?username=<security:authentication property="principal.username"/>&pageNumber=${pageNumber-2}');
            $('#pageNumber4').prop('innerHTML','${pageNumber+2}');
            $('#pageNumber4').prop('href','/privateOffice?username=<security:authentication property="principal.username"/>&pageNumber=${pageNumber+1}');
            $('#pageNumber5').prop('innerHTML','${pageNumber+3}');
            $('#pageNumber5').prop('href','/privateOffice?username=<security:authentication property="principal.username"/>&pageNumber=${pageNumber+2}');
        }

    })
</script>
</body>
</html>
