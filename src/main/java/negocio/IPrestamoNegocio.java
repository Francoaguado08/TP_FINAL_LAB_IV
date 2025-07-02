package negocio;

import java.util.List;

import entidades.Cuenta;
import entidades.Prestamo;

public interface IPrestamoNegocio {
	public List<Cuenta> misCuentas(int idCliente);
	public boolean solPrestamo(Prestamo pres);

}
