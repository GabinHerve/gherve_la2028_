<%--
  Created by IntelliJ IDEA.
  User: sio2
  Date: 28/09/2026
  Time: 13:59
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="sio.la2028.model.Site"%>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>LOS ANGELES 2028</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/style/style.css">
</head>
<body>
<%
  Site s = (Site) request.getAttribute("pSite");
%>
<h1><%= s.getNom() %></h1>

<img src="${pageContext.request.contextPath}/vues/img/site<%= s.getId() %>.jpg" alt="Photo du site : <%= s.getNom() %>" width="200" onerror="this.onerror=null; this.style.display='none';">

<table>
  <tr>
    <td>Id : </td><td><%= s.getId() %></td>
  </tr>
</table>
</body>
</html>