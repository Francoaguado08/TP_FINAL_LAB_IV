package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		PrestamoNegocio p = new PrestamoNegocio();
		String param = request.getParameter("Param");		
		if(param != null && !param.isEmpty()) {
			try {
				List<Prestamo> lp = p.prestamosEspera();
				request.setAttribute("listaP", lp);
				request.getRequestDispatcher("/JSP/admin/solicitudesPrestamo.jsp").forward(request, response);
			}catch(Exception e) {
				e.printStackTrace();
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
