package com.curso.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.curso.modelo.Departamento;
import com.curso.util.DBUtil;

public class DepartamentoDAOimplementación implements DepartamentoDAO {
	
	private Connection conn;
	
	public DepartamentoDAOimplementación() {
		conn = DBUtil.getConnection();
	}

	@Override
	public void AñadirDepartamento(Departamento dept) {
		try {
			String query ="insert into dept values(?,?,?)";
			PreparedStatement s = conn.prepareStatement(query);
			s.setInt(1, dept.getDEPTNO());
			s.setString(2, dept.getDNAME());
			s.setString(3, dept.getLOC());
			
			s.executeUpdate();
			s.close();
		}catch(SQLException e){
			e.printStackTrace();
		}

	}

	@Override
	public void BorrarDepartamento(int id) {
		try {
			String query ="delete from dept where DEPTNO=?";
			PreparedStatement s = conn.prepareStatement(query);
			s.setInt(1, id);
			s.executeUpdate();
			s.close();
		}catch(SQLException e){
			e.printStackTrace();
		}

	}

	@Override
	public void ActualizarDepartamento(Departamento dept, int id) {
		try {
			String query="update dept set DEPTNO=?, DNAME=?,LOC=? where DEPTNO=?";
			PreparedStatement s = conn.prepareStatement(query);
			s.setInt(1, dept.getDEPTNO());
			s.setString(2, dept.getDNAME());
			s.setString(3, dept.getLOC());
			s.setInt(4, id);
			
			s.executeUpdate();
			s.close();
		}catch(SQLException e){
			e.printStackTrace();
		}

	}

	@Override
	public List<Departamento> getAllDepartamentos() {
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
	public Departamento getDepartamentoById(int id) {
		Departamento de = new Departamento();
		try {
			String query = "select * from dept where DEPTNO=?";
			PreparedStatement preparedStatement = conn.prepareStatement(query);
			preparedStatement.setInt(1, id);
			ResultSet r = preparedStatement.executeQuery();
			while(r.next()) {
				de.setDEPTNO(r.getInt(1));
				de.setDNAME(r.getString(2));
				de.setLOC(r.getString(3));
			}
			r.close();
			preparedStatement.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return de;
	}

	@Override
	public int idNuevo() {
		int n=0;
		try {
			String query ="Select max(DEPTNO)+1 from dept";
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
	public int getTotalElementos() {
		int n=0;
		try {
			String query = "Select count(*) from dept";
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
	public List<Departamento> getElementosPagina(int pg, int nele) {
		int ini=pg*nele;
		List<Departamento> le = new ArrayList<Departamento>();
		try {
			Statement statement = conn.createStatement();
			ResultSet r = statement.executeQuery("select * from dept limit"+ini+","+nele);
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

}
