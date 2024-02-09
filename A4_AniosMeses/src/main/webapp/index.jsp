<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style>
#di{
    margin: 20px auto;
            padding: 20px;
            border: 10px;
            border-color: #927a51;
            background-color: #8eb67d;
            border-radius: 25px;
            height: 150px;
            width: 300px;
            box-shadow: 10px 100px 760px 7600px rgba(0,0,0,0.75);
}
h1{
    text-align: center;
}
.centrar{
    margin-left: 50%;
    transform: translateX(-55%);
}

</style>
<script>
    let meses=["Enero","Febrero","Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"]
    function cargar(){
        let hoy= new Date();
        let mes=hoy.getMonth();
        let anio=hoy.getFullYear();
        let destino=document.getElementById("sanios");
            for (i=anio+25;i>=anio-25;i--){
                let elem2=document.createElement("option");
                elem2.value=i.toString();
                elem2.text=i.toString();
                if(i==anio){
                    elem2.setAttribute('selected', 'selected')
                }
                destino.appendChild(elem2);
            }

            destino=document.getElementById("smeses");
            for(i=0;i<meses.length;i++){
                let elem2=document.createElement("option");
                elem2.value=(i).toString();
                elem2.text=meses[i];
                if(i==mes){
                    elem2.setAttribute('selected', 'selected');
                }
                destino.appendChild(elem2);
            }
    }
</script>
<meta charset="UTF-8">
<title>meses</title>
</head>
<body onload="cargar()">
    <div id="di">
        <h1>Calendario</h1>
        <form method="post" action="calendario.jsp">
                <select class="centrar" id="smeses" name="mes"></select>
                <select class="centrar" id="sanios" name="anio"></select>   
            <p>
                <input class="centrar" type="submit" value="ACEPTAR">
            </p>
        </form>  
    </div>
</body>
</html>