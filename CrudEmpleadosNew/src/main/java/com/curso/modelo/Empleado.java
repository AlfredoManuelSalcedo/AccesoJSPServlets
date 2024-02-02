package com.curso.modelo;

import java.util.Date;

public class Empleado {
private int EMPNO;
private String ENAME;
private String JOB;
private int MGR;
private float SAL;
private float COMM;
private int DEPTNO;
private Date HIREDATE;



public Empleado() {
	super();
	// TODO Auto-generated constructor stub
}

public Empleado(int eMPNO, String eNAME, String jOB, int mGR, float sAL, float cOMM, int dEPTNO, Date hIREDATE) {
	super();
	EMPNO = eMPNO;
	ENAME = eNAME;
	JOB = jOB;
	MGR = mGR;
	SAL = sAL;
	COMM = cOMM;
	DEPTNO = dEPTNO;
	HIREDATE = hIREDATE;
}

public int getEMPNO() {
	return EMPNO;
}

public void setEMPNO(int eMPNO) {
	EMPNO = eMPNO;
}

public String getENAME() {
	return ENAME;
}

public void setENAME(String eNAME) {
	ENAME = eNAME;
}

public String getJOB() {
	return JOB;
}

public void setJOB(String jOB) {
	JOB = jOB;
}

public int getMGR() {
	return MGR;
}

public void setMGR(int mGR) {
	MGR = mGR;
}

public float getSAL() {
	return SAL;
}

public void setSAL(float sAL) {
	SAL = sAL;
}

public float getCOMM() {
	return COMM;
}

public void setCOMM(float cOMM) {
	COMM = cOMM;
}

public int getDEPTNO() {
	return DEPTNO;
}

public void setDEPTNO(int dEPTNO) {
	DEPTNO = dEPTNO;
}

public Date getHIREDATE() {
	return HIREDATE;
}

public void setHIREDATE(Date hIREDATE) {
	HIREDATE = hIREDATE;
}

@Override
public String toString() {
	return "Empleado [EMPNO=" + EMPNO + ", ENAME=" + ENAME + ", JOB=" + JOB + ", MGR=" + MGR + ", SAL=" + SAL
			+ ", COMM=" + COMM + ", DEPTNO=" + DEPTNO + ", HIREDATE=" + HIREDATE + "]";
}

}
