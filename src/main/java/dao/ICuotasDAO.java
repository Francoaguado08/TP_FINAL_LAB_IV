package dao;

import java.util.Date;
import java.util.List;

import entidades.Cuota;
import entidades.Movimiento;

public interface ICuotasDAO {
	
	public List<Cuota> obtenerCuotas (int id);
	public boolean pagoCuota (int nCuota, int idP, String nro, Date fecha, double monto, int idCliente);
	public boolean generarMovimiento(Movimiento m);
	public double obtenerSaldo(int nroCuenta);

}
