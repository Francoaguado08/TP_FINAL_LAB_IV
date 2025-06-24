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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Cliente obtenerPorId(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean modificar(Cliente cliente) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean eliminar(int id) {
		// TODO Auto-generated method stub
		return false;
	}

	
	
}
