package entidades;

import java.sql.Date;

public class CuentaListado {
	
	    private int nroCuenta;
	    private String tipoCuenta; // descripción
	    private String cbu;
	    private String cuil;
	    private double saldo;
	    private Date fechaCreacion;
	    private boolean estado;
	    
	    // Getters y setters
	    
		public int getNroCuenta() {
			return nroCuenta;
		}
		public boolean isEstado() {
			return estado;
		}
		public void setEstado(boolean estado) {
			this.estado = estado;
		}
		public void setNroCuenta(int nroCuenta) {
			this.nroCuenta = nroCuenta;
		}
		public String getTipoCuenta() {
			return tipoCuenta;
		}
		public void setTipoCuenta(String tipoCuenta) {
			this.tipoCuenta = tipoCuenta;
		}
		public String getCbu() {
			return cbu;
		}
		public void setCbu(String cbu) {
			this.cbu = cbu;
		}
		public String getCuil() {
			return cuil;
		}
		public void setCuil(String cuil) {
			this.cuil = cuil;
		}
		public double getSaldo() {
			return saldo;
		}
		public void setSaldo(double saldo) {
			this.saldo = saldo;
		}
		public Date getFechaCreacion() {
			return fechaCreacion;
		}
		public void setFechaCreacion(Date fechaCreacion) {
			this.fechaCreacion = fechaCreacion;
		}

	   
	    
}


