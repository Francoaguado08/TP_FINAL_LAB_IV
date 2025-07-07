package entidades;

import java.util.Date;

public class Movimiento {
	
	private int numeroMovimiento;
	private int numeroCuenta;
	private TipoMovimiento tipoMovimiento;
	private String detalle;
	private double importe;
	private Date fecha;
	
	public Movimiento() {
		
	}
	
	public int getNumeroMovimiento() {
		return numeroMovimiento;
	}
	public void setNumeroMovimiento(int numeroMovimiento) {
		this.numeroMovimiento = numeroMovimiento;
	}
	public int getNumeroCuenta() {
		return numeroCuenta;
	}
	public void setNumeroCuenta(int numeroCuenta) {
		this.numeroCuenta = numeroCuenta;
	}
	public TipoMovimiento getTipoMovimiento() {
		return tipoMovimiento;
	}
	public void setTipoMovimiento(TipoMovimiento tipoMovimiento) {
		this.tipoMovimiento = tipoMovimiento;
	}
	public String getDetalle() {
		return detalle;
	}
	public void setDetalle(String detalle) {
		this.detalle = detalle;
	}
	public double getImporte() {
		return importe;
	}
	public void setImporte(double importe) {
		this.importe = importe;
	}
	public Date getFecha() {
		return fecha;
	}
	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}
	
	
}
