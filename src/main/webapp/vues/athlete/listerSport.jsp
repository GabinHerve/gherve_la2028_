<%--
    Document   : listerAthletes
    Created on : 25 août 2026, 12:27:51
    Author     : zakina
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="sio.la2028.model.Sport"%>
<%@page import="sio.la2028.model.Athlete"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="sio.la2028.model.Pays" %>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>LOS ANGELES 2028</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/style/style.css">
</head>
<body>

<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container">
    <div class="navbar-header">
      <a  href ='../ServletAthlete/lister' class="navbar-brand" href=".">Système de gestion des athlètes</a>
      <a  href ='../ServletPays/listerPays' class="navbar-brand" href=".">Système de gestion des pays</a>
      <a  href ='../ServletSport/listerSport' class="navbar-brand" href=".">Système de gestion des sports</a>
      <a  href ='../ServletEpreuve/listerEpreuve' class="navbar-brand" href=".">Système de gestion des épreuves</a>
    </div>
  </div>
</nav>
<div class="container special">
  <h2 class="h2">Liste des sports</h2>
  <div class="table-responsive">
      <%
                ArrayList<Sport> lesSports = (ArrayList)request.getAttribute("pLesSports");
          %>
    <table class="table table-striped table-sm">
      <thead>
      <tr>
        <th>id</th>
        <th>libelle</th>
      </tr>
      </thead>
      <tbody>
      <tr>
        <%
          for (Sport s : lesSports)
          {
            out.println("<tr><td>");
            out.println(s.getId());
            out.println("</td>");

            out.println("<td><a href ='../ServletSport/consulter?idSport="+ s.getId()+ "'>");
            out.println(s.getLibelle());
            out.println("</a></td>");;

          }
        %>
      </tr>
      </tbody>
    </table>
</body>
</html>
