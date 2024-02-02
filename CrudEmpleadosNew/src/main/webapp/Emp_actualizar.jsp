<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.6/css/materialize.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<title>Insertar/Actualizar</title>
<style type="text/css">
    fieldset{ width:250px;margin:20px auto; padding-left:50px;}
    legend{ background-color:black; color:white;font-size:2rem; }
    input,select{ display:block;margin-bottom:20px;}
    input[type="submit"]{ text-align:center;padding:20px; margin-top:20px; }
    </style>
</head>
<body>
    <% request.setCharacterEncoding("UTF-8"); %>
    <div class="container">
      <div class="row"></div>
      <div class="row">
        <div class="row col m3"></div>
        <div class="col m6 card-panel grey lighten-5">
          <h5 class="center">Datos del Empleado</h5>
          <form action="SvEmpleados.do" method="post">
          <input type="hidden" name="old_id" value="<c:out value="${VEmpleado.getEMPNO()}"/>"/>
          <div class="form-group">
                <label class="blue-text" for="EMPNO">ID</label>
                <input type="text" name="EMPNO" value="<c:out value="${VEmpleado.getEMPNO()}"/>" placeholder="ID"/>
            </div>
            <div class="form-group">
                <label class="blue-text" for="ENAME">NOMBRE</label>
                <input type="text" name="ENAME" value="<c:out value="${VEmpleado.getENAME()}"/>" placeholder="Nombre"/>
            </div>
            <div class="form-select form-group">
                <label class="blue-text" class="form-label" for="JOB">EMPLEO</label>
                <select name="JOB">
                <c:forEach items="${Vjobs}" var="em">
                	<c:choose>
                	<c:when test="${VEmpleado.getJOB()==em}">
                    <option SELECTED value="<c:out value="${em}"/>"><c:out value="${em}"/>
                    </option>
                    </c:when>
                    <c:otherwise>
                     <option value="<c:out value="${em}"/>"><c:out value="${em}"/>
                    </c:otherwise>
                    </c:choose>
                </c:forEach>
                </select>
            </div>
            <div class="form-select form-group">
                <label class="blue-text" class="form-label" for="MGR">MGR</label>
                <select name="MGR">
                <c:forEach items="${VJefes}" var="em">
                	<c:choose>
                	<c:when test="${VEmpleado.getMGR()==em.getEMPNO() }">
                    <option SELECTED value="<c:out value="${em.getEMPNO()}"/>"><c:out value="${em.getENAME()}"/>
                    </option>
                    </c:when>
                    <c:otherwise>
                     <option value="<c:out value="${em.getEMPNO()}"/>"><c:out value="${em.getENAME()}"/>
                    </c:otherwise>
                    </c:choose>
                </c:forEach>
                </select>
            </div>
            <div class="form-group">
                <label class="blue-text" for="SAL">SALARIO</label>
                <input type="text" name="SAL" value="<c:out value="${VEmpleado.getSAL()}"/>"placeholder="Salario"/>
            </div>
            <div class="form-group">
                <label class="blue-text" for="COMM">COMISION</label>
                <input type="text" name="COMM" value="<c:out value="${VEmpleado.getCOMM()}"/>"placeholder="Comisión"/>
            </div>
            <div class="form-select form-group">
                <label class="blue-text" class="form-label" for="DEPTNO">DEPARTAMENTO</label>
                <select name="DEPTNO">
                <c:forEach items="${VDepartamentos}" var="em">
                	<c:choose>
                	<c:when test="${VEmpleado.getDEPTNO()==em.getDEPTNO()}">
                    <option SELECTED value="<c:out value="${em.getDEPTNO()}"/>"><c:out value="${em.getDNAME()}"/>
                    </option>
                    </c:when>
                    <c:otherwise>
                     <option value="<c:out value="${em.getDEPTNO()}"/>"><c:out value="${em.getDNAME()}"/>
                    </c:otherwise>
                    </c:choose>
                </c:forEach>
                </select>
            </div>
            <div class="form-group">
                <label class="blue-text" for="HIREDATE">HIREDATE</label>
                <input type="DATE" name="HIREDATE" value="<c:out value="${VEmpleado.getHIREDATE()}"/>"/>
            </div><br>
            <p class="center">
                    <button class="btn waves-effect waves-light center" type="submit" name="aceptar">
                     Aceptar
                    <i class="material-icons">check_circle</i>   
                    </button>
                    <a href="SvEmpleados?action=ListaEmpleados" class="btn waves-effect waves-light center red">
                        Cancelar
                        <i class="fa fa-times"></i>
                    </a>
            </p>
          </form>
</body>
</html>