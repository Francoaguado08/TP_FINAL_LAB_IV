package daoImpl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion 
{
	public static Conexion instancia;
	private Connection connection;
	private static final String host = "jdbc:mysql://localhost:3306/";
	private static final String user = "root";
	private static final String pass = "root";
	private static final String dbName = "banco";
	
	Conexion()
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver"); // quitar si no es necesario
			this.connection = DriverManager.getConnection(host + dbName,user,pass);
			this.connection.setAutoCommit(false);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public static Conexion getConexion()   
	{								
		if(instancia == null)
		{
			instancia = new Conexion();
		}
		return instancia;
	}

	public Connection getSQLConexion() {
	    try {
	    	//es por si quiero usar otras cosas y necesito usar otra conexión y no solo una
	        if (this.connection == null || this.connection.isClosed()) {
	            this.connection = DriverManager.getConnection(host + dbName, user, pass);
	            this.connection.setAutoCommit(false);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return this.connection;
	}
	
	public void cerrarConexion()
	{
		try 
		{
			this.connection.close();
		}
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		instancia = null;
	}
}
