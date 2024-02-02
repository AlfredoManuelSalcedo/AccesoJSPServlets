package com.curso.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.curso.modelo.Departamento;
import com.curso.modelo.Empleado;
import com.curso.util.DBUtil;

public class EmpleadoDAOimplementación implements EmpleadoDAO {
	private Connection conn;
	
	public EmpleadoDAOimplementación() {
		conn = DBUtil.getConnection();
	}

	@Override
	public void AñadirEmpleado(Empleado emp) {
		try {
			String query ="insert into emp values(?,?,?,?,?,?,?,?)";
			PreparedStatement s = conn.prepareStatement(query);
			s.setInt(1, emp.getEMPNO());
			s.setString(2, emp.getENAME());
			s.setString(3, emp.getJOB());
			s.setInt(4,emp.getMGR());
			s.setDouble(5, emp.getSAL());
			s.setDouble(6, emp.getCOMM());
			s.setInt(7, emp.getDEPTNO());
			s.setDate(8, new java.sql.Date(emp.getHIREDATE().getTime()));
			
			s.executeUpdate();
			s.close();
		}catch(SQLException e){
			e.printStackTrace();
		}

	}

	@Override
	public void BorrarEmpleado(int id) {
		try {
			String query ="delete from emp where EMPNO=?";
			PreparedStatement s = conn.prepareStatement(query);
			s.setInt(1, id);
			s.executeUpdate();
			s.close();
		}catch(SQLException e){
			e.printStackTrace();
		}

	}

	@Override
	public void ActualizarEmpleado(Empleado emp, int id) {
		try {
			String query="update emp set EMPNO=?, ENAME=?,JOB=?,MGR=?,SAL=?, COMM=?, DEPTNO=?,HIREDATE=? where EMPNO=?";
			PreparedStatement s = conn.prepareStatement(query);
			s.setInt(1, emp.getEMPNO());
			s.setString(2, emp.getENAME());
			s.setString(3, emp.getJOB());
			s.setInt(4,emp.getMGR());
			s.setDouble(5, emp.getSAL());
			s.setDouble(6, emp.getCOMM());
			s.setInt(7, emp.getDEPTNO());
			s.setDate(8, new java.sql.Date(emp.getHIREDATE().getTime()));
			s.setInt(9,id);
			s.executeUpdate();
			s.close();
		}catch(SQLException e){
			e.printStackTrace();
		}

	}

	@Override
	public List<Empleado> getAllEmpleados() {
		List<Empleado> le = new ArrayList<Empleado>();
		try {
			Statement statement = conn.createStatement();
			ResultSet r = statement.executeQuery("select * from emp");
			while(r.next()) {
				Empleado em = new Empleado();
				em.setEMPNO(r.getInt(1));
				em.setENAME(r.getString(2));
				em.setJOB(r.getString(3));
				em.setMGR(r.getInt(4));
				em.setSAL(r.getFloat(5));
				em.setCOMM(r.getFloat(6));
				em.setDEPTNO(r.getInt(7));
				em.setHIREDATE(r.getDate(8));
				
				le.add(em);
			}
			r.close();
			statement.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return le;
	}

	@Override
	public List<String> getAllJob() {
		List<String>le=new ArrayList<String>();
		try {
			Statement statement= conn.createStatement();
			ResultSet r = statement.executeQuery("select distinct job from emp where job is not null order by 1");
			while(r.next()) {
				le.add(r.getString(1));
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return le;
	}

	@Override
	public Empleado getEmpleadoByIde(int id) {
		Empleado em = new Empleado();
		try {
			String query = "select * from emp where EMPNO=?";
			PreparedStatement preparedStatement = conn.prepareStatement(query);
			preparedStatement.setInt(1, id);
			ResultSet r = preparedStatement.executeQuery();
			while(r.next()) {
				em.setEMPNO(r.getInt(1));
				em.setENAME(r.getString(2));
				em.setJOB(r.getString(3));
				em.setMGR(r.getInt(4));
				em.setSAL(r.getFloat(5));
				em.setCOMM(r.getFloat(6));
				em.setDEPTNO(r.getInt(7));
				em.setHIREDATE(r.getDate(8));
			}
			r.close();
			preparedStatement.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return em;
	}

	@Override
	public int idNuevo() {
		int n=0;
		try {
			String query ="Select max(EMPNO)+1 from emp";
			PreparedStatement preparedStatement = conn.prepareStatement(query);
			ResultSet r = preparedStatement.executeQuery();
			while(r.next()) {
				n=r.getInt(1);
			}
			r.close();
			preparedStatement.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return n;
	}

	@Override
	public List<Departamento> getAllDepartamento() {
		List<Departamento> le = new ArrayList<Departamento>();
		try {
			Statement statement = conn.createStatement();
			ResultSet r = statement.executeQuery("select * from dept");
			while(r.next()) {
				Departamento de = new Departamento();
				de.setDEPTNO(r.getInt(1));
				de.setDNAME(r.getString(2));
				de.setLOC(r.getString(3));
				le.add(de);
			}
			r.close();
			statement.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return le;
	}

	@Override
	public List<Empleado> getAllJefes() {
		List<Empleado> le = new ArrayList<Empleado>();
		try {
			Statement statement = conn.createStatement();
			ResultSet r = statement.executeQuery("select * from emp where EMPNO in(select distinct mgr from emp where mgr is not null)");
			while(r.next()) {
				Empleado em = new Empleado();
				em.setEMPNO(r.getInt(1));
				em.setENAME(r.getString(2));
				em.setJOB(r.getString(3));
				em.setMGR(r.getInt(4));
				em.setSAL(r.getFloat(5));
				em.setCOMM(r.getFloat(6));
				em.setDEPTNO(r.getInt(7));
				em.setHIREDATE(r.getDate(8));
				
				le.add(em);
			}
			r.close();
			statement.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return le;
	}

}
