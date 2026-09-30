<%--
  Created by IntelliJ IDEA.
  User: sio2
  Date: 30/09/2026
  Time: 10:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="sio.la2028.form.FormSite"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>LOS ANGELES 2028</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/style.css">
</head>
<body class="page-form">
<h1 class="page-title">NOUVEAU SITE</h1>

<%
    FormSite form = (FormSite)request.getAttribute("form");
%>

<form class="form-card" action="ajouter" method="POST">

    <div class="form-group">
        <label for="nom">Nom :</label>
        <input id="nom" type="text" name="nom" maxlength="30">
    </div>

    <input class="btn-submit" type="submit" name="valider" id="valider" value="Valider"/>
</form>

</body>
</html>