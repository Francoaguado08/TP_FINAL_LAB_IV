package controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.ReporteResultado;
import negocio.IReporteNegocio;
import negocioImpl.ReporteNegocio;


@WebServlet("/ReportesServlet")
public class ReportesServlet extends HttpServlet {
	
	
	private static final long serialVersionUID = 1L;
    private IReporteNegocio reporteNegocio = new ReporteNegocio();   
   
    public ReportesServlet() {
        super();
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    try {
	        // Paso 1: Parsear las fechas desde el formulario
	        String strDesde = request.getParameter("desde");
	        String strHasta = request.getParameter("hasta");

	        if (strDesde == null || strHasta == null || strDesde.isEmpty() || strHasta.isEmpty()) {
	            request.setAttribute("mensaje", "⚠ Debe seleccionar ambas fechas.");
	            request.setAttribute("tipoMensaje", "danger");
	            request.getRequestDispatcher("/JSP/admin/reportes.jsp").forward(request, response);
	            return;
	        }

	        // Convertir a java.sql.Date para el SP
	        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	        java.util.Date utilDesde = sdf.parse(strDesde);
	        java.util.Date utilHasta = sdf.parse(strHasta);

	        java.sql.Date sqlDesde = new java.sql.Date(utilDesde.getTime());
	        java.sql.Date sqlHasta = new java.sql.Date(utilHasta.getTime());

	        if (sqlHasta.before(sqlDesde)) {
	            request.setAttribute("mensaje", "⚠ La fecha 'Hasta' no puede ser anterior a la fecha 'Desde'.");
	            request.setAttribute("tipoMensaje", "danger");
	            request.getRequestDispatcher("/JSP/admin/reportes.jsp").forward(request, response);
	            return;
	        }

	        // Llamar al negocio → DAO → SP
	        ReporteNegocio reporteNegocio = new ReporteNegocio();
	        ReporteResultado resultado = reporteNegocio.generarReporte(sqlDesde, sqlHasta);

	        // Pasar datos a la vista
	        request.setAttribute("resultado", resultado);
	        request.setAttribute("desde", strDesde);
	        request.setAttribute("hasta", strHasta);

	        // Mensaje de éxito opcional
	        request.setAttribute("mensaje", "✅ Reporte generado con éxito.");
	        request.setAttribute("tipoMensaje", "success");

	        // Redireccionar al JSP con resultados
	        request.getRequestDispatcher("/JSP/admin/reportes.jsp").forward(request, response);

	    } catch (Exception e) {
	        e.printStackTrace();
	        request.setAttribute("mensaje", "❌ Error al procesar el reporte: " + e.getMessage());
	        request.setAttribute("tipoMensaje", "danger");
	        request.getRequestDispatcher("/JSP/admin/reportes.jsp").forward(request, response);
	    }
	}
	

}
