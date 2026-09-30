<%-- 
    Document   : ajouterAthlete
    Created on : 25/08/2026, 13:30:47
    Author     : zakina
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="sio.la2028.model.Pays"%>
<%@page import="sio.la2028.model.Sport"%>
<%@page import="sio.la2028.model.Athlete"%>
<%@page import="sio.la2028.form.FormAthlete"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>LOS ANGELES 2028</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/style.css">
</head>
<body class="page-form">
<h1 class="page-title">NOUVEL ATHLETE</h1>

<%
    FormAthlete form = (FormAthlete)request.getAttribute("form");
%>

<form class="form-card" action="ajouter" method="POST">

    <div class="form-group">
        <label for="nom">Nom :</label>
        <input id="nom" type="text" name="nom" maxlength="30">
    </div>

    <div class="form-group">
        <label for="prenom">Prénom :</label>
        <input id="prenom" type="text" name="prenom" maxlength="30">
    </div>

    <div class="form-group">
        <label for="date">Date de naissance :</label>
        <input id="date" type="date" name="date">
    </div>

    <%-- Champ Liste des pays --%>
    <div class="form-group">
        <label for="pays">Pays :</label>
        <select id="pays" name="idPays">
            <%
                ArrayList<Pays> lesPays = (ArrayList)request.getAttribute("pLesPays");
                for (int i = 0; i < lesPays.size(); i++) {
                    Pays p = lesPays.get(i);
                    out.println("<option value='" + p.getId() + "'>" + p.getNom() + "</option>");
                }
            %>
        </select>
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