package dao;

import java.util.List;
import entidades.Cliente;

public interface IClienteDAO {

	public boolean insertar(Cliente cliente);
	public boolean modificar(Cliente cliente);
	public boolean eliminarLogico(int idCliente); //BAJA LOGICA.
	
	public Cliente obtenerPorId(int idCLiente);
	public List<Cliente>obtenerTodos();
	public boolean existeClientePorDNI(String dni); //PARA EVITAR LOS DUPLICADOS.
	public List<Cliente>filtro(String dni, String usuario);
	
	public boolean existeClientePorDniOCuil(String dni, String cuil);
	
	
}
