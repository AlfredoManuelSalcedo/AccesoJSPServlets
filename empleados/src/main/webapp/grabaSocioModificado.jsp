<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.SQLException" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection connection = DriverManager.getConnection ("jdbc:mysql://localhost:3306/bd_scott", "root", "root");
Statement s = connection.createStatement();
request.setCharacterEncoding("UTF-8");
 
String actualizacion =  String.format("UPDATE emp SET EMPNO='%s', ENAME ='%s', JOB='%s', MGR='%s', SAL='%s', COMM='%s', DEPTNO='%s', HIREDATE = '%s' WHERE EMPNO=%s",
 
request.getParameter("empno"),request.getParameter("ename"),request.getParameter("job"),
request.getParameter("mgr"),request.getParameter("sal"), request.getParameter("comm"), request.getParameter("deptno"), request.getParameter("hiredate"), request.getParameter("empno"));
 
s.execute(actualizacion);
out.println("Empleado actualizado correctamente");
connection.close();
%>
<script>document.location="index.jsp"</script>
</body>
</html>
