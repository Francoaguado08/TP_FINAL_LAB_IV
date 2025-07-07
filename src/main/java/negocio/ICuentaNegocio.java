package negocio;

import java.util.List;

import entidades.Cliente;
import entidades.Cuenta;
import entidades.CuentaListado;
import entidades.TipoCuenta;

public interface ICuentaNegocio {
	boolean insertar(Cuenta cuenta);
    List<TipoCuenta> listar();         
    List<CuentaListado>listarTodos(); //  listado
    boolean eliminar(int nroCuenta);
    public boolean modificar(Cuenta cuenta);
	public Cuenta obtenerPorNumeroCuenta(int id);
	public CuentaListado obtenerPorNumeroCuentaListado(int id);
	public boolean clienteTieneTresCuentasActivas(int idCliente);
	
	List<CuentaListado>filtro(int nroCuenta, String cuil);
	public List<CuentaListado> cuentasPorCliente(int idCli);
	
	public int obtenerProximoNumeroCuenta();
	
}
