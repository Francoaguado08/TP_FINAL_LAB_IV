package daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dao.ILoginDAO;

public class LoginDAOImpl implements ILoginDAO{
	
	Conexion cn; // es necesaria para poder cerrar la conexión al terminar cada operacion

	public String validarUsuario(String user, String pass) {
		String query = "SELECT t.Descripcion FROM usuarios u INNER JOIN tiposusuarios t on u.Cod_TipoUsuario = t.Cod_TipoUsuario WHERE u.User = ? AND u.Pass = ?";        
		String tipoUsuario =null;
	
		cn = Conexion.getConexion();
			            
		try {
			PreparedStatement stmt = cn.getSQLConexion().prepareStatement(query);
				
			stmt.setString(1, user);
			stmt.setString(2, pass);
				
			ResultSet rs = stmt.executeQuery();
			
			if (rs.next()) return tipoUsuario = rs.getString("Descripcion");
				
			else return tipoUsuario; 
		}
		catch (SQLException e) 
		{
			e.printStackTrace();
			return null;
		}		
		finally
		{
			cn.cerrarConexion();
		}
	}

	@Override
	public int obtenerIdClienteSesion(String user, String pass) {
		    final String query = "SELECT c.ID_Cliente FROM clientes c INNER JOIN usuarios u ON c.ID_Usuario = u.ID_Usuario WHERE u.User = ? AND u.Pass = ?";
		    Integer idCliente = 0;
		    /*use el integer para que me permita retornar null, por las dudas.*/
		    
		    cn = Conexion.getConexion();
		    
		    try {
		    	PreparedStatement stmt = cn.getSQLConexion().prepareStatement(query);
		    	
		        stmt.setString(1, user);
		        stmt.setString(2, pass);
		        
		        ResultSet rs = stmt.executeQuery();
				if (rs.next()) idCliente = rs.getInt("ID_Cliente");

		    } 
		    catch (SQLException e) 
		    {
		    	e.printStackTrace();
		    }
		    finally
		    {
		    	cn.cerrarConexion();
		    }
		    
		    return idCliente;
	}
	
	
	
	
	}
	
	

