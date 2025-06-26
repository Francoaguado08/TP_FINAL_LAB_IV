package dao;

public interface ILoginDAO {
	public String validarUsuario(String user, String pass);
	public int obtenerIdClienteSesion(String user, String pass);

}
