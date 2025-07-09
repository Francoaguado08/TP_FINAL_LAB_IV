package negocioImpl;

import java.util.Date;
import java.util.List;

import dao.ICuotasDAO;
import daoImpl.CuotasDAOImpl;
import entidades.Cuota;
import negocio.ICuotasNegocio;

public class CuotasNegocio implements ICuotasNegocio{
	
	CuotasDAOImpl c = new CuotasDAOImpl();
	
	@Override
	public List<Cuota> obtenerCuotas(int id) {
		return c.obtenerCuotas(id);
	}

	@Override
	public boolean pagoCuota(int nCuota, int idP, String nro, Date fecha, double monto, int idCliente) {
		return c.pagoCuota(nCuota, idP, nro, fecha, monto, idCliente);
	}

}
