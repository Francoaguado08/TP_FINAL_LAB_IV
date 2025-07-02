package controller;

import java.io.IOException;
import java.lang.ProcessBuilder.Redirect;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entidades.Cuenta;
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
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
