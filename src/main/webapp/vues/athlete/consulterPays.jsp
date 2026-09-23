<%--
  Created by IntelliJ IDEA.
  User: sio2
  Date: 14/09/2026
  Time: 16:35
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="sio.la2028.model.Athlete"%>
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
  <%
                Pays p = (Pays)request.getAttribute("pPays");
                ArrayList<Athlete> lesAthletesPays = (ArrayList<Athlete>) request.getAttribute("lesAthletesPays");
        %>
<h1><%  out.println(p.getNom()); %></h1>
<img src="${pageContext.request.contextPath}/vues/img/pays<%= p.getId() %>.jpg" alt="Photo du drapeau : <%= p.getNom() %>" width="200">


<table>
  <tr>
    <td>Id: </td><td><%  out.println(p.getId());%></td>
  </tr>
</table>

  <h2>Athlètes représentant ce pays :</h2>
  <table>
      <tr>
          <th>Nom</th>
          <th>Prénom</th>
          <th>Sport</th>
      </tr>
      <%
          if (lesAthletesPays != null && !lesAthletesPays.isEmpty()) {
              for (Athlete a : lesAthletesPays) {
      %>
      <tr>
          <td><%= a.getNom() %></td>
          <td><%= a.getPrenom() %></td>
          <td><%= a.getSport().getLibelle() %></td>
      </tr>
      <%
          }
      } else {
      %>
      <tr>
          <td colspan="3">Aucun athlète enregistré pour ce pays.</td>
      </tr>
      <%
          }
      %>
  </table>
</html>
