package negocioImpl;

import java.util.List;

import daoImpl.PrestamosDAOImpl;
import entidades.Cuenta;
import entidades.Cuota;
import entidades.Prestamo;
import negocio.IPrestamoNegocio;

public class PrestamoNegocio implements IPrestamoNegocio {
	
	public PrestamosDAOImpl p = new PrestamosDAOImpl();
	@Override
	public List<Cuenta> misCuentas(int idCliente) {
		List<Cuenta> lista = p.misCuentas(idCliente);
		return lista;
	}

	@Override
	public boolean solPrestamo(Prestamo pres) {
		return p.solPrestamo(pres);
	}

	public List<Prestamo> prestamosEspera(){
		return p.prestamosEspera();
	}
	
	public boolean agregarCuota(Cuota c) {
		return p.agregarCuota(c);
	}
	
	public boolean acreditarPrestamo(double saldoN, int idCliente, String nCuenta) {
		
		return p.acreditarPrestamo(saldoN, idCliente, nCuenta);
	}
	
	public boolean estadoPrestamo(int idcliente, int idPrestamo) {
		return p.estadoPrestamo(idcliente, idPrestamo);
	}
}
