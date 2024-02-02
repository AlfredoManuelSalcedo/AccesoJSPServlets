package com.curso.controlador;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.curso.dao.EmpleadoDAO;
import com.curso.dao.EmpleadoDAOimplementación;
import com.curso.modelo.Empleado;


@WebServlet("/SvEmpleados")
public class SvEmpleados extends HttpServlet {
	private static final long serialVersionUID = 1L;
       public static final String LIST_STUDENT="/ListaEmpleados.jsp";
       public static final String INSERT_OR_EDIT="/Empleado.jsp";
       public static final String ACTUALIZAR="/Emp_actualizar.jsp";
       
       private EmpleadoDAO dao;  
   
    public SvEmpleados() {
        dao= new EmpleadoDAOimplementación();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String forward ="";
		String action=request.getParameter("action");
		
		if(action.equalsIgnoreCase("delete")) {
			forward= LIST_STUDENT;
			int Id= Integer.parseInt(request.getParameter("EMPNO"));
			dao.BorrarEmpleado(Id);
			request.setAttribute("VEmpleados", dao.getAllEmpleados());
		}else if(action.equalsIgnoreCase("update")) {
			forward=ACTUALIZAR;
			int Id =Integer.parseInt(request.getParameter("EMPNO"));
			Empleado em = dao.getEmpleadoByIde(Id);
			request.setAttribute("VEmpleado", em);
			request.setAttribute("VDepartamentos", dao.getAllDepartamento());
			request.setAttribute("Vjobs", dao.getAllJob());
			request.setAttribute("VJefes", dao.getAllJefes());
		}else if(action.equalsIgnoreCase("insert")) {
			forward=INSERT_OR_EDIT;
			request.setAttribute("VDepartamentos", dao.getAllDepartamento());
			request.setAttribute("VJob", dao.getAllJob());
			request.setAttribute("VJefes", dao.getAllJefes());
		}
		else {
			forward=LIST_STUDENT;
			request.setAttribute("VEmpleados",dao.getAllEmpleados());
		}
		RequestDispatcher view= request.getRequestDispatcher(forward);
		view.forward(request, response);		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Empleado em= new Empleado();
		
		em.setENAME(request.getParameter("ENAME"));
		em.setJOB(request.getParameter("JOB"));
		em.setMGR(Integer.parseInt(request.getParameter("MGR")));
		em.setSAL(Float.parseFloat(request.getParameter("SAL")));
		em.setCOMM(Float.parseFloat(request.getParameter("COMM")));
		em.setDEPTNO(Integer.parseInt(request.getParameter("DEPTNO")));
		em.setHIREDATE(Date.valueOf(request.getParameter("HIREDATE")));
		
		try {
			String a= request.getParameter("old_id");
			em.setEMPNO(Integer.parseInt(request.getParameter("EMPNO")));
			dao.ActualizarEmpleado(em, Integer.parseInt(a));
		}catch(Exception ex) {
			em.setEMPNO(dao.idNuevo());
			dao.AñadirEmpleado(em);
		}
		RequestDispatcher view= request.getRequestDispatcher(LIST_STUDENT);
		request.setAttribute("VEmpleados", dao.getAllEmpleados());
		view.forward(request, response);
	}

}
