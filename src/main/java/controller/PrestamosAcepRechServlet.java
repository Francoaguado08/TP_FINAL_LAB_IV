package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.Cuota;
import entidades.Prestamo;
import negocioImpl.PrestamoNegocio;

/**
 * Servlet implementation class PrestamosAcepRechServlet
 */
@WebServlet("/PrestamosAcepRechServlet")
public class PrestamosAcepRechServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PrestamosAcepRechServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Cuota c = new Cuota();
		PrestamoNegocio p = new PrestamoNegocio();
		String param = request.getParameter("Param");		
		if(param != null && !param.isEmpty()) {
			switch(param) {
			case "click":
				List<Prestamo> lp = p.prestamosEspera();
				request.setAttribute("listaP", lp);
				request.getRequestDispatcher("/JSP/admin/solicitudesPrestamo.jsp").forward(request, response);
				break;
			
			
			case "aprobar":
				int idCliente = Integer.parseInt(request.getParameter("id"));
				String cuenta = request.getParameter("cuenta");
		        double saldo = Double.parseDouble(request.getParameter("saldo"));
		        int idPrestamo = Integer.parseInt(request.getParameter("prestamo"));
		        double montoMensual = Double.parseDouble(request.getParameter("mensual"));
				int cuotas = Integer.parseInt(request.getParameter("cuotas"));
				boolean exito = p.acreditarPrestamo(saldo, idCliente, cuenta);
				boolean exito2 = p.estadoPrestamo(idCliente, idPrestamo);
				for (int i = 1; i <= cuotas; i++) {
				    c.setEstado(true);
				    c.setIdPrestamo(idPrestamo);
				    c.setMonto(montoMensual);
				    c.setNroCuota(i);
				    p.agregarCuota(c);
				}

				if (exito && exito2) {
				    request.setAttribute("mensaje", "Prestamo aprobado, cuotas generadas y acreditado correctamente");
				} else {
				    request.setAttribute("error", "Error al acreditar el prestamo");
				}
				List<Prestamo> l = p.prestamosEspera();
				request.setAttribute("listaP", l);
				request.getRequestDispatcher("/JSP/admin/solicitudesPrestamo.jsp").forward(request, response);
				break;
			
			}			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
