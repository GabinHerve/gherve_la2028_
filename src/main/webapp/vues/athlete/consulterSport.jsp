<%--
  Created by IntelliJ IDEA.
  User: sio2
  Date: 21/09/2026
  Time: 10:48
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="sio.la2028.model.Athlete"%>
<%@page import="sio.la2028.model.Sport"%>
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
                Sport s = (Sport)request.getAttribute("pSport");
                ArrayList<Athlete> lesAthletesSports = (ArrayList<Athlete>) request.getAttribute("lesAthletesSport");
        %>
<h1><%  out.println(s.getLibelle()); %></h1>
<img src="${pageContext.request.contextPath}/vues/img/sport<%= s.getId() %>.jpg" alt="Photo du sport : <%= s.getLibelle() %>" width="200">


<table>
    <tr>
        <td>Id: </td><td><%  out.println(s.getId());%></td>
    </tr>
</table>

<h2>Athlètes participant à ce sport :</h2>
<table>
    <tr>
        <th>Nom</th>
        <th>Prénom</th>
        <th>Pays</th>
    </tr>
    <%
        if (lesAthletesSports != null && !lesAthletesSports.isEmpty()) {
            for (Athlete a : lesAthletesSports) {
    %>
    <tr>
        <td><a href="../ServletAthlete/consulter?idAthlete=<%= a.getId() %>"><%= a.getNom() %></a></td>
        <td><a href="../ServletAthlete/consulter?idAthlete=<%= a.getId() %>"><%= a.getPrenom() %></a></td>
        <td><a href="../ServletPays/consulter?idPays=<%= a.getPays().getId() %>"><%= a.getPays().getNom() %></a></td>
    </tr>
    <%
        }
    } else {
    %>
    <tr>
        <td colspan="3">Aucun athlète enregistré pour ce sport.</td>
    </tr>
    <%
        }
    %>
</table>
</html>
