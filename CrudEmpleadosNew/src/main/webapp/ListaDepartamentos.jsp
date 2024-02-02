<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="http://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.6/css/materialize.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<title>Mostrar todos los Departamentos</title>

<style type="text/css">
p {
	text-align: center;
}
body {
font-family:verdana,sans-serif;
}
div.paginator {
margin: 10px 0;
}
div.paginator span.elements_found {
float: left;
 font-size: 0.85em;
 }
 div.paginator span.pages {
 float: right;
 }
 div.paginator span.pages span.currentPage {
 font-weight: bold;
 }
div.paginator span.pages a {
padding: 2px;
}
div.paginator span.invisible {
 visibility: hidden;
 }
 </style>
</head>
<body>
	<% request.setCharacterEncoding("UTF-8"); %>
	<div class="container">
		<div class="row"></div>
		<div class="row s6 m6 l6">
			<div class="card grey lighten-5"> 
				<h3 class="center">Departamentos</h3>
				<table class="bordered centered responsive-table">
					<thead>
						<tr>
						<th>DEPTNO</th>
						<th>NOMBRE</th>
						<th>Ciudad</th>
						<th></th>
					</tr>
						</thead>


					<tbody>
						<c:forEach items="${VDepartamentos}" var="Dept">
							<tr>
								<td><c:out value="${Dept.getDEPTNO()}" /></td>
								<td><c:out value="${Dept.getDNAME()}" /></td>
								<td><c:out value="${Dept.getLOC()}" /></td>

								<td><a title="Modificar Artï¿½culo"
									class="btn waves-effect waves-light center green"
									href="SvDepartamentos.do?action=update&DEPTNO=<c:out value="${Dept.getDEPTNO()}"/>">Actualizar</a>
							
								<a class="btn waves-effect waves-light center red"
									href="SvDepartamentos.do?action=delete&DEPTNO=<c:out value="${Dept.getDEPTNO()}"/>">
										Borrar</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<br>
				<p>
					<a title="Añadir departamento"
						class="btn waves-effect waves-light center blue"
						href="SvDepartamentos.do?action=insert">Añadir departamento</a>
				</p>
				<br>

	</div> 
	</div> 
	</div> 
	</div>


 <form action="SvDepartamentos?action=ListaDepartamentos" id="form">
 <input type="hidden" name="offset"/>
 </form>

 <script type="text/javascript">

 // función que realiza las peticiones de consulta. La invoca el paginador
 function find (offset) {
 var form = document.getElementById('form');
 form['offset'].value = offset;
 form.submit();
 }
 </script>
 
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
	<!-- Materialize -->
	<script>
		src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.6/js/materialize.min.js"></script>
</body>
</html>