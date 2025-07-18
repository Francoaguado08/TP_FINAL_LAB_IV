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
	
	Conexion conexion; // es necesaria para poder cerrar la conexión al terminar cada operacion
	
	@Override
	public boolean insertar(Cliente cliente) {
	   
		boolean insertado = false;
		conexion = Conexion.getConexion();
	    Connection cn = conexion.getSQLConexion();

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
	    finally {
	    	conexion.cerrarConexion();
	    }

	    return insertado;
	}

	
	@Override
	public boolean modificar(Cliente cliente) {

	    boolean modificado = false;
	    conexion = Conexion.getConexion();
	    Connection cn = conexion.getSQLConexion();

	    String query = "{CALL sp_modificar_cliente(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

	    try {
	    	CallableStatement cs = cn.prepareCall(query);

	        cs.setInt(1, cliente.getIdCliente());
	        cs.setString(2, cliente.getCuil());
	        cs.setString(3, cliente.getDni());
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
	            modificado = true;
	        }

	    } catch (Exception e) {
	        try {
	            cn.rollback();
	        } catch (Exception ex) {
	            ex.printStackTrace();
	        }
	        System.out.println("Error al modificar cliente (SP): " + e.getMessage());
	    } finally {
	        conexion.cerrarConexion();
	    }

	    return modificado;
	
	}

	@Override
	public boolean eliminarLogico(int idCliente) {
		
		conexion = Conexion.getConexion();
		Connection cn = conexion.getSQLConexion();
		
		boolean res = false;
		
		String query = "UPDATE Clientes "+
						"SET Estado = 0 "+
						"WHERE ID_Cliente = ?";
		try {
			PreparedStatement statement = cn.prepareStatement(query);
			statement.setInt(1, idCliente);
			if((statement.executeUpdate())>0) {
				cn.commit();
				res = true;
			}
			statement.close();
			cn.close();
				
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	    return res;
	}

	@Override
	public Cliente obtenerPorId(int idCliente) {
		
		Cliente cliente = null;
		
		conexion = Conexion.getConexion();
		Connection cn = conexion.getSQLConexion();
		
		String query = "{CALL sp_obtener_cliente_por_id(?)}";
		
		try {
			CallableStatement cs = cn.prepareCall(query);
			cs.setInt(1, idCliente);
			ResultSet rs = cs.executeQuery();

			if(rs.next()) 
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
	            cliente = new Cliente();
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
	            //Si el cliente esta dado de baja se setea a null
	            if (!rs.getBoolean("Estado")) cliente = null;
			}
		}
		catch(Exception e) 
		{
			e.printStackTrace();
		}
	    finally
	    {
	    	conexion.cerrarConexion();
	    }
		return cliente;
	}

	@Override
	public List<Cliente> obtenerTodos() 
	{
		conexion = Conexion.getConexion();
		Connection cn = conexion.getSQLConexion();
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
		catch(Exception e) 
		{
			e.printStackTrace();
		}
		finally 
		{
			conexion.cerrarConexion();
		}
		
		return clientes;
	}

	
	@Override
	public boolean existeClientePorDNI(String dni) {
		conexion = Conexion.getConexion();
		Connection cn = conexion.getSQLConexion();
		String query ="SELECT DNI from banco.clientes where DNI = ?";
		
		try 
		{
			PreparedStatement statement = cn.prepareCall(query);
			statement.setString(1, dni);
			ResultSet rs = statement.executeQuery();
			
			if(rs.next()) return true; // Si existe entra
			return false;			   // Si no existe no
		}
		catch(Exception e) 
		{
			e.printStackTrace();
			return false;
		}
		finally 
		{
			conexion.cerrarConexion();
		}
		
	}

	
	public List<Cliente> filtro(String dni, String usuario){
		conexion = Conexion.getConexion();
		Connection cn = conexion.getSQLConexion();
		String query = "{CALL sp_obtener_clientes_filtro(?, ?)}";

		List<Cliente> lista = new ArrayList<Cliente>();

		try {
			CallableStatement cs = cn.prepareCall(query);
			cs.setString (1, dni);
			cs.setString (2, usuario);
			ResultSet rs = cs.executeQuery();
			while (rs.next()){
				// Cargar el TipoUsuario
	            		TipoUsuario tipoUsuario = new TipoUsuario();
	            		tipoUsuario.setCodTipoUsuario(rs.getInt("TipoUsuario_Cod"));
	            		tipoUsuario.setDescripcion(rs.getString("TipoUsuario_Descripcion"));
	
	            		// Cargar el Usuario
	            		Usuario user = new Usuario();
	            		user.setIdUsuario(rs.getInt("Usuario_ID"));
	            		user.setUser(rs.getString("Usuario_User"));
	            		//usuario.setContrasena(rs.getString("Usuario_Pass"));
	            		user.setTipoUsuario(tipoUsuario);
	
	            		// Cargar el Cliente
	            		Cliente cliente = new Cliente();
	            		cliente.setIdCliente(rs.getInt("ID_Cliente"));
	            		cliente.setCuil(rs.getString("CUIL"));
	            		cliente.setDni(rs.getString("DNI"));
	            		cliente.setUsuario(user);
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

				lista.add(cliente);
			}
			rs.close();
			cs.close();
		}
		catch(Exception e) 
		{
			e.printStackTrace();
		}
		finally 
		{
			conexion.cerrarConexion();
		}
		
		
		return lista;
	}
	
	
	@Override
	public boolean existeClientePorDniOCuil(String dni, String cuil) {
	    
		boolean existe = false;
	    Connection cn = null;
	    PreparedStatement ps = null;
	    ResultSet rs = null;

	    String query = "SELECT COUNT(*) FROM clientes WHERE DNI = ? OR CUIL = ?";

	    try {
	        cn = Conexion.getConexion().getSQLConexion();
	        ps = cn.prepareStatement(query);
	        ps.setString(1, dni);
	        ps.setString(2, cuil);
	        rs = ps.executeQuery();

	        if (rs.next() && rs.getInt(1) > 0) {
	            existe = true;
	        }

	    } catch (Exception e) {
	        System.out.println("Error en existeClientePorDniOCuil: " + e.getMessage());

	    } finally {
	        try {
	            if (rs != null) rs.close();
	            if (ps != null) ps.close();
	            if (cn != null) cn.close(); // o cn.cerrarConexion() si tenés un método propio
	        } catch (Exception e) {
	            System.out.println("Error al cerrar recursos en existeClientePorDniOCuil: " + e.getMessage());
	        }
	    }

	    return existe;
	}
	
	
}
