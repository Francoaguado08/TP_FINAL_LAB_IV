package daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dao.ILoginDAO;

public class LoginDAOImpl implements ILoginDAO{


	public String validarUsuario(String user, String pass) {
	String query = "SELECT t.Descripcion FROM usuarios u INNER JOIN tiposusuarios t on u.Cod_TipoUsuario = t.Cod_TipoUsuario WHERE u.User = ? AND u.Pass = ?";        
	String tipoUsuario =null;
	try (Connection cn = Conexion.getConexion().getSQLConexion();
			PreparedStatement stmt = cn.prepareStatement(query)) {      
			stmt.setString(1, user);
			stmt.setString(2, pass);
		            
	 try (ResultSet rs = stmt.executeQuery()) {
	       if (rs.next()) { 
              return tipoUsuario = rs.getString("Descripcion");
           } else {
               return tipoUsuario; 
           }
       }
 }catch (SQLException e) {
	e.printStackTrace();
    return null;
}		
}
	
	
	
}
