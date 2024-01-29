<%@page import="java.sql.Statement" %>
    <%@page import="java.sql.ResultSet" %>
        <%@page import="java.sql.DriverManager" %>
            <%@page import="java.sql.Connection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<%
Class.forName("com.mysql.jdbc.Driver"); 
Connection conexion=DriverManager.getConnection("jdbc:mysql://localhost:3306/bd_scott","root","root");
Statement s=conexion.createStatement(); 
s.execute("DELETE FROM emp WHERE EMPNO="+request.getParameter("empNo"));
s.close();
%>
<script>document.location="index.jsp"</script>
</body>
</html>