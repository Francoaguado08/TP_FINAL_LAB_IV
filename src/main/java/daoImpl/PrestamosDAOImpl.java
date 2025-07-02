package daoImpl;

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


}
