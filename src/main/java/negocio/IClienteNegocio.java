package negocio;


import entidades.Cliente;
import java.util.List;

public interface IClienteNegocio {

	boolean insertar(Cliente cliente);
    List<Cliente> listar();         //  listado
    Cliente obtenerPorId(int id);   // modificación
    boolean modificar(Cliente cliente);
    boolean eliminar(int id);       // baja lógica
	boolean existeCliente(String dni); //validaciones 
	List<Cliente> filtro(String dni, String usuario);  //filtrado
}
