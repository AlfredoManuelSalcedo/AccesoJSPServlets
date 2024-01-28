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
             conexion=DriverManager.getConnection("jdbc:mysql://localhost:3306/bd_scott","root","root");
             
             Statement s=conexion.createStatement(); 
             ResultSet listado=s.executeQuery("SELECT * FROM EMP"); 
             
             Statement z = conexion.createStatement();
             ResultSet jefes = z.executeQuery("SELECT ENAME,EMPNO FROM EMP WHERE EMPNO IN(SELECT DISTINCT MGR FROM EMP WHERE MGR IS NOT NULL) ORDER BY 1");
             
             Statement w = conexion.createStatement();
             ResultSet departamentos = w.executeQuery("SELECT DNAME, DEPTNO from DEPT ORDER BY 1");
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
                    <td><input type="text" name="eName" size="5"></td>
                    <td><input type="text" name="job" size="5"></td>
                    <td><select name="mgr">
                    <% while(jefes.next()){
                    	%>
                    	<option value="<%=jefes.getString("EMPNO") %>">
                    	<%=jefes.getString("ENAME")%>
                    	</option>
                    	<%
                    }
                    %>
                    </select></td>
                    <td><input type="text" name="sal" size="5"></td>
                    <td><input type="text" name="comm" size="5"></td>
                    <td><select name="DEPTNO">
                    <% while(departamentos.next()){
                    	%>
                    	<option value="<%=departamentos.getString("DEPTNO") %>">
                    	<%=departamentos.getString("DNAME")%>
                    	</option>
                    	<%
                    }
                    %>
                    </select></td>
                    <td><input type="text" name="hireDate" size="5"></td>
                    <td><button type="submit" value="Añadir" class="btn btn-primary">
                    <span class="glyphicon glyphicon-plus"></span>Añadir</button>
                    </td>
                    </tr>
                </form>
            <%
            while(listado.next()){
            	out.println("<tr><td>");
                out.println(listado.getString("EMPNO")+"</td>"); 
                out.println("<td>"+ listado.getString("ENAME")+"</td>");         
                out.println("<td>"+ listado.getString("JOB")+"</td>");
                out.println("<td>"+ listado.getString("MGR")+"</td>");
                out.println("<td>"+ listado.getString("SAL")+"</td>");
                out.println("<td>"+ listado.getString("COMM")+"</td>");
                out.println("<td>"+ listado.getString("EMPNO")+"</td>");
                out.println("<td>"+ listado.getString("HIREDATE")+"</td>");
            
            %>
            <td>
                <form method="get" action="modificaSocio.jsp">
                <input type="hidden" name="empno" value="<%=listado.getString("EMPNO")%>">
                <input type="hidden" name="ename" value="<%=listado.getString("ENAME")%>">
                <input type="hidden" name="job" value="<%=listado.getString("JOB")%>">
                <input type="hidden" name="mgr" value="<%=listado.getString("MGR")%>">
                <input type="hidden" name="sal" value="<%=listado.getString("SAL")%>">
                <input type="hidden" name="comm" value="<%=listado.getString("COMM")%>">
                <input type="hidden" name="deptno" value="<%=listado.getString("DEPTNO")%>">
                <input type="hidden" name="hiredate" value="<%=listado.getString("HIREDATE")%>">
                <button type="submit" class="btn btn-info"><span class="glyphicon glyphicon-pencil">
                </span>Modificar</button>
                </form>
           </td>
           <td>
            <form method="get" action="borraSocio.jsp">
            <input type="hidden" name="empNo" value="<%=listado.getString("EMPNO")%>"/>
            <button type="submit" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span>Eliminar</button>
            </form>
           </td></tr>
           <%
            }
            conexion.close();
           %>
		</div>
	</div>

</body>
</html>