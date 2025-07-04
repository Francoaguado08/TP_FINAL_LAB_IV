package negocio;


import entidades.Cliente;
import java.util.List;

public interface IClienteNegocio {

	boolean insertar(Cliente cliente);
    List<Cliente> listar();         //  listado
    Cliente obtenerPorId(int id);   // modificación
    boolean modificar(Cliente cliente);
    boolean eliminar(int id);       // baja lógica
	List<Cliente> filtro(String dni, String usuario);  //filtrado
	
	boolean existeCliente(String dni); //validaciones 
	
	
	public boolean existeClientePorDniOCuil(String dni, String cuil);
	
	
}
