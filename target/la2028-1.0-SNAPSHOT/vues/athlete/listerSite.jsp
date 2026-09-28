<%--
  Created by IntelliJ IDEA.
  User: sio2
  Date: 28/09/2026
  Time: 13:44
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="sio.la2028.model.Site"%>
<%@page import="java.util.ArrayList"%>
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
      <a href='../ServletAthlete/lister' class="navbar-brand">Système de gestion des athlètes</a>
      <a href='../ServletPays/listerPays' class="navbar-brand">Système de gestion des pays</a>
      <a href='../ServletSport/listerSport' class="navbar-brand">Système de gestion des sports</a>
      <a href='../ServletEpreuve/listerEpreuve' class="navbar-brand">Système de gestion des épreuves</a>
      <a href='../ServletSite/listerSite' class="navbar-brand">Système de gestion des sites</a>
    </div>
  </div>
</nav>
<div class="container special">
  <h2 class="h2">Liste des sites</h2>
  <div class="table-responsive">
    <%
      ArrayList<Site> lesSites = (ArrayList<Site>) request.getAttribute("pLesSites");
    %>
    <table class="table table-striped table-sm">
      <thead>
      <tr>
        <th>id</th>
        <th>nom</th>
      </tr>
      </thead>
      <tbody>
      <%
        for (Site s : lesSites)
        {
      %>
      <tr>
        <td><%= s.getId() %></td>
        <td><a href="../ServletSite/consulter?idSite=<%= s.getId() %>"><%= s.getNom() %></a></td>
      </tr>
      <%
        }
      %>
      </tbody>
    </table>
  </div>
</div>
</body>
</html>