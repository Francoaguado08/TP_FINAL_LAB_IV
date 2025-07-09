package negocio;

import java.util.List;
import entidades.Movimiento;

public interface IMovimientoNegocio {
	boolean insertar(Movimiento movimiento);
    List<Movimiento> listarPorNumeroCuenta(int numeroCuenta); //listado de movimientos por numero de cuenta
    Movimiento obtenerPorNumero(int numero); 
    public int transferencia(int nroCuentaOrigen, int nroCuentaDestino, double importe);
}
