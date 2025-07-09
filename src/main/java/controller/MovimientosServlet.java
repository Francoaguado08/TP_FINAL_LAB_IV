package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.Movimiento;
import entidades.Cuenta;
import negocio.IMovimientoNegocio;
import negocio.ICuentaNegocio;
import negocioImpl.CuentaNegocio;
import negocioImpl.MovimientoNegocio;

/**
 * Servlet implementation class MovimientosServlet
 */
@WebServlet("/MovimientosServlet")
public class MovimientosServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	// Instancia de la capa de negocio que maneja la lógica de movimientos
	private ICuentaNegocio cuentaNegocio = new CuentaNegocio();
    
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
						int totalRegistros = movimientos.size();
						request.setAttribute("listaMovimientos", movimientos);
					}
					
					request.getRequestDispatcher("/JSP/cliente/movimientos.jsp").forward(request, response);
					break;
				}
				case "nuevaTransferencia":
				{
					
					String nParam = request.getParameter("nCuenta");
					if (nParam != null) {
	                    int nCuenta = Integer.parseInt(nParam);
	                    request.setAttribute("cuenta", cuentaNegocio.obtenerPorNumeroCuentaListado(nCuenta));
	                    request.getRequestDispatcher("/JSP/cliente/transferencia.jsp").forward(request, response);  
	                }
				    break;
				}
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(request.getParameter("Param")!=null) 
		{
			String accion = request.getParameter("Param").toString();
			
			switch (accion) 
			{
				case "transferir":
				{
					String paramDestino = request.getParameter("destino");
				    String paramCuentaOrigen = request.getParameter("nCuentaOrigen");
				    String paramImporte = request.getParameter("suma");
				    
				    int nroCuentaDestino = -1;
				    int nroCuentaOrigen = -1;
				    double importe = 0;
				    
				    //es para tomar el nroCuenta a partir del cbu
				    ICuentaNegocio cuentaNeg = new CuentaNegocio();

				    try {
				        if (paramCuentaOrigen != null) {
				            nroCuentaOrigen = Integer.parseInt(paramCuentaOrigen);
				        }

				        if (paramImporte != null) {
				            importe = Double.parseDouble(paramImporte);
				        }

				        if (paramDestino != null) {
				            try {
				                nroCuentaDestino = Integer.parseInt(paramDestino);
				            } catch (NumberFormatException e) {
				            	//si entra aca, tengo que buscar con el CBU
				                Cuenta cuentaDest = cuentaNeg.obtenerPorCBU(paramDestino);
				                if (cuentaDest != null) {
				                    nroCuentaDestino = cuentaDest.getNroCuenta();
				                }
				            }
				        }
				        
				        // Validar datos antes de ejecutar
				        if (nroCuentaOrigen > 0 && nroCuentaDestino > 0 && importe > 0) {
				        	int resultado = movimientoNegocio.transferencia(nroCuentaOrigen, nroCuentaDestino, importe);
				        	String msg = "";

				        	switch (resultado) {
				        	    case 0:
				        	        msg = "ok";
				        	        break;
				        	    case 1:
				        	        msg = "cuentaOrigenInexistente";
				        	        break;
				        	    case 2:
				        	        msg = "cuentaDestinoInexistente";
				        	        break;
				        	    case 3: //este es por las dudas, pero el html ya lo valida
				        	        msg = "importeInvalido";
				        	        break;
				        	    case 4: 
				        	        msg = "saldoInsuficiente";
				        	        break;
				        	    case 5:
				        	    	msg = "mismaCuenta";
				        	    	break;
				        	    default:
				        	        msg = "falloTransferencia";
				        	        break;
				        	}
				        	response.sendRedirect("MovimientosServlet?Param=nuevaTransferencia&nCuenta=" + nroCuentaOrigen + "&msg=" + msg);
				        }
				        	
				    } catch (Exception e) {
				        e.printStackTrace();
				        response.sendRedirect("MovimientosServlet?Param=nuevaTransferencia&nCuenta=" + nroCuentaOrigen + "&msg=excepcion");
				    }
				    
					break;
				}
				
			}
			
		}
		
		
	}

}
