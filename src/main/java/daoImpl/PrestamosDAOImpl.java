package daoImpl;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dao.IPrestamosDAO;
import entidades.Cuenta;
import entidades.Prestamo;
import entidades.TipoCuenta;

public class PrestamosDAOImpl implements IPrestamosDAO{

	@Override
	public List<Cuenta> misCuentas(int idCliente) {
			List<Cuenta> lista = new ArrayList<>();
		    Conexion conexion = Conexion.getConexion();
		    Connection cn = conexion.getSQLConexion();

		    String query = "SELECT NroCuenta FROM cuentas where ID_Cliente = ?";

		    try {
		        PreparedStatement ps = cn.prepareStatement(query);
		        ps.setInt(1, idCliente);
		        ResultSet rs = ps.executeQuery();

		        while (rs.next()) {
		            Cuenta c = new Cuenta();
		            c.setNroCuenta(rs.getInt("NroCuenta"));	
		            lista.add(c);
		        }

		    } catch (Exception e) {
		        e.printStackTrace();
		    } finally {
		        conexion.cerrarConexion();
		    }

		    return lista;
		}

	@Override
	public boolean solPrestamo(Prestamo pres) {
		Conexion conexion;
		boolean generado = false;
		conexion = Conexion.getConexion();
	    Connection cn = conexion.getSQLConexion();
	    String query = "{CALL insertar_prestamo(?, ?, ?, ?, ?, ? , ?, ?)}";

	    try {
	        CallableStatement cs = cn.prepareCall(query);
	        
	        cs.setInt(1, pres.getIdCliente());
	        cs.setDate(2, new java.sql.Date(pres.getFecha().getTime()));
	        cs.setDouble(3, pres.getImporteAPagar());
	        cs.setDouble(4, pres.getImportePedido());
	        cs.setInt(5, pres.getPlazoPagoMeses());
	        cs.setDouble(6, pres.getMontoPorMes());
	        cs.setBoolean(7, pres.isEstado());
	        cs.setString(8, pres.getCuentaDepositar());

	        if (cs.executeUpdate() > 0) {
	            cn.commit();
	            generado = true;
	        }
	    } catch (Exception e) {
	        try {
	            cn.rollback();
	        } catch (Exception ex) {
	            ex.printStackTrace();
	        }
	        System.out.println("Error al generar prestamo (SP): " + e.getMessage());
	    }
	    finally {
	    	conexion.cerrarConexion();
	    }

	    return generado;
		
}
	
}
