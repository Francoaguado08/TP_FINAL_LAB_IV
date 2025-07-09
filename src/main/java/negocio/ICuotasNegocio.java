package negocio;

import java.util.Date;
import java.util.List;

import entidades.Cuota;

public interface ICuotasNegocio {
	public List<Cuota> obtenerCuotas(int id);
	public boolean pagoCuota (int nCuota, int idP, String nro, Date fecha, double monto, int idCliente);

}
