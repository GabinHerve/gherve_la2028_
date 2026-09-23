<%-- 
    Document   : listerAthletes
    Created on : 25 août 2026, 12:27:51
    Author     : zakina
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="sio.la2028.model.Athlete"%>
<%@page import="sio.la2028.model.Pays"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>LOS ANGELES 2028</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/style.css">
</head>
    <body>
        <%
                Athlete a = (Athlete)request.getAttribute("pAthlete");
        %>
        <h1><%  out.println(a.getPrenom()); out.println(a.getNom()); %></h1>
        <img src="${pageContext.request.contextPath}/vues/img/image<%= a.getId() %>.jpg" alt="Photo de <%= a.getPrenom() %> <%= a.getNom() %>" width="200">
                         
            <table>
            <tr>
                <td>Id: </td><td><%  out.println(a.getId());%></td>
            </tr>
            <tr>
                <td>Date de naissance: </td><td><%  out.println(a.getDate());%></td>
            </tr>
            <tr>
                <td>Pays : </td><td><%  out.println(a.getPays().getNom());%></td>
            </tr>
            <tr>
                <td>Sport : </td><td><%  out.println(a.getSport().getLibelle());%></td>
            </tr>
        </table>
</html>
