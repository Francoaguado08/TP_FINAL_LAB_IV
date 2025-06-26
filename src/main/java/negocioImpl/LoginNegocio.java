package negocioImpl;

import daoImpl.LoginDAOImpl;
import negocio.ILoginNegocio;

public class LoginNegocio implements ILoginNegocio{

	@Override
	public String validarUsuarioYTipo(String user, String pass) {
		LoginDAOImpl l = new LoginDAOImpl();
		return l.validarUsuario(user, pass);
	}

	@Override
	public int ObtenerIdCliente(String user, String pass) {
		LoginDAOImpl l = new LoginDAOImpl();
		return l.obtenerIdClienteSesion(user, pass);
	}

}
