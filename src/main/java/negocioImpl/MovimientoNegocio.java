package negocioImpl;

import java.util.List;

import entidades.Movimiento;
import negocio.IMovimientoNegocio;
import dao.IMovimientoDAO;
import daoImpl.MovimientoDAOImpl;

public class MovimientoNegocio implements IMovimientoNegocio{
	
	private IMovimientoDAO movimientoDAO = new MovimientoDAOImpl();

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

	
}
