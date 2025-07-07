package daoImpl;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dao.ICuentaDAO;
import entidades.Cliente;
import entidades.Cuenta;
import entidades.CuentaListado;
import entidades.TipoCuenta;
import entidades.TipoUsuario;
import entidades.Usuario;

public class CuentaDAOImpl implements ICuentaDAO{

	Conexion conexion;
	
	@Override
	public boolean insertar(Cuenta cuenta) {
		
		Conexion conexion; // es necesaria para poder cerrar la conexión al terminar cada operacion
		
		boolean insertado = false;
		conexion = Conexion.getConexion();
	    Connection cn = conexion.getSQLConexion();
	    
	    String query = "{CALL AgregarCuenta(?, ?, ?, ?)}";

	    try {
	        CallableStatement cs = cn.prepareCall(query);
	        
	        cs.setInt(1, cuenta.getIdCliente());
	        cs.setInt(2, cuenta.getCodTipoCuenta());
	        cs.setString(3, cuenta.getCbu());
	        cs.setDate(4, new java.sql.Date(cuenta.getFechaCreacion().getTime()));

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
	        System.out.println("Error al insertar cuenta (SP): " + e.getMessage());
	    }
	    finally {
	    	conexion.cerrarConexion();
	    }

	    return insertado;
		
		
		
	}

