package daoImpl;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import dao.ICuotasDAO;
import entidades.Cuota;
import entidades.Movimiento;

public class CuotasDAOImpl implements ICuotasDAO {

	@Override
	public List<Cuota> obtenerCuotas(int id) {
		List<Cuota> lista = new ArrayList<>();
	    Conexion conexion = Conexion.getConexion();
	    Connection cn = conexion.getSQLConexion();

	    String query = "SELECT * FROM cuotas c INNER JOIN prestamos p ON p.ID_Prestamo = c.ID_Prestamo where p.ID_Cliente = ? AND c.Estado = 1";

	    try {
	        PreparedStatement ps = cn.prepareStatement(query);
	        ps.setInt(1, id);
	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {
	            Cuota c = new Cuota();
	            c.setIdPrestamo(rs.getInt("ID_Prestamo"));
	            c.setNroCuota(rs.getInt("Nro_cuota"));
	            c.setMonto(rs.getDouble("Monto"));
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
	public boolean pagoCuota(int nCuota, int idP, String nroCuenta, Date fecha, double monto, int idCliente) {
		Conexion conexion = Conexion.getConexion();
	    Connection cn = conexion.getSQLConexion();
	    boolean actualizado = false;

	    String actualizarFechaCuota = "UPDATE cuotas SET Fecha_de_pago = ? WHERE ID_Prestamo = ? AND Nro_Cuota = ?";
	    String actualizarSaldoCuenta = "UPDATE cuentas SET Saldo = Saldo - ? WHERE NroCuenta = ? AND ID_Cliente = ?";
	    String marcarCuotaPagada = "UPDATE cuotas SET Estado = 0 WHERE ID_Prestamo = ? AND Nro_Cuota = ?";

	    try {
	        PreparedStatement ps1 = cn.prepareStatement(actualizarFechaCuota);
	        ps1.setDate(1, new java.sql.Date(fecha.getTime()));
	        ps1.setInt(2, idP);
	        ps1.setInt(3, nCuota);

	        PreparedStatement ps2 = cn.prepareStatement(actualizarSaldoCuenta);
	        ps2.setDouble(1, monto);
	        ps2.setString(2, nroCuenta);
	        ps2.setInt(3, idCliente);

	        PreparedStatement ps3 = cn.prepareStatement(marcarCuotaPagada);
	        ps3.setInt(1, idP);
	        ps3.setInt(2, nCuota);

	        int r1 = ps1.executeUpdate();
	        int r2 = ps2.executeUpdate();
	        int r3 = ps3.executeUpdate();

	        if (r1 > 0 && r2 > 0 && r3 > 0) {
	            cn.commit();
	            actualizado = true;
	        } else {
	            cn.rollback();
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
		public boolean generarMovimiento(Movimiento m) {
			Conexion conexion;
			boolean generado = false;
			conexion = Conexion.getConexion();
		    Connection cn = conexion.getSQLConexion();
		    String query = "{CALL sp_insertarMovimiento(?, ?, ?, ?, ?)}";

		    try {
		        CallableStatement cs = cn.prepareCall(query);	        
		        cs.setInt(1, m.getNumeroCuenta());
		        cs.setInt(2, m.getTipoMovimiento().getCodigoTipoMov());
		        cs.setString(3, m.getDetalle());
		        cs.setDouble(4, m.getImporte());
		        cs.setDate(5, new java.sql.Date(m.getFecha().getTime()));
		        
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
		        System.out.println("Error al generar movimiento (SP): " + e.getMessage());
		    }
		    finally {
		    	conexion.cerrarConexion();
		    }

		    return generado;
		}

	@Override
	public double obtenerSaldo(int nroCuenta) {
	    Conexion conexion;
	    double saldo = 0;
	    conexion = Conexion.getConexion();
	    Connection cn = conexion.getSQLConexion();
	    String query = "SELECT Saldo FROM cuentas WHERE NroCuenta = ?";

	    try {
	        PreparedStatement ps = cn.prepareStatement(query);
	        ps.setInt(1, nroCuenta);
	        ResultSet rs = ps.executeQuery();

	        if (rs.next()) {
	            saldo = rs.getInt("Saldo");
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return saldo;
	}


	
	
}
