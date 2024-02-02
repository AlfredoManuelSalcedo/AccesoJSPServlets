package com.curso.dao;

import java.util.List;

import com.curso.modelo.Departamento;
import com.curso.modelo.Empleado;

public interface EmpleadoDAO {

	public void AñadirEmpleado(Empleado emp);
	public void BorrarEmpleado(int id);
	public void ActualizarEmpleado(Empleado emp, int id);
	public List<Empleado> getAllEmpleados();
	public List<String> getAllJob();
	public Empleado getEmpleadoByIde(int id);
	public int idNuevo();
	public List<Departamento> getAllDepartamento();
	public List<Empleado> getAllJefes();
}
