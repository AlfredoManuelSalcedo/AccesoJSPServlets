<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insertar/Actualizar</title>
</head>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.6/css/materialize.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<title>Insertar/Actualizar</title>
</head>
<body>
    
      <% request.setCharacterEncoding("UTF-8"); %>
    <div class="container">
      <div class="row"></div>
      <div class="row">
        <div class="row col m3"></div>
        <div class="col m5 card-panel grey lighten-5">
          <h5 class="center">Datos del Departamento</h5>
           <form action="SvDepartamentos.do" method="post">

          	<input type="hidden" name="old_id" value="<c:out value="${VDepartamento.getDEPTNO()}" />"  />
            <div class="input-field blue-text">
     
                  
			<input type="text" name="DEPTNO" value="<c:out value="${VDepartamento.getDEPTNO()}" />" placeholder="Nº Departamento" />
              <label for="DEPTNO">Departamento</label>
            </div>
            <div class="input-field">

			<input type="text" name="DNAME" value="<c:out value="${VDepartamento.getDNAME()}" />" placeholder="Nombre" />
             	<label for="DNAME">Nombre</label>
            </div>
            <div class="input-field">

			<input type="text" name="LOC" value="<c:out value="${VDepartamento.getLOC()}" />" placeholder="Ciudad" />
     		<label for="LOC">CIUDAD</label>
            </div>
            <p class="center">
              <button class="btn waves-effect waves-light center" type="submit" name="aceptar">
              Aceptar
              <i class="material-icons">check_circle</i>
              </button>
              <a href="SvDepartamentos?action=ListaDepartamentos" class="btn waves-effect waves-light center red">
              Cancelar
              <i class="fa fa-times"></i>
              </a>
            </p>
            <br>
          </form>
        </div>
      </div>
    </div>
    
    <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <!-- Materialize -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.6/js/materialize.min.js"></script>

</body>
</html>