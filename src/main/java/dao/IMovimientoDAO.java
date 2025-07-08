package dao;

import java.util.List;

import entidades.Movimiento;
import entidades.ReporteResultado;

public interface IMovimientoDAO {
	
	public boolean insertar(Movimiento movimiento);
	
	public List<Movimiento>obtenerTodosNumeroCuenta(int numeroCuenta);
	
	public Movimiento obtenerPorNumero(int numero);
	
	
    public ReporteResultado obtenerReporte(java.sql.Date desde, java.sql.Date hasta);


}
