package negocioImpl;

import java.util.List;

import dao.ICuentaDAO;
import daoImpl.CuentaDAOImpl;
import entidades.Cliente;
import entidades.CuentaListado;
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

	@Override
	public List<CuentaListado> listarTodos() {
		return cuentaDAO.obtenerTodos();
	}

	@Override
	public boolean eliminar(int nroCuenta) {
		// TODO Auto-generated method stub
		return cuentaDAO.eliminar(nroCuenta);
	}
	
	public boolean modificar(Cuenta cuenta) {
		return cuentaDAO.modificar(cuenta);
	}
	@Override
	public Cuenta obtenerPorId(int id) {
		return cuentaDAO.obtenerPorId(id);
	}

	@Override
	public boolean clienteTieneTresCuentasActivas(int idCliente) {
		
		int cantidad = cuentaDAO.contarCuentasActivasPorCliente(idCliente);
	    return cantidad >= 3;
	
	}
	
	public List<CuentaListado> filtro(int nroCuenta, String cuil) {
		return cuentaDAO.filtro(nroCuenta, cuil);
	}
	
	
}
