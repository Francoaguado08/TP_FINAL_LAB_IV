package negocio;

import java.util.List;

import entidades.Cuenta;
import entidades.Cuota;
import entidades.Prestamo;

public interface IPrestamoNegocio {
	public List<Cuenta> misCuentas(int idCliente);
	public boolean solPrestamo(Prestamo pres);
	public List<Prestamo> prestamosEspera();
	public boolean agregarCuota(Cuota c);
	public boolean acreditarPrestamo(double saldoN, int idCliente, String nCuenta);
	public boolean estadoPrestamo(int idcliente, int idPrestamo);

}
