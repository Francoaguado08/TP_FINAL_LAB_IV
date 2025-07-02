package negocio;

import java.util.List;

import entidades.Cuenta;

public interface IPrestamoNegocio {
	public List<Cuenta> misCuentas(int idCliente);

}
