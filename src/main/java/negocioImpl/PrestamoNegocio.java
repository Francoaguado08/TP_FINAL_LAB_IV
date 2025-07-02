package negocioImpl;

import java.util.List;

import daoImpl.PrestamosDAOImpl;
import entidades.Cuenta;
import negocio.IPrestamoNegocio;

public class PrestamoNegocio implements IPrestamoNegocio {

	@Override
	public List<Cuenta> misCuentas(int idCliente) {
		PrestamosDAOImpl p = new PrestamosDAOImpl();
		List<Cuenta> lista = p.misCuentas(idCliente);
		return lista;
	}

}
