<%--
  Created by IntelliJ IDEA.
  User: sio2
  Date: 30/09/2026
  Time: 10:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.util.ArrayList"%>
<%@page import="sio.la2028.model.Sport"%>
<%@page import="sio.la2028.form.FormEpreuve"%>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>LOS ANGELES 2028</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/style/style.css">
</head>
<body class="page-form">
<h1 class="page-title">NOUVELLE EPREUVE</h1>

<%
  FormEpreuve form = (FormEpreuve)request.getAttribute("form");
%>

<form class="form-card" action="ajouter" method="POST">

  <div class="form-group">
    <label for="libelle">Libellé :</label>
    <input id="libelle" type="text" name="libelle" maxlength="30">
  </div>

  <%-- Champ Liste des sports --%>
  <div class="form-group">
    <label for="sport">Sport :</label>
    <select id="sport" name="idSport">
      <%
        ArrayList<Sport> lesSports = (ArrayList)request.getAttribute("pLesSports");
        for (int i = 0; i < lesSports.size(); i++) {
          Sport s = lesSports.get(i);
          out.println("<option value='" + s.getId() + "'>" + s.getLibelle() + "</option>");
        }
      %>
    </select>
  </div>

  <input class="btn-submit" type="submit" name="valider" id="valider" value="Valider"/>
</form>

</body>
</html>