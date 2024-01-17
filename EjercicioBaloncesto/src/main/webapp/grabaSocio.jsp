<%@page import="java.sql.Statement" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
    <%
    Class.forName("com.mysql.jdbc.Driver"); 
    Connection conexion=DriverManager.getConnection("jdbc:mysql://localhost:3306/baloncesto","root","root");
    Statement s=conexion.createStatement(); 
    
    String consultaNumSocio= "select count(*) ne FROM socio where socioID= "+
    Integer.valueOf(request.getParameter("socioID"));
    
    ResultSet numeroDeSocios=s.executeQuery(consultaNumSocio);
    int n=-1;
    
    while (numeroDeSocios.next()){
    	n=numeroDeSocios.getInt(1);
    }
    
    if(n!=0){
    	out.println("Lo siento, no se pudo dar de alta, ya existe un socio con el numero "+ request.getParameter("socioID")+".");
    }else{
    	String insertar ="INSERT INTO socio VALUES("+
   		Integer.valueOf(request.getParameter("socioID"))
    	+",'"+request.getParameter("nombre")
    	+"',"+request.getParameter("estatura")
    	+", "+request.getParameter("edad")
    	+",'"+request.getParameter("localidad")+"')";
    	s.execute(insertar);
    	out.println("Socio añadido correctamente");
    }
   conexion.close();
    %>
    <br>
    <a href="index.jsp" class="btn btn-primary"><span class=glyphicon glyphicon-home></span>Pagina principal</a>
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>