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
import entidades.Cuenta;
import negocio.IClienteNegocio;
import negocio.IMovimientoNegocio;
import negocio.ICuentaNegocio;
import negocioImpl.CuentaNegocio;
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
				            boolean exito = movimientoNegocio.transferencia(nroCuentaOrigen, nroCuentaDestino, importe);
				            if (exito) {
				                response.sendRedirect("CuentasServlet?Param=seleccionCuenta&id=" + nroCuentaOrigen + "&msg=ok");
				            } else {
				                response.sendRedirect("CuentasServlet?Param=seleccionCuenta&id=" + nroCuentaOrigen + "&msg=error");
				            }
				        } else {
				            response.sendRedirect("CuentasServlet?Param=seleccionCuenta&id=" + nroCuentaOrigen + "&msg=paramError");
				        }
				    } catch (Exception e) {
				        e.printStackTrace();
				        response.sendRedirect("CuentasServlet?Param=seleccionCuentar&id=" + nroCuentaOrigen + "&msg=excepcion");
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
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
