package negocioImpl;

import java.util.List;
import dao.IClienteDAO;
import daoImpl.ClienteDAOImpl;
import entidades.Cliente;
import negocio.IClienteNegocio;

public class ClienteNegocio implements IClienteNegocio{

	
   private IClienteDAO clienteDAO = new ClienteDAOImpl();
	
	@Override
	public boolean insertar(Cliente cliente) {
		return clienteDAO.insertar(cliente);
		 
	}

	@Override
	public List<Cliente> listar() {
		return clienteDAO.obtenerTodos();
	}

	@Override
	public Cliente obtenerPorId(int id) {
		return clienteDAO.obtenerPorId(id);
	}

	@Override
	public boolean modificar(Cliente cliente) {
		if(clienteDAO.modificar(cliente)) return true;
		return false;
	}

	@Override
	public boolean eliminar(int id) {
		return clienteDAO.eliminarLogico(id);
	}

	
	
}
