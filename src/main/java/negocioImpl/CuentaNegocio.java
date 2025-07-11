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
	public Cuenta obtenerPorNumeroCuenta(int id) {
		return cuentaDAO.obtenerPorNumeroCuenta(id);
	}
	
	public CuentaListado obtenerPorNumeroCuentaListado(int id) {
		return cuentaDAO.obtenerPorNumeroCuentaListado(id);
	}

	@Override
	public boolean clienteTieneTresCuentasActivas(int idCliente) {
		
		int cantidad = cuentaDAO.contarCuentasActivasPorCliente(idCliente);
	    return cantidad >= 3;
	
	}
	
	public List<CuentaListado> filtro(int nroCuenta, String cuil) {
		return cuentaDAO.filtro(nroCuenta, cuil);
	}

	@Override
	public List<CuentaListado> cuentasPorCliente(int idCli) {
		
		return cuentaDAO.cuentasPorCliente(idCli);
	}

	@Override
	public int obtenerProximoNumeroCuenta(){
		return cuentaDAO.proximoNumeroCuenta();
	}
	public Cuenta obtenerPorCBU(String CBU) {
		return cuentaDAO.obtenerPorCBU(CBU);
	}
	
}
