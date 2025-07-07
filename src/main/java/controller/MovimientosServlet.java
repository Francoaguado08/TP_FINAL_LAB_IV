package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.Movimiento;
import negocio.IClienteNegocio;
import negocio.IMovimientoNegocio;
import negocioImpl.ClienteNegocio;
import negocioImpl.MovimientoNegocio;

/**
 * Servlet implementation class MovimientosServlet
 */
@WebServlet("/MovimientosServlet")
public class MovimientosServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	// Instancia de la capa de negocio que maneja la lógica de movimientos
	private IClienteNegocio clienteNegocio = new ClienteNegocio();
    
	private IMovimientoNegocio movimientoNegocio = new MovimientoNegocio();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MovimientosServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("Param")!=null)
		{
			String accion = request.getParameter("Param").toString();
			
			switch (accion) 
			{
				case "lista":
				{
					String nParam = request.getParameter("nCuenta");
					
					if(nParam != null) {
						int nCuenta = Integer.parseInt(nParam);
						List<Movimiento> movimientos = movimientoNegocio.listarPorNumeroCuenta(nCuenta);
						
						request.setAttribute("listaMovimientos", movimientos);
					}
					
					request.getRequestDispatcher("/JSP/cliente/movimientos.jsp").forward(request, response);
					break;
				}
				case "nuevaTransferencia":
				{
				
					break;
				}
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
