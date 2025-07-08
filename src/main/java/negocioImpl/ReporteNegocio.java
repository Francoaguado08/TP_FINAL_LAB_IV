package negocioImpl;

import java.sql.Date;

import entidades.ReporteResultado;
import negocio.IReporteNegocio;
import dao.IMovimientoDAO;
import daoImpl.MovimientoDAOImpl;

public class ReporteNegocio implements IReporteNegocio{

   private IMovimientoDAO movimientoDAO = new MovimientoDAOImpl();
	
	
   @Override
   public ReporteResultado generarReporte(java.sql.Date desde, java.sql.Date hasta) {
       
       return movimientoDAO.obtenerReporte(desde, hasta);
   }

}
