package com.curso.controlador;

import java.io.IOException;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.curso.dao.DepartamentoDAO;
import com.curso.dao.DepartamentoDAOimplementación;
import com.curso.modelo.Departamento;


@WebServlet("/SvDepartamentos")
public class SvDepartamentos extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private DepartamentoDAO dao;
	
	private static final Integer MAX_ELEMENTOS_PAGINA =5;
	public static final String LIST_STUDENT = "/ListaDepartamentos.jsp";
	public static final String INSERT_OR_EDIT ="/Departamento.jsp";
	public static final String ACTUALIZAR = "/Dept_actualizar.jsp";
	
    
    public SvDepartamentos() {
       dao = new DepartamentoDAOimplementación();
       
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String forward="";
		String action = request.getParameter("action");
		if(action==null)action="";
		if(action.equalsIgnoreCase("delete")) {
			forward=LIST_STUDENT;
			int Id= Integer.parseInt(request.getParameter("DEPTNO"));
			dao.BorrarDepartamento(Id);
			request.setAttribute("VDepartamentos", dao.getAllDepartamentos());
		}else if(action.equalsIgnoreCase("update")){
			forward=ACTUALIZAR;
			int Id=Integer.parseInt(request.getParameter("DEPTNO"));
			Departamento em= dao.getDepartamentoById(Id);
			request.setAttribute("VDepartamento", em);
		}else if(action.equalsIgnoreCase("insert")) {
		
			forward = INSERT_OR_EDIT;
		}else {
			forward=LIST_STUDENT;
			request.setAttribute("VDepartamentos",dao.getAllDepartamentos());
		}
		//if(forward==LIST_STUDENT) {
			//int offset;
			//try {
				//offset = Integer.valueOf(request.getParameter("offset"));
			//}catch(NumberFormatException e){
				//offset=0;
			//}
			//request.setAttribute("maxElements", MAX_ELEMENTOS_PAGINA);
		//}
		RequestDispatcher view= request.getRequestDispatcher(forward);
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Departamento em = new Departamento();
		em.setDNAME(request.getParameter("DNAME"));
		em.setLOC(request.getParameter("LOC"));
		try {
			String a = request.getParameter("old_id");
			em.setDEPTNO(Integer.parseInt(request.getParameter("DEPTNO")));
			dao.ActualizarDepartamento(em, Integer.parseInt(a));
		}catch(Exception ex) {
			em.setDEPTNO(dao.idNuevo());
			dao.AñadirDepartamento(em);
		}
		RequestDispatcher view= request.getRequestDispatcher(LIST_STUDENT);
		request.setAttribute("VDepartamentos", dao.getAllDepartamentos());
		view.forward(request, response);
	}

}
