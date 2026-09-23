<%--
  Created by IntelliJ IDEA.
  User: sio2
  Date: 14/09/2026
  Time: 13:07
  To change this template use File | Settings | File Templates.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="sio.la2028.model.Sport"%>
<%@page import="java.util.ArrayList"%>
<%@page import="sio.la2028.model.Epreuve" %>
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
  <h2 class="h2">Liste des épreuves</h2>
  <div class="table-responsive">
          <%
               ArrayList<Epreuve> lesEpreuves = (ArrayList)request.getAttribute("pLesEpreuves");
          %>
    <table class="table table-striped table-sm">
      <thead>
      <tr>
        <th>id</th>
        <th>libelle</th>
        <th>sport</th>
      </tr>
      </thead>
      <tbody>
      <tr>
        <%
          for (Epreuve e : lesEpreuves)
          {
            out.println("<tr><td>");
            out.println(e.getId());
            out.println("</td>");

            out.println("<td>");
            out.println(e.getLibelle());
            out.println("</td>");;

            out.println("<td>");
            out.println(e.getSport().getLibelle());
            out.println("</td>");

          }
        %>
      </tr>
      </tbody>
    </table>
</body>
</div>
</div>

</html>
