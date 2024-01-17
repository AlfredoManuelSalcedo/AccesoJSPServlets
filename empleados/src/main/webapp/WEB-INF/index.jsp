<%@page import="java.sql.Statement" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Empleados</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7"
crossorigin="anonymous">
<link rel="stylesheet"
href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css"
integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r"
crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS"
crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
	<br><br>
		<div class="panel panel-primary">
			<div class="panel-heading text-center">
                 <h2>EMPLEADOS</h2>
            </div>
             <% Class.forName("com.mysql.jdbc.Driver"); Connection
             conexion=DriverManager.getConnection("jdbc:mysql://localhost:3306/baloncesto","root","root");
             
             Statement s=conexion.createStatement(); 
             ResultSet listado=s.executeQuery("SELECT * FROM socio"); 
             
             Statement z = conexion.createStatement();
             ResultSet jefes = z.executeQuery("SELECT ENAME,EMPNO from EMP");
             
             Statement w = conexion.createStatement();
             ResultSet departamentos = w.executeQuery("SELECT DNAME, DEPTNO from DEPT");
             %>
             <table class="table table-striped">
             <tr>
             	<th>EMPNO</th>
             	<th>ENAME</th>
             	<th>JOB</th>
             	<th>MGR</th>
             	<th>SAL</th>
             	<th>COMM</th>
             	<th>DEPTNO</th>
             	<th>HIREDATE</th>
             </tr>
             <form method="get" action="grabaSocio.jsp">
                <tr>
                    <td><input type="text" name="empNo" size="5"></td>
                    <td><input type="text" name="eName" size="30"></td>
                    <td><input type="text" name="job" size="5"></td>
                    <td><select name="mgr" size="10">
                    
                    </select></td>
                    <td><input type="text" name="sal" size="20"></td>
                    <td><input type="text" name="comm" size="20"></td>
                    <td><select name="DEPTNO" size="10">
                    
                    </select></td>
                    <td><button type="submit" value="Añadir" class="btn btn-primary">
                    <span class="glyphicon glyphicon-plus"></span>Añadir</button>
                                                </td>
                                            </tr>
                                        </form>
		</div>
	</div>

</body>
</html>