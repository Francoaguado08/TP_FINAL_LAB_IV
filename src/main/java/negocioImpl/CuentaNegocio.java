package negocioImpl;

import java.util.List;

import dao.ICuentaDAO;
import daoImpl.CuentaDAOImpl;
import entidades.Cuenta;
import entidades.TipoCuenta;
import negocio.ICuentaNegocio;

public class CuentaNegocio implements ICuentaNegocio {
	
	private ICuentaDAO cuentaDAO = new CuentaDAOImpl();
	
	public boolean insertar(Cuenta cuenta) {
		return cuentaDAO.insertar(cuenta);
	}

	@Override
	public List<TipoCuenta> listar() {
		 return cuentaDAO.obtenerTiposdeCuenta();
	}
	

}
