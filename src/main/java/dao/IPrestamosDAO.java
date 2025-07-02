package dao;

import java.util.List;

import entidades.Cuenta;
import entidades.Prestamo;

public interface IPrestamosDAO {
	
	public List<Cuenta> misCuentas(int idCliente);
	public boolean solPrestamo(Prestamo pres);

}
