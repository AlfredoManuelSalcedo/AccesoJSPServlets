<%@page import="java.sql.Statement" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.time.LocalDate" %>
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
    int EMPNO = Integer.valueOf(request.getParameter("empNo"));
    String ENAME = request.getParameter("eName");
    String JOB = request.getParameter("job");
    int MGR = Integer.valueOf(request.getParameter("mgr"));
    double SAL = Double.valueOf(request.getParameter("sal"));
    double COMM = Double.valueOf(request.getParameter("comm"));
    int DEPTNO = Integer.valueOf(request.getParameter("DEPTNO"));
    String fechaObtenida = request.getParameter("hireDate");
	
	LocalDate local;
	try {
        if (fechaObtenida.isEmpty()) {
            local = LocalDate.now();
            fechaObtenida = String.valueOf(local);
        } else {
            local = LocalDate.parse(fechaObtenida);
            fechaObtenida = String.valueOf(local);
        }
    } catch (Exception e) {
        out.print("Error al introducir la fecha");
    }
    

    Class.forName("com.mysql.jdbc.Driver");
    Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/bd_scott", "root", "root");
    Statement s = conexion.createStatement();

    String consultaNumSocio = "select count(*) ne FROM emp where EMPNO= " + EMPNO;

    ResultSet numeroDeSocios = s.executeQuery(consultaNumSocio);
    int n = -1;

    while (numeroDeSocios.next()) {
        n = numeroDeSocios.getInt(1);
    }

    if (n != 0) {
        out.println("Lo siento, no se pudo dar de alta, ya existe un socio con el número " + EMPNO + ".");
    } else {
        String insertar = "INSERT INTO emp VALUES(" +
                EMPNO + ",'" +
                ENAME + "','" +
                JOB + "'," +
                MGR + "," +
                SAL + "," +
                COMM + "," +
                DEPTNO + ",'" +
                fechaObtenida + "')";
        s.execute(insertar);
        out.println("Socio añadido correctamente");
    }

    conexion.close();
%>
<br>
<a href="index.jsp" class="btn btn-primary"><span class=glyphicon glyphicon-home></span>Página principal</a>
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>