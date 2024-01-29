<%@page import="java.sql.Statement" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

 <link rel="stylesheet"
href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7"
crossorigin="anonymous">
<link rel="stylesheet"
href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css"
integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r"
crossorigin="anonymous">
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
 integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS"
 crossorigin="anonymous"></script>
 <meta charset="UTF-8">
 <title>Insert title here</title>
</head>
<body>
<%Class.forName("com.mysql.jdbc.Driver");
Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/bd_scott", "root", "root");
Statement s = conexion.createStatement();

ResultSet listado = s.executeQuery("SELECT * FROM emp ORDER BY 1");

Statement z = conexion.createStatement();
ResultSet jefes = z.executeQuery("SELECT ENAME,EMPNO FROM EMP WHERE EMPNO IN(SELECT DISTINCT MGR FROM EMP WHERE MGR IS NOT NULL) ORDER BY 1");

Statement w = conexion.createStatement();
ResultSet departamentos = w.executeQuery("SELECT DNAME, DEPTNO from DEPT ORDER BY 1");
	%>
<div class="container">
		<br> <br>
		<div class="panel panel-info">
			<div class="panel-heading text-center">Modificando Empleado</div>
			<form method="action" action="grabaSocioModificado.jsp">
				<div class="form-group">
					<label>EMPNO:</label> <input type="text" size="5"
						name="empno" value="<%=request.getParameter("empno")%>">
				</div>
				<div class="form-group">
					<label>ENAME:</label> <input type="text"
						size="35" name="ename"
						value="<%=request.getParameter("ename")%>">
				</div>
				<div class="form-group">
					<label>JOB:</label><input type="text" size="5"
						name="job" value="<%=request.getParameter("job")%>">
						
				</div>
				
				<div class="form-group">
					<label>MGR:</label> <select id="mgr" name="mgr">
        <%
        String selectedMgr = request.getParameter("mgr");
        while(jefes.next()) {
            String empno = jefes.getString("EMPNO");
            String ename = jefes.getString("ENAME");
        %>
            <option value="<%=empno %>" <%= (empno.equals(selectedMgr)) ? "selected" : "" %>>
                <%=ename %>
            </option>
        <% } %>
    </select>
						
				</div>
				<div class="form-group">
					<label>SAL:</label><input type="text" size="5"
						name="sal" value="<%=request.getParameter("sal")%>">
						
				</div>
				
				<div class="form-group">
					<label>COMM:</label><input type="text" size="5"
						name="comm" value="<%=request.getParameter("comm")%>">
						
				</div>
				
				<div class="form-group">
					<label>DEPTNO:</label><select id="depto" name="deptno">
        <%
        String selectedDeptno = request.getParameter("deptno"); 
        while(departamentos.next()) {
            String deptno = departamentos.getString("DEPTNO");
            String dname = departamentos.getString("DNAME");
        %>
            <option value="<%=deptno %>" <%= (deptno.equals(selectedDeptno)) ? "selected" : "" %>>
                <%=dname %>
            </option>
        <% } %>
    </select>
						
				</div>
				
				<div class="form-group">
					<label>HIREDATE:</label><input type="text" size="5"
						name="hiredate" value="<%=request.getParameter("hiredate")%>">
						
				</div>
				
				<hr>
				<a href="index.jsp" class="btn btn-danger"><span
					class="glyphicon glyphicon-remove"></span> Cancelar</a>
				<button type="submit" class="btn btn-success">
					<span clas="glyphicon glyphicon-ok"></span>Aceptar
				</button>
				<br> <br>
			</form>
		</div>
	</div>
</body>
</html>