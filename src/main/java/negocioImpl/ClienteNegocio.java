package negocioImpl;

import java.util.List;
import dao.IClienteDAO;
import dao.IUsuarioDAO;
import daoImpl.ClienteDAOImpl;
import daoImpl.UsuarioDAOImpl;
import entidades.Cliente;
import negocio.IClienteNegocio;

public class ClienteNegocio implements IClienteNegocio{

	
   private IClienteDAO clienteDAO = new ClienteDAOImpl();
   private IUsuarioDAO usuarioDAO = new UsuarioDAOImpl(); 
	
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
		boolean resultado = false;

	    try {
	        // Modificar datos del cliente
	        boolean clienteModificado = clienteDAO.modificar(cliente);

	        // Modificar contraseña del usuario asociada al cliente
	        boolean usuarioModificado = usuarioDAO.modificar(cliente.getUsuario());

	        if (clienteModificado && usuarioModificado) {
	            resultado = true;
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return resultado;
	}

	@Override
	public boolean eliminar(int id) {
		return clienteDAO.eliminarLogico(id);
	}

	@Override
	public boolean existeCliente(String dni) {
		if(clienteDAO.existeClientePorDNI(dni)) return true;
		return false;
	}
	
	public List<Cliente> filtro(String dni, String usuario){
		return clienteDAO.filtro(dni, usuario);
	}
	
	
}
