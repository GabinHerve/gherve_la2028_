<%--
  Created by IntelliJ IDEA.
  User: sio2
  Date: 14/09/2026
  Time: 15:33
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="sio.la2028.model.Pays"%>
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
      <a  href ='../ServletAthlete/lister' class="navbar-brand" href=".">Système de gestion des athlètes</a>
      <a  href ='../ServletPays/listerPays' class="navbar-brand" href=".">Système de gestion des pays</a>
      <a  href ='../ServletSport/listerSport' class="navbar-brand" href=".">Système de gestion des sports</a>
      <a  href ='../ServletEpreuve/listerEpreuve' class="navbar-brand" href=".">Système de gestion des épreuves</a>
    </div>
  </div>
</nav>
<div class="container special">
  <h2 class="h2">Liste des pays</h2>
  <div class="table-responsive">
          <%
                ArrayList<Pays> lesPays = (ArrayList)request.getAttribute("pLesPays");
          %>
    <table class="table table-striped table-sm">
      <thead>
      <tr>
        <th>id</th>
        <th>nom</th>
      </tr>
      </thead>
      <tbody>
      <tr>
        <%
          for (Pays p : lesPays)
          {
            out.println("<tr><td>");
            out.println(p.getId());
            out.println("</td>");

            out.println("<td><a href ='../ServletPays/consulter?idPays="+ p.getId()+ "'>");
            out.println(p.getNom());
            out.println("</a></td>");;

          }
        %>
      </tr>
      </tbody>
    </table>
</body>

</html>