	@Override
	public List<TipoCuenta> obtenerTiposdeCuenta() {
		List<TipoCuenta> lista = new ArrayList<>();
	    Conexion conexion = Conexion.getConexion();
	    Connection cn = conexion.getSQLConexion();

	    String query = "SELECT Cod_TipoCuenta, Descripcion FROM tiposcuenta";

	    try {
	        PreparedStatement ps = cn.prepareStatement(query);
	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {
	            TipoCuenta tipo = new TipoCuenta();
	            tipo.setCodTipoCuenta(rs.getInt("Cod_TipoCuenta"));
	            tipo.setNombre(rs.getString("Descripcion")); 
	            lista.add(tipo);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        conexion.cerrarConexion();
	    }

	    return lista;
	}

	@Override
	public List<CuentaListado> obtenerTodos() {
	    conexion = Conexion.getConexion();
	    Connection cn = conexion.getSQLConexion();
	    String query = "{CALL sp_obtener_cuentas()}";

	    List<CuentaListado> cuentas = new ArrayList<>();

	    try {
	        CallableStatement cs = cn.prepareCall(query);
	        ResultSet rs = cs.executeQuery();

	        while (rs.next()) {
	            CuentaListado cuenta = new CuentaListado();
	            cuenta.setNroCuenta(rs.getInt("NroCuenta"));
	            cuenta.setTipoCuenta(rs.getString("TipoCuenta"));
	            cuenta.setCbu(rs.getString("CBU"));
	            cuenta.setCuil(rs.getString("CuilCliente"));
	            cuenta.setSaldo(rs.getDouble("Saldo"));
	            cuenta.setFechaCreacion(rs.getDate("Fecha_creacion"));

	            cuentas.add(cuenta);
	        }

	        rs.close();
	        cs.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        conexion.cerrarConexion();
	    }

	    return cuentas;
	}

	@Override
	public boolean eliminar(int nroCuenta) {
		conexion = Conexion.getConexion();
		Connection cn = conexion.getSQLConexion();
		
		boolean res = false;
		
		String query = "UPDATE Cuentas "+
						"SET Estado = 0 "+
						"WHERE NroCuenta = ?";
		try {
			PreparedStatement statement = cn.prepareStatement(query);
			statement.setInt(1, nroCuenta);
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

	public boolean modificar(Cuenta cuenta) {

	    boolean modificado = false;
	    conexion = Conexion.getConexion();
	    Connection cn = conexion.getSQLConexion();

	    String query = "{CALL sp_modificar_cuenta(?, ?, ?)}";

	    try {
	        CallableStatement cs = cn.prepareCall(query);

	        cs.setInt(1, cuenta.getNroCuenta());
	        cs.setInt(2, cuenta.getCodTipoCuenta());
	        cs.setString(3, cuenta.getCbu());

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
	        System.out.println("Error al modificar cuenta (SP): " + e.getMessage());
	    } finally {
	        conexion.cerrarConexion();
	    }

	    return modificado;
	}

	public CuentaListado obtenerPorNumeroCuentaListado(int nroCuenta) {
	    
	    CuentaListado cuenta = null;
	    
	    conexion = Conexion.getConexion();
	    Connection cn = conexion.getSQLConexion();
	    
	    String query = "{CALL sp_obtener_cuenta_por_id(?)}";
	    
	    try {
	        CallableStatement cs = cn.prepareCall(query);
	        cs.setInt(1, nroCuenta);
	        ResultSet rs = cs.executeQuery();

	        if(rs.next()) 
	        {
	            cuenta = new CuentaListado();
	            cuenta.setNroCuenta(rs.getInt("NroCuenta"));
	            cuenta.setCbu(rs.getString("CBU"));
	            cuenta.setTipoCuenta(rs.getString("TipoCuenta_Descripcion"));
	            cuenta.setFechaCreacion(rs.getDate("Fecha_creacion"));
	            cuenta.setSaldo(rs.getDouble("Saldo"));
	            cuenta.setCuil(rs.getString("CUIL"));
	        }
	        //System.out.println(cuenta.toString());
	        
	    }
	    catch(Exception e) 
	    {
	        e.printStackTrace();
	    }
	    finally
	    {
	        conexion.cerrarConexion();
	    }
	    return cuenta;
	}
	
	
	
	
	@Override
	public Cuenta obtenerPorNumeroCuenta(int nroCuenta) {
	    
	    Cuenta cuenta = null;
	    
	    conexion = Conexion.getConexion();
	    Connection cn = conexion.getSQLConexion();
	    
	    String query = "{CALL sp_obtener_cuenta_por_id(?)}";
	    
	    try {
	        CallableStatement cs = cn.prepareCall(query);
	        cs.setInt(1, nroCuenta);
	        ResultSet rs = cs.executeQuery();

	        if(rs.next()) 
	        {
	            cuenta = new Cuenta();
	            cuenta.setNroCuenta(rs.getInt("NroCuenta"));
	            cuenta.setIdCliente(rs.getInt("ID_Cliente"));
	            cuenta.setCodTipoCuenta(rs.getInt("Cod_TipoCuenta"));
	            cuenta.setCbu(rs.getString("CBU"));
	            cuenta.setFechaCreacion(rs.getDate("Fecha_creacion"));
	            cuenta.setSaldo(rs.getDouble("Saldo"));
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
	    return cuenta;
	}

	@Override
	public int contarCuentasActivasPorCliente(int idCliente) {
		
		int cantidad = 0; //cant de cuentas activas
		conexion = Conexion.getConexion();
		Connection cn = conexion.getSQLConexion();
		String query = "SELECT COUNT(*) AS total FROM cuentas WHERE ID_Cliente = ? AND Estado = 1";
		
	  	    
	    try {
	    	  PreparedStatement ps = cn.prepareStatement(query);
	          ps.setInt(1, idCliente);
	          
	          //Ejecutamos la consulta y guardamos el resultado en rs.
	          ResultSet rs = ps.executeQuery();

	          if (rs.next()) {
	              //Guardamos el numero total de cuentas activas en la variable cantidad.
	        	  cantidad = rs.getInt("total");
	          }

	          //Liberamos recursos.
	          ps.close();
	          rs.close();
	    
	    }
	    catch (Exception e) {
	    	 e.printStackTrace();
		}
	    finally
	    {
	        conexion.cerrarConexion();
	    }
		
	    return cantidad;
	}
	
	public List<CuentaListado> filtro(int nroCuenta, String cuil ){
		conexion = Conexion.getConexion();
		Connection cn = conexion.getSQLConexion();
		String query = "{CALL sp_obtener_cuentas_filtro(?, ?)}";

		List<CuentaListado> lista = new ArrayList<CuentaListado>();

		try {
			CallableStatement cs = cn.prepareCall(query);
			cs.setInt (1, nroCuenta);
			cs.setString (2, cuil);
			ResultSet rs = cs.executeQuery();
			while (rs.next()) {
	            CuentaListado cuenta = new CuentaListado();
	            cuenta.setNroCuenta(rs.getInt("NroCuenta"));
	            cuenta.setTipoCuenta(rs.getString("TipoCuenta"));
	            cuenta.setCbu(rs.getString("CBU"));
	            cuenta.setCuil(rs.getString("CuilCliente"));
	            cuenta.setSaldo(rs.getDouble("Saldo"));
	            cuenta.setFechaCreacion(rs.getDate("Fecha_creacion"));

	            lista.add(cuenta);
	        }

	        rs.close();
	        cs.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        conexion.cerrarConexion();
	    }
		
		return lista;
	}

	@Override
	public List<CuentaListado> cuentasPorCliente(int idCli) {
		conexion = Conexion.getConexion();
		Connection cn = conexion.getSQLConexion();
		String query = "{CALL sp_obtener_cuentas_cliente(?)}";

		List<CuentaListado> lista = new ArrayList<CuentaListado>();

		try {
			CallableStatement cs = cn.prepareCall(query);
			cs.setInt (1, idCli);
			ResultSet rs = cs.executeQuery();
			while (rs.next()) {
	            CuentaListado cuenta = new CuentaListado();
	            cuenta.setNroCuenta(rs.getInt("NroCuenta"));
	            cuenta.setTipoCuenta(rs.getString("TipoCuenta_Descripcion"));
	            cuenta.setCbu(rs.getString("CBU"));
	            cuenta.setCuil(rs.getString("CUIL"));
	            cuenta.setSaldo(rs.getDouble("Saldo"));
	            cuenta.setFechaCreacion(rs.getDate("Fecha_creacion"));

	            lista.add(cuenta);
	        }

	        rs.close();
	        cs.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        conexion.cerrarConexion();
	    }
		
		return lista;
		
	}
	
	@Override
	public int proximoNumeroCuenta() {
		conexion = Conexion.getConexion();
        Connection cn = conexion.getSQLConexion();
        
        int proximoID = 0;
		String query ="SELECT `auto_increment` FROM INFORMATION_SCHEMA.TABLES WHERE table_name = 'cuentas' ";
		
		try {
            PreparedStatement ps = cn.prepareStatement(query);

            ResultSet rs = ps.executeQuery();

            if(rs.next()) 
			{
            	proximoID = rs.getInt("auto_increment");
			}
            
        } 
		catch (Exception e) 
		{
        	e.printStackTrace();
        } 
		finally 
		{
			conexion.cerrarConexion();
        }
		return proximoID;
	}

		
	


	
	
	
	
	
	

}
