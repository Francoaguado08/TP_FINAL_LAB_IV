package daoImpl;

import java.util.List;
import java.sql.*;
import java.util.ArrayList;


import daoImpl.Conexion;
import dao.IClienteDAO;
import entidades.Cliente;
import entidades.Usuario;
import entidades.TipoUsuario;





public class ClienteDAOImpl implements IClienteDAO{

	@Override
	public boolean insertar(Cliente cliente) {
	   
		boolean insertado = false;
	    Connection cn = Conexion.getConexion().getSQLConexion();

	    String query = "{CALL sp_insertar_cliente(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

	    try {
	        CallableStatement cs = cn.prepareCall(query);
	        
	        cs.setString(1, cliente.getCuil());
	        cs.setString(2, cliente.getDni());
	        cs.setInt(3, cliente.getUsuario().getIdUsuario());
	        cs.setString(4, cliente.getNombre());
	        cs.setString(5, cliente.getApellido());
	        cs.setString(6, cliente.getSexo());
	        cs.setString(7, cliente.getNacionalidad());
	        cs.setDate(8, new java.sql.Date(cliente.getFechaNacimiento().getTime()));
	        cs.setString(9, cliente.getDireccion());
	        cs.setString(10, cliente.getLocalidad());
	        cs.setString(11, cliente.getProvincia());
	        cs.setString(12, cliente.getCorreoElectronico());
	        cs.setString(13, cliente.getTelefono());

	        if (cs.executeUpdate() > 0) {
	            cn.commit();
	            insertado = true;
	        }
	    } catch (Exception e) {
	        try {
	            cn.rollback(); // rollback si ocurre error
	        } catch (Exception ex) {
	            ex.printStackTrace();
	        }
	        System.out.println("Error al insertar cliente (SP): " + e.getMessage());
	    }

	    return insertado;
	}


	
	
	
	
	@Override
	public boolean modificar(Cliente cliente) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean eliminarLogico(int idCliente) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Cliente obtenerPorId(int idCLiente) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Cliente> obtenerTodos() 
	{
		
		Connection cn = Conexion.getConexion().getSQLConexion();
		String query ="{CALL sp_obtener_clientes()}";
		
	    List<Cliente> clientes = new ArrayList<>();
		
		try 
		{
			CallableStatement cs = cn.prepareCall(query);
	        ResultSet rs = cs.executeQuery();
	        
	        while(rs.next()) 
	        {
	        	
	        	// Cargar el TipoUsuario
	            TipoUsuario tipoUsuario = new TipoUsuario();
	            tipoUsuario.setCodTipoUsuario(rs.getInt("TipoUsuario_Cod"));
	            tipoUsuario.setDescripcion(rs.getString("TipoUsuario_Descripcion"));
	
	            // Cargar el Usuario
	            Usuario usuario = new Usuario();
	            usuario.setIdUsuario(rs.getInt("Usuario_ID"));
	            usuario.setUser(rs.getString("Usuario_User"));
	            usuario.setContrasena(rs.getString("Usuario_Pass"));
	            usuario.setTipoUsuario(tipoUsuario);
	
	            // Cargar el Cliente
	            Cliente cliente = new Cliente();
	            cliente.setIdCliente(rs.getInt("ID_Cliente"));
	            cliente.setCuil(rs.getString("CUIL"));
	            cliente.setDni(rs.getString("DNI"));
	            cliente.setUsuario(usuario);
	            cliente.setNombre(rs.getString("Nombre"));
	            cliente.setApellido(rs.getString("Apellido"));
	            cliente.setSexo(rs.getString("Sexo"));
	            cliente.setNacionalidad(rs.getString("Nacionalidad"));
	            cliente.setFechaNacimiento(rs.getDate("Fecha_nacimiento"));
	            cliente.setDireccion(rs.getString("Direccion"));
	            cliente.setLocalidad(rs.getString("Localidad"));
	            cliente.setProvincia(rs.getString("Provincia"));
	            cliente.setCorreoElectronico(rs.getString("Correo_electronico"));
	            cliente.setTelefono(rs.getString("Telefono"));
	            cliente.setEstado(rs.getBoolean("Estado"));
	            
	            //TEMPORAL VEREMOS SI SE QUEDA
	            //Salteamos clientes que esten dados de baja.
	            if (!rs.getBoolean("Estado")) continue;  
	            
	            
	            // Agregar a la lista
	            clientes.add(cliente);
	        }
	        
	        rs.close();
	        cs.close();
	        
		}
		catch(Exception e) {e.printStackTrace();}
		
		
		return clientes;
	}

	
	@Override
	public boolean existeClientePorDNI(String dni) {
		// TODO Auto-generated method stub
		return false;
	}

	
	
	
}
