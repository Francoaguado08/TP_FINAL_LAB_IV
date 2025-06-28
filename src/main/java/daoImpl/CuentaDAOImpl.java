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

	    String query = "{CALL sp_modificar_cuenta(?, ?, ?, ?)}";

	    try {
	    	CallableStatement cs = cn.prepareCall(query);

	        cs.setInt(1, cuenta.getIdCliente());
	        cs.setInt(2, cuenta.getCodTipoCuenta());
	        cs.setString(3, cuenta.getCbu());
	        cs.setDouble(4, cuenta.getSaldo());

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


}
