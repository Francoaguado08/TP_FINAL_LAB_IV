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
		int idCliente = 0;
		try {
			idCliente = l.obtenerIdClienteSesion(user, pass);
		}
		catch(Exception e) {
			e.printStackTrace();	
		}
		return idCliente;
	}

}
