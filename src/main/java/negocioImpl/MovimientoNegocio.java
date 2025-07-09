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
	
	public int transferencia(int nroCuentaOrigen, int nroCuentaDestino, double importe) {
		
	    if (nroCuentaOrigen == nroCuentaDestino) {
	        return 5; // transferencia en la misma cuenta
	    }
		
	    if (!cuentaDAO.existe(nroCuentaOrigen)) {
	        return 1; // cuenta origen inhabilitada o no existe (no debería pasar por este por como está hecho todo)
	    }

	    if (!cuentaDAO.existe(nroCuentaDestino)) {
	        return 2; // cuenta destino inhabilitada o no existe
	    }

	    if (importe <= 0) {
	        return 3; // importe inválido
	    }

	    if (cuentaDAO.obtenerPorNumeroCuenta(nroCuentaOrigen).getSaldo() < importe) {
	        return 4; // saldo insuficiente en cuenta origen
	    }
		
	    if (movimientoDAO.transferencia(nroCuentaOrigen, nroCuentaDestino, importe)) {
	    	return 0; //transferencia exitosa
	    }
	    else {
	    	return -1; //error inesperado
	    }

	}

	
}
