package com.curso.dao;

import java.util.List;

import com.curso.modelo.Departamento;

public interface DepartamentoDAO {

	public void AñadirDepartamento(Departamento dept);
	public void BorrarDepartamento(int id);
	public void ActualizarDepartamento(Departamento dept, int id);
	public List <Departamento> getAllDepartamentos();
	public Departamento getDepartamentoById(int id);
	public int idNuevo();
	public int getTotalElementos();
	public List<Departamento> getElementosPagina(int pg, int nele);
}
