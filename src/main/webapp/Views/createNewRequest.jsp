<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<%--
  Created by IntelliJ IDEA.
  User: Максим
  Date: 22.05.2018
  Time: 2:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Создание новой заявки</title>

</head>
<body>
<div class="container">
    <h2 class="text-center">
        Создайте новую заявку
    </h2>
</div>

<div class="container">
    <div class="row justify-content-center">
      <!--  <div class="col-10 justify-content-center">-->
            <sf:form action="/createNewRequest" modelAttribute="requestsEntity" method="post"   enctype="multipart/form-data">
                <c:if test="${fileError!=null}"><p class="small text-danger">${fileError}</p></c:if>
                <sf:hidden path="requestId"/>
                <sf:hidden path="workStatus"/>
                <div>
                    <label for="pasportSeria" id="pasportSeria">Серия паспорта:</label>
                    <sf:input path="pasportSeria" id="pasportSeria" cssClass="form-control"/>
                    <sf:errors path="pasportSeria"  cssClass=" small text-danger"/>
                </div>
                <div>
                    <label for="pasportNumber">Номер паспорта:</label>
                    <sf:input path="pasportNumber" id="pasportNumber" cssClass="form-control"/>
                    <sf:errors path="pasportNumber"  cssClass="small text-danger"/>
                </div>
                <div>
                    <label for="pasportDate">Дата выдачи</label>
                    <sf:input type="date" path="pasportDate" id="pasportDate" cssClass="form-control"/>
                    <sf:errors path="pasportDate"  cssClass="small text-danger"/>
                </div>
                <div>
                    <label for="pasportWhoLet">Кем выдан:</label>
                    <sf:input path="pasportWhoLet" id="pasportWhoLet" cssClass="form-control"/>
                    <sf:errors path="pasportWhoLet"  cssClass="small text-danger"/>
                </div>
                <div >
                    <label for="snils">Снилс:</label>
                    <sf:input path="snils" id="snils" cssClass="form-control"/>
                    <sf:errors path="snils"  cssClass="small text-danger"/>
                </div>
                <div >
                    <label for="requestType">Вид работы</label>

                    <sf:select path="requestType" id="requestType" cssClass="form-control">
                        <sf:option value="Межевой план" cssClass="form-control">Межевой план</sf:option>
                        <sf:option value="Топографическая съемка" cssClass="form-control">Топографическая сьемка</sf:option>
                        <sf:option value="Технический план" cssClass="form-control">Технический план</sf:option>
                    </sf:select><br/>
                    <div class="alert alert-warning" style="position: relative">
                        <div id="documentInfo" class="justify-content-start">

                        </div>
                    </div>
                </div>
                <div>
                    <input type="file" class="form-control-file" multiple name="files" id="imagesFromUser"><br/>
                    <p class="mt-1 alert alert-warning"><strong>Файлы должны быть в формате png, jpeg.Все сканы должны быть цветными</strong></p>
                </div>
                <sf:button type="submit" class="btn btn-success" value="Подтвердить" >Сохранить</sf:button>
                <p class="mt-4 alert alert-warning"><strong>Сохраняя заявку вы даете согласие на обработку персональных данных</strong></p>
                <input type="hidden" name="username" value="<security:authentication property="principal.username" />">
            </sf:form>
        <!--</div>-->
    </div>
</div>
<script>
    $(function () {
        $('#requestType').click(function () {
            if ($(this).val() == "Межевой план") {
                $('#documentInfo').html('<strong>Перечень документов для составления межевого плана:</strong><br/>'+'<ol>' +
                    '<li>Один из правоустанавливающих документов на землю на выбор</li>' +
                    '<ol>' +
                    '<li>Свидетельство на право</li><li>Свидетельство о государственной регистрации</li><li>Типовой договор</li><li >Государственный акт</li><li >Выписка из ЕГРН</li><li>Договор аренды(от 5 лет и выше)</li>' +
                    '</ol>' +
                    '<li>Уведомление или выписка из ЕГРН на здание</li>' +
                    '</ol>');
            }
            else if ($(this).val() == "Топографическая съемка") {
                $('#documentInfo').html('<strong>Перечень документов для проведения топографической съемки:</strong><br/><ol>' +
                    '<li>Свидетельство на право собственности на землю</li>' +
                    '<li>Свидетельство на право собственности на здание</li>' +
                    '<li>Выписка из ЕГРН, содержащая координаты земельного участка</li>' +
                    '</ol>');
            }
            else if ($(this).val() == "Технический план") {
                $('#documentInfo').html('<strong>Перечень документов для составления технического плана:</strong><br/><ol >' +
                    '<li>Свидетельство на право собственности на землю</li>' +
                    '<li>Свидетельство на право собственности на здание</li>' +
                    '<li>Постановление о присвоениии адреса домовладению</li>' +
                    '<li>Разрешение на строительство</li>' +
                    '</ol >');
            }
        });
    })
    //вызываем событие
    $(function () {
        $('#requestType').click();
    })


</script>


</body>
</html>
