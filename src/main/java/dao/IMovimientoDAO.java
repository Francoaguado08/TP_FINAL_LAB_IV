package dao;

import java.util.List;

import entidades.Movimiento;

public interface IMovimientoDAO {
	public boolean insertar(Movimiento movimiento);
	public List<Movimiento>obtenerTodosNumeroCuenta(int numeroCuenta);
	public Movimiento obtenerPorNumero(int numero);
}
