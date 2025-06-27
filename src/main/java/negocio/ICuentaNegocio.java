package negocio;

import java.util.List;

import entidades.Cliente;
import entidades.Cuenta;
import entidades.TipoCuenta;

public interface ICuentaNegocio {
	boolean insertar(Cuenta cuenta);
    List<TipoCuenta> listar();         //  listado

}
