<%--
  Created by IntelliJ IDEA.
  User: sio2
  Date: 30/09/2026
  Time: 09:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="sio.la2028.form.FormSport"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>LOS ANGELES 2028</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/style.css">
</head>
<body class="page-form">
<h1 class="page-title">NOUVEAU SPORT</h1>

<%
    FormSport form = (FormSport)request.getAttribute("form");
%>

<form class="form-card" action="ajouter" method="POST">

    <div class="form-group">
        <label for="libelle">Libellé :</label>
        <input id="libelle" type="text" name="libelle" maxlength="30">
    </div>

    <input class="btn-submit" type="submit" name="valider" id="valider" value="Valider"/>
</form>

</body>
</html>