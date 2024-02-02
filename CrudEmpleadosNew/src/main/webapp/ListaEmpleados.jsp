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
<title>Mostrar todos los Empleados</title>

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
                <h3 class="center">Empleados</h3>
                <table class="bordered centered responsive-table">
                    <thead>
            <tr>
                <th>EMPNO</th><th>NOMBRE</th><th>JOB</th><th>MGR</th><th>SAL</th><th>COMM</th><th>DEPTNO</th><th>HIREDATE</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${VEmpleados}" var="Emp">
                <tr>
                    <td><c:out value="${Emp.getEMPNO()}"/></td>
                    <td><c:out value="${Emp.getENAME()}"/></td>
                    <td><c:out value="${Emp.getJOB()}"/></td>
                    <td><c:out value="${Emp.getMGR()}"/></td>
                    <td><c:out value="${Emp.getSAL()}"/></td>
                    <td><c:out value="${Emp.getCOMM()}"/></td>
                    <td><c:out value="${Emp.getDEPTNO()}"/></td>
                    <td><c:out value="${Emp.getHIREDATE()}"/></td>
                    <td>
                        <a title="Modificar empleado"
                        class="btn waves-effect waves-light center green"
                        href="SvEmpleados.do?action=update&EMPNO=<c:out value="${Emp.getEMPNO()}"/>">
                        Update
                        </a>
                        <a
                        class="btn waves-effect waves-light center red"
                        href="SvEmpleados.do?action=delete&EMPNO=<c:out value="${Emp.getEMPNO()}"/>">
                        Delete
                        </a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
<br>
<p>
    <a title="Añadir empleado"
    class="btn waves-effect waves-light center blue"
    href="SvEmpleados.do?action=insert">Añadir empleado</a>
</p>
<br>
</div>
</div>
</div>

</body>
</html>