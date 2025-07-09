package controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entidades.Cuenta;
import entidades.Cuota;
import negocioImpl.CuotasNegocio;
import negocioImpl.PrestamoNegocio;

/**
 * Servlet implementation class CuotasServlet
 */
@WebServlet("/CuotasServlet")
public class CuotasServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CuotasServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    private PrestamoNegocio p = new PrestamoNegocio();
    private CuotasNegocio c = new CuotasNegocio();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String param = request.getParameter("Param");
		
		if(param != null && !param.isEmpty()) {
		    HttpSession session = request.getSession(false);
		    if(session != null && session.getAttribute("IdCliente") != null) {
		        int idCliente = (Integer) session.getAttribute("IdCliente");
		        try {
		        	List<Cuenta> listaCuentas = p.misCuentas(idCliente);
		        	List<Cuota> listaCuotas = c.obtenerCuotas(idCliente);
		            request.setAttribute("listacuentas", listaCuentas);
		            request.setAttribute("listacuotas", listaCuotas);
		            request.getRequestDispatcher("/JSP/cliente/pagoCuotas.jsp").forward(request, response);
		        	}catch(Exception e){
		        		e.printStackTrace();
		        	}
		        
		        
	}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (request.getParameter("click") != null) {
	        HttpSession session = request.getSession(false);
	        if (session != null && session.getAttribute("IdCliente") != null) {
	            int idCliente = (Integer) session.getAttribute("IdCliente");

	            boolean pagoExitoso = false;

	            try {
	                Date fecha = new Date();
	                int idPrestamo = Integer.parseInt(request.getParameter("idPrestamo"));
	                int nroCuota = Integer.parseInt(request.getParameter("nroCuota"));
	                double monto = Double.parseDouble(request.getParameter("monto"));
	                String cuentaSeleccionada = request.getParameter("cuentaSeleccionada");

	                pagoExitoso = c.pagoCuota(nroCuota, idPrestamo, cuentaSeleccionada, fecha, monto, idCliente);

	            } catch (Exception e) {
	                e.printStackTrace();
	                request.setAttribute("mensajeError", "Ocurrió un error al procesar el pago");
	            }

	            if (pagoExitoso) {
	                List<Cuota> l = c.obtenerCuotas(idCliente);  
	                List<Cuenta> lc = p.misCuentas(idCliente);

	                request.setAttribute("listacuotas", l);
	                request.setAttribute("listacuentas", lc);
	                request.setAttribute("mensajeExito", "Pago realizado correctamente");
	            } else {
	                request.setAttribute("mensajeError", "No se pudo procesar el pago");
	            }

	            RequestDispatcher rd = request.getRequestDispatcher("/JSP/cliente/pagoCuotas.jsp"); 
	            rd.forward(request, response);
	        }
	    }
	}
	
	
	
}
