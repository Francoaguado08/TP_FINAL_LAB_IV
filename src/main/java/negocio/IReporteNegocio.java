package negocio;

import java.sql.Date;

import entidades.ReporteResultado;

public interface IReporteNegocio {

	
	public ReporteResultado generarReporte(java.sql.Date desde, java.sql.Date hasta);
	
	
}