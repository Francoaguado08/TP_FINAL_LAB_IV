package dao;

import java.util.List;

import entidades.Cuenta;
import entidades.Cuota;
import entidades.Prestamo;

public interface IPrestamosDAO {
	
	public List<Cuenta> misCuentas(int idCliente);
	public boolean solPrestamo(Prestamo pres);
	public List<Prestamo> prestamosEspera();
	public boolean acreditarPrestamo(double saldoN, int idCliente, String nCuenta, int idPrestamo);
	/*public boolean estadoPrestamo(int idcliente, int idPrestamo);*/
	public boolean agregarCuota(Cuota c);
	public boolean rechazar(int idPrestamo);

}
