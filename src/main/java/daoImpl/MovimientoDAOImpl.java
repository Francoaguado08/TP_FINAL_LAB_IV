package daoImpl;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dao.IMovimientoDAO;
import entidades.Movimiento;
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

}
