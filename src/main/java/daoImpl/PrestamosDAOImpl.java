package daoImpl;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dao.IPrestamosDAO;
import entidades.Cuenta;
import entidades.Cuota;
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
	        cn.setAutoCommit(false);
	        
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

	@Override
	public List<Prestamo> prestamosEspera() {
		List<Prestamo> lista = new ArrayList<>();
	    Conexion conexion = Conexion.getConexion();
	    Connection cn = conexion.getSQLConexion();

	    String query = "SELECT * FROM prestamos where Estado = false";

	    try {
	        PreparedStatement ps = cn.prepareStatement(query);
	        ResultSet rs = ps.executeQuery();
	        while (rs.next()) {
	        	Prestamo p = new Prestamo();
	        	p.setIdPrestamo(rs.getInt("ID_Prestamo"));
	            p.setIdCliente(rs.getInt("ID_Cliente"));
	            p.setCuentaDepositar(rs.getString("Cuenta_depositar"));
		        p.setFecha(rs.getDate("Fecha"));
		        p.setImporteAPagar(rs.getDouble("Importe_a_pagar"));
		        p.setImportePedido(rs.getDouble("Importe_pedido"));
		        p.setPlazoPagoMeses(rs.getInt("Plazo_pago_meses"));
		        p.setMontoPorMes(rs.getDouble("Monto_por_mes"));
	            lista.add(p);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        conexion.cerrarConexion();
	    }

	    return lista;
	}

	@Override
	public boolean acreditarPrestamo(double saldoN, int idCliente, String nCuenta) {
		    Conexion conexion = Conexion.getConexion();
		    Connection cn = conexion.getSQLConexion();
		    boolean actualizado = false;

		    String query = "UPDATE cuentas SET Saldo = Saldo + ? WHERE NroCuenta = ? AND ID_Cliente = ?";

		    try {
		        PreparedStatement ps = cn.prepareStatement(query);
		        ps.setDouble(1, saldoN);
		        ps.setString(2, nCuenta);
		        ps.setInt(3, idCliente);
		        
		        if (ps.executeUpdate() > 0) {
		            cn.commit();
		            actualizado = true;
		        }
		    } catch (Exception e) {
		        try {
		            cn.rollback();
		        } catch (Exception ex) {
		            ex.printStackTrace();
		        }
		        e.printStackTrace();
		    } finally {
		        conexion.cerrarConexion();
		    }

		    return actualizado;
		}

	@Override
	public boolean agregarCuota(Cuota c) {
		Conexion conexion;
		boolean generado = false;
		conexion = Conexion.getConexion();
	    Connection cn = conexion.getSQLConexion();
	    String query = "{CALL insertar_cuota(?, ?, ?, ?)}";

	    try {
	        CallableStatement cs = cn.prepareCall(query);
	        cn.setAutoCommit(false);
	        
	        cs.setInt(1, c.getIdPrestamo());
	        cs.setInt(2, c.getNroCuota());
	        cs.setDouble(3, c.getMonto());
	        cs.setBoolean(4, c.isEstado());
	        
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
	        System.out.println("Error al generar cuotas (SP): " + e.getMessage());
	    }
	    finally {
	    	conexion.cerrarConexion();
	    }

	    return generado;
		
}

	@Override
	public boolean estadoPrestamo(int idcliente, int idPrestamo) {
		   Conexion conexion = Conexion.getConexion();
		    Connection cn = conexion.getSQLConexion();
		    boolean actualizado = false;

		    String query = "UPDATE prestamos SET Estado = 1 WHERE ID_Prestamo = ? AND ID_Cliente = ?";

		    try {
		        PreparedStatement ps = cn.prepareStatement(query);
		        ps.setInt(1, idPrestamo);
		        ps.setInt(2, idcliente);
		   
		        if (ps.executeUpdate() > 0) {
		            cn.commit();
		            actualizado = true;
		        }
		    } catch (Exception e) {
		        try {
		            cn.rollback();
		        } catch (Exception ex) {
		            ex.printStackTrace();
		        }
		        e.printStackTrace();
		    } finally {
		        conexion.cerrarConexion();
		    }

		    return actualizado;
		}
		
	
}
