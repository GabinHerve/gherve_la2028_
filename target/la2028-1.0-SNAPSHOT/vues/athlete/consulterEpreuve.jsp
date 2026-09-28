<%--
  Created by IntelliJ IDEA.
  User: sio2
  Date: 28/09/2026
  Time: 13:21
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="sio.la2028.model.Epreuve"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>LOS ANGELES 2028</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/style.css">
</head>
<body>
<%
    Epreuve e = (Epreuve) request.getAttribute("pEpreuve");
%>
<h1><%= e.getLibelle() %></h1>

<table>
    <tr>
        <td>Id : </td><td><%= e.getId() %></td>
    </tr>
    <tr>
        <td>Sport : </td><td><a href="../ServletSport/consulter?idSport=<%= e.getSport().getId() %>"><%= e.getSport().getLibelle() %></a></td>
    </tr>
</table>
</body>
</html>