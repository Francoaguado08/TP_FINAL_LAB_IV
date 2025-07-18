package daoImpl;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import dao.IMovimientoDAO;
import entidades.Movimiento;
import entidades.ReporteResultado;
import entidades.TipoMovimiento;

public class MovimientoDAOImpl implements IMovimientoDAO{
	
	Conexion conexion; // es necesaria para poder cerrar la conexión al terminar cada operacion
	
	@Override
	public boolean insertar(Movimiento movimiento) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<Movimiento> obtenerTodosNumeroCuenta(int numeroCuenta) {
		
		List<Movimiento> movimientos = new ArrayList<Movimiento>();
		
		conexion = Conexion.getConexion();
		Connection cn = conexion.getSQLConexion();
		
		String query = "{CALL sp_obtener_movimientos_por_cuenta(?)}";

		try {
			CallableStatement cs = cn.prepareCall(query);
			cs.setInt(1, numeroCuenta);
			ResultSet rs = cs.executeQuery();
			
			while(rs.next()) 
	        {
				Movimiento mov = new Movimiento();
	            mov.setNumeroMovimiento(rs.getInt("NroMov"));
	            mov.setNumeroCuenta(rs.getInt("NroCuenta"));
	            mov.setDetalle(rs.getString("Detalle"));
	            mov.setImporte(rs.getDouble("Importe"));
	            mov.setFecha(rs.getDate("Fecha"));

	            // TipoMovimiento 
	            TipoMovimiento tipoMov = new TipoMovimiento();
	            tipoMov.setCodigoTipoMov(rs.getInt("codigoTipoMov"));
	            tipoMov.setDescripcion(rs.getString("descripcionTipoMov"));
	            mov.setTipoMovimiento(tipoMov);

	            movimientos.add(mov);
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
		
		return movimientos;
	}

	@Override
	public Movimiento obtenerPorNumero(int numero) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ReporteResultado obtenerReporte(java.sql.Date desde, java.sql.Date hasta){
		//establezco la conexion.
		conexion = Conexion.getConexion();
		Connection cn = conexion.getSQLConexion();
		
		double ingresos = 0;
		double egresos = 0;
		
		String query = "{CALL sp_Ingresos_Egresos(?,?)}";
		
		try {
			CallableStatement cs = cn.prepareCall(query);
			cs.setDate(1, new java.sql.Date(desde.getTime()) );
			cs.setDate(2, new java.sql.Date(hasta.getTime()));
		
			ResultSet rs = cs.executeQuery();
		
			if (rs.next()) {
			    ingresos = rs.getDouble("TotalIngresos");
			    if (rs.wasNull()) ingresos = 0.0;

			    egresos = rs.getDouble("TotalEgresos");
			    if (rs.wasNull()) egresos = 0.0;
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
			
		return new ReporteResultado(ingresos, egresos);
		
	}
	
	public boolean transferencia(int nroCuentaOrigen, int nroCuentaDestino, double importe) {
		boolean res = false;
		conexion = Conexion.getConexion();
		Connection cn = conexion.getSQLConexion();
		
		String query = "{CALL sp_transferir_cuentas(?, ?, ?)}";
		
		try {
			CallableStatement cs = cn.prepareCall(query);
			
			cs.setInt(1, nroCuentaOrigen);
			cs.setInt(2, nroCuentaDestino);
			cs.setDouble(3, importe);
			
			if (cs.executeUpdate() > 0) {
				cn.commit();
				res = true;
			}
			
		} catch (Exception e) {
			try {
				cn.rollback();
			} catch (Exception ex) {
				ex.printStackTrace();
			}
			System.out.println("Error al ejecutar la transferencia" + e.getMessage());
		}
		finally {
			conexion.cerrarConexion();
		}
		
		
		return res;
	}		
			
		
		
		
		
		

}
