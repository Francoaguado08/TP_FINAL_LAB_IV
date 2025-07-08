package negocioImpl;

import java.util.List;

import entidades.Movimiento;
import negocio.IMovimientoNegocio;
import dao.IMovimientoDAO;
import dao.ICuentaDAO;
import daoImpl.CuentaDAOImpl;
import daoImpl.MovimientoDAOImpl;

public class MovimientoNegocio implements IMovimientoNegocio{
	
	private IMovimientoDAO movimientoDAO = new MovimientoDAOImpl();
	private ICuentaDAO cuentaDAO = new CuentaDAOImpl();

	@Override
	public boolean insertar(Movimiento movimiento) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<Movimiento> listarPorNumeroCuenta(int numeroCuenta) {
		return movimientoDAO.obtenerTodosNumeroCuenta(numeroCuenta);
	}

	@Override
	public Movimiento obtenerPorNumero(int numero) {
		// TODO Auto-generated method stub
		return null;
	}
	
	public boolean transferencia(int nroCuentaOrigen, int nroCuentaDestino, double importe) {
		
		//verifico que exista solo como validación, esta debería existir
		if(!cuentaDAO.existe(nroCuentaOrigen)) {
			System.out.println("Error, cuenta origen inexistente o inactiva");
			return false;
			}
		//verifico que exista y esté activa
		if(!cuentaDAO.existe(nroCuentaDestino)) {
			System.out.println("Error, cuenta destino inexistente o inactiva");
			return false;
			} 
		if (importe <=0) {
			System.out.println("Error, el valor del importe es incorrecto");
			return false;
		}
		
		if ((cuentaDAO.obtenerPorNumeroCuenta(nroCuentaOrigen).getSaldo())< importe) {
			System.out.println("Error, saldo insuficiente");
			return false;
		}
		
		return movimientoDAO.transferencia(nroCuentaOrigen, nroCuentaDestino, importe);
		
		
	}

	
}
