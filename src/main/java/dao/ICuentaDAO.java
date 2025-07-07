package dao;

import java.util.List;

import entidades.CuentaListado;
import entidades.Cliente;
import entidades.Cuenta;
import entidades.TipoCuenta;

public interface ICuentaDAO {
	public boolean insertar(Cuenta cuenta);
	public List<TipoCuenta>obtenerTiposdeCuenta();
	public List<CuentaListado>obtenerTodos();
	public boolean eliminar(int nroCuenta);
	public boolean modificar(Cuenta cuenta);
	public Cuenta obtenerPorNumeroCuenta(int idCuenta);
	
	public int contarCuentasActivasPorCliente(int idCliente);
	
	public List<CuentaListado>filtro(int nroCuenta, String cuil);
	
	public List<CuentaListado> cuentasPorCliente(int idCli);
	
	public int proximoNumeroCuenta();
}
