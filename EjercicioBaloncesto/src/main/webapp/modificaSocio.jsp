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
<%request.setCharacterEncoding("UTF-8"); %>
<div class="container">
	<div class="panel panel-primary">
		<div class="panel-heading text-center">
			modificar
		</div>
		<form get="get "action="grabaSocioModificado.jsp">
		<input  type="hidden" name="socioID" value="<%=request.getParameter("socioID")%>" size="10"><br><br>
		Nombre: <input type="text" name="nombre" value="<%=request.getParameter("nombre")%>" size=35><br><br>
		Estatura: <input type="text" name="estatura" value="<%=request.getParameter("estatura")%>" size="10"><br><br>
		Edad: <input type="text"  name="edad" value="<%=request.getParameter("edad")%>" size="10"><br><br>
		Localidad: <input type="text" name="localidad" value="<%=request.getParameter("localidad")%>" size="10"><br><br>
		<button type="submit" class="btn btn-info"><span class="glyphicon glyphicon-pencil">
		</span>Modificar</button>
		<a href="index.jsp"  class="btn btn-danger"><span class="glyphicon glyphicon-remove">
		</span>Cancelar</a>
		</form>
	</div>
</div>
</body>
</html>