package controller;

import java.io.IOException;
import java.lang.ProcessBuilder.Redirect;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entidades.Cuenta;
import entidades.Prestamo;
import negocioImpl.PrestamoNegocio;

/**
 * Servlet implementation class PrestamosServlet
 */
@WebServlet("/PrestamosServlet")
public class PrestamosServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PrestamosServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrestamoNegocio p = new PrestamoNegocio();
		String param = request.getParameter("Param");		
		if(param != null && !param.isEmpty()) {
		    HttpSession session = request.getSession(false);
		    if(session != null && session.getAttribute("IdCliente") != null) {
		        int idCliente = (Integer) session.getAttribute("IdCliente");
		        try {
		            List<Cuenta> listaCuentas = p.misCuentas(idCliente);
		            request.setAttribute("listacuentas", listaCuentas);
		            request.getRequestDispatcher("/JSP/cliente/solicitudPrestamo.jsp").forward(request, response);
		        } catch(Exception e) {
		            e.printStackTrace();
		        }
		    } else {
		        response.sendRedirect("/JSP/login.jsp"); //esto se podria trabajar mejor.
		    }
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Prestamo p = new Prestamo();
		PrestamoNegocio n = new PrestamoNegocio();
		
		if(request.getParameter("btnSolicitar")!=null) {
			 HttpSession session = request.getSession(false);
			    if(session != null && session.getAttribute("IdCliente") != null) {
			    	int idCliente = (Integer) session.getAttribute("IdCliente");
			    	Date fecha = new Date();
			    	double sumaSol = Double.parseDouble(request.getParameter("suma"));;
			    	double aPagar = sumaSol+(sumaSol*0.12);
			    	int mesesPrestamo= Integer.parseInt(request.getParameter("cuotas"));;
			    	double cuotas = aPagar/mesesPrestamo;
			    	boolean estado = false;
			    	String cuentaRprest = (String)request.getParameter("cuenta");
			    	
			    	try {
			    		p.setIdCliente(idCliente);
			    		p.setFecha(fecha);
			    		p.setImportePedido(sumaSol);
			    		p.setImporteAPagar(aPagar);
			    		p.setPlazoPagoMeses(mesesPrestamo);
			    		p.setMontoPorMes(cuotas);
			    		p.setCuentaDepositar(cuentaRprest);
			    		p.setEstado(estado);
			    		
			    		boolean exito = n.solPrestamo(p);
			    		
			    		if(exito) {
			    	        request.setAttribute("mensaje", "Prestamo solicitado correctamente");
			            } else {
			                request.setAttribute("error", "No se pudo registrar el prestamo");
			            }		    		
			    	}catch(Exception e) {
			    		e.printStackTrace();
			    	}
			    }
			    int idCliente = (Integer) session.getAttribute("IdCliente");
			    List<Cuenta> cuentas = n.misCuentas(idCliente);
			    request.setAttribute("listacuentas", cuentas);
			    request.getRequestDispatcher("/JSP/cliente/solicitudPrestamo.jsp").forward(request, response);	
		}
	}

}
