package negocio;

public interface ILoginNegocio {
	public String validarUsuarioYTipo(String user, String pass);
	public int ObtenerIdCliente(String user, String pass);

}
