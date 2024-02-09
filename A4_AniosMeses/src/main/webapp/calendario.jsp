<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.time.LocalDate"%>
    <%@page import="java.time.DayOfWeek"%>
    <%@page import="java.time.format.DateTimeFormatter"%>
    <%@page import="java.util.Locale"%>
<!DOCTYPE html>
<html>
<head>
    <style>
        .div1{
            margin: 20px auto;
            padding: 20px;
            border: 10px solid gold;
            border-radius: 25px;
            height: 200px;
            width: 800px;
        }
        th,thead{
background-color: rgb(119, 177, 123);
color: rgb(253, 253, 253);
        }
        table,td{
background-color: rgb(169, 216, 190);
        }
         table caption{
           background-color: rgba(5, 88, 9, 0.568);
           color: white;
           font-size: 30px;
           font-weight: bolder;
        }
        table{
            width: 350px;
        }
        table,tbody,td{
            text-align: center;
        }
    </style>
<meta charset="ISO-8859-1">
<title>calendario</title>
</head>
<body>       
<div class="div1">
    <%
    int messele=Integer.parseInt(request.getParameter("mes"));
    int aniosele=Integer.parseInt(request.getParameter("anio"));
    Locale spanishLocale=new Locale("es","ES");
    LocalDate fecha = LocalDate.of(aniosele, messele+1, 1);
    String mesactual=fecha.format(DateTimeFormatter.ofPattern("MMMM",spanishLocale));
    DayOfWeek pdia= fecha.getDayOfWeek();
	int prdia = pdia.getValue();
    %>
    <table border='1' align='center'>
        <caption><%=mesactual.toUpperCase()%></caption>
        <thead>
            <tr>
                <th>L</th>
                <th>M</th>
                <th>X</th>
                <th>J</th>
                <th>V</th>
                <th>S</th>
                <th>D</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <%for(int i=1;i<prdia;i++){%><td>&nbsp</td> <%}
                Boolean inicio_semana=false;
                while(fecha.getMonthValue()==messele+1){
                	int diam=fecha.getDayOfMonth();
                    if(inicio_semana){%>
                        <tr><%
                        inicio_semana=false;
                    }%>
                    <td><%=diam%></td><%
                    DayOfWeek nsdia=fecha.getDayOfWeek();
                    int ndia=nsdia.getValue();
                    if(ndia==7){%>
                    </tr><%
                    inicio_semana=true;
                    }
                    fecha=fecha.plusDays(1);
                    pdia=pdia.plus(1);
                }
                if(!inicio_semana){
                	for(int i =1;i<=7-pdia.getValue()+1;i++){
                		%><td>&nbsp</td><%
                	}
                }
                %>
            </tr>
        </tbody>
    </table>
</div>
</body>
</html>