package daoImpl;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dao.ICuentaDAO;
import entidades.Cuenta;
import entidades.TipoCuenta;

public class CuentaDAOImpl implements ICuentaDAO{

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

}
