package entidades;

import java.util.Date;

public class Prestamo {
	private int idPrestamo;


	private int idCliente;
    private Date fecha;
    private double importeAPagar;
    private double importePedido;
    private int plazoPagoMeses;
    private double montoPorMes;
    private boolean estado;
    private String cuentaDepositar;


    public Prestamo() {
    }

    public void setIdPrestamo(int idPrestamo) {
    	this.idPrestamo = idPrestamo;
    }

    public int getIdPrestamo() {
		return idPrestamo;
	}
    
	public int getIdCliente() {
		return idCliente;
	}


	public void setIdCliente(int idCliente) {
		this.idCliente = idCliente;
	}


	public Date getFecha() {
		return fecha;
	}


	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}


	public double getImporteAPagar() {
		return importeAPagar;
	}


	public void setImporteAPagar(double importeAPagar) {
		this.importeAPagar = importeAPagar;
	}


	public double getImportePedido() {
		return importePedido;
	}


	public void setImportePedido(double importePedido) {
		this.importePedido = importePedido;
	}


	public int getPlazoPagoMeses() {
		return plazoPagoMeses;
	}


	public void setPlazoPagoMeses(int plazoPagoMeses) {
		this.plazoPagoMeses = plazoPagoMeses;
	}


	public double getMontoPorMes() {
		return montoPorMes;
	}


	public void setMontoPorMes(double montoPorMes) {
		this.montoPorMes = montoPorMes;
	}


	public boolean isEstado() {
		return estado;
	}


	public void setEstado(boolean estado) {
		this.estado = estado;
	}


	public String getCuentaDepositar() {
		return cuentaDepositar;
	}


	public void setCuentaDepositar(String cuentaDepositar) {
		this.cuentaDepositar = cuentaDepositar;
	}
    
    
    
    
    
    
}
