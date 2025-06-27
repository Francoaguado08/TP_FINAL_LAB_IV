package dao;

import java.util.List;

import entidades.Cuenta;
import entidades.TipoCuenta;

public interface ICuentaDAO {
	public boolean insertar(Cuenta cuenta);
	public List<TipoCuenta>obtenerTiposdeCuenta();

}
