<%@page import="java.sql.Statement" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% Class.forName("com.mysql.jdbc.Driver"); Connection
conexion=DriverManager.getConnection("jdbc:mysql://localhost:3306/baloncesto","root","root");
Statement s=conexion.createStatement(); ResultSet listado=s.executeQuery("SELECT * FROM socio"); 
String actualizacion = 
String.format("UPDATE SOCIO SET NOMBRE='%s', ESTATURA=%s, EDAD=%s, LOCALIDAD='%s' WHERE SOCIOID=%s",
request.getParameter("nombre"),request.getParameter("estatura"),
request.getParameter("edad"),request.getParameter("localidad"),
request.getParameter("socioID")
);
s.execute(actualizacion);
s.close();
%>
<script>document.location="index.jsp"</script>
</body>
</html>