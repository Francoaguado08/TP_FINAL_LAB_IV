package controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import dao.IUsuarioDAO;
import daoImpl.ClienteDAOImpl;
import daoImpl.UsuarioDAOImpl;
import entidades.Cliente;
import entidades.Cuenta;
import entidades.CuentaListado;
import entidades.TipoCuenta;
import entidades.TipoUsuario;
import entidades.Usuario;
import negocioImpl.ClienteNegocio;
import negocioImpl.CuentaNegocio;

/**
 * Servlet implementation class CuentasServlet
 */
@WebServlet("/CuentasServlet")
public class CuentasServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CuentasServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
   
    
    private CuentaNegocio cuentaNegocio = new CuentaNegocio();
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Entró al doGet de CuentasServlet");  // <-- confirmá que se loguea
		
		 if(request.getParameter("Param")!=null)
		{
			String accion = request.getParameter("Param").toString();
			
			switch (accion) 
			{
				case "alta":
				{
					mostrarFormularioAlta(request, response);
					break;
				}
				case "lista":
				{
					
					String nroParam = request.getParameter("nCuenta");
					int nroCuenta = 0;
				    if (nroParam != null && !nroParam.isEmpty()) {
				        nroCuenta = Integer.parseInt(nroParam);
				    }
					String cuil = request.getParameter("cuil");
					if (cuil == null) {
						cuil = "";
					}
					
					
					
			        List<CuentaListado> cuentas;
			        
			        if (nroCuenta !=0 || !cuil.isEmpty()) {
			        	cuentas = cuentaNegocio.filtro(nroCuenta, cuil);
			        }else {
			        	cuentas = cuentaNegocio.listarTodos();
			        }
			        
			        request.setAttribute("listaCuentas", cuentas);
			        RequestDispatcher dispatcher = request.getRequestDispatcher("/JSP/admin/listarCuentas.jsp");
			        dispatcher.forward(request, response);
				    break;
				}
				case "eliminar":
				{
				    String nroParam = request.getParameter("nro");
				    if (nroParam != null) {
				        int nroCuenta = Integer.parseInt(nroParam);
				        boolean res =  cuentaNegocio.eliminar(nroCuenta);
				        if(res) {
				            response.sendRedirect("CuentasServlet?Param=lista&msg=eliminado");
				        } else {
				            response.sendRedirect("CuentassServlet?Param=lista&msg=error");
				        }
				 
				    }
				    break;
				}
				case "editar":
				{
					String idParam = request.getParameter("id");
					System.out.println("hola" + idParam);
					if (idParam != null) {
	                    int idCuenta = Integer.parseInt(idParam);
	                    request.setAttribute("cuenta", cuentaNegocio.obtenerPorNumeroCuenta(idCuenta));
	                    request.getRequestDispatcher("/JSP/admin/editarCuenta.jsp").forward(request, response);  
	                }
					break;
			
				}
				case "cuentasCli":
				{
					HttpSession sesion = request.getSession();
					Integer idCli = (Integer) sesion.getAttribute("IdCliente");
					if(idCli != null) { //agregar un exc?
						List<CuentaListado> cuentasCli = cuentaNegocio.cuentasPorCliente(idCli);
						request.setAttribute("listaCuentas", cuentasCli);
						request.getRequestDispatcher("/JSP/cliente/listarCuentas.jsp").forward(request, response); 
					}
					
					
				}
				case "obtener": // obtiene el Nro de cuenta desde el listado de cuentas (cliente)
				{
					String nroParam = request.getParameter("id");
					if (nroParam != null) {
	                    int nroCuenta = Integer.parseInt(nroParam);
	                    request.setAttribute("cuenta", cuentaNegocio.obtenerPorNumeroCuentaListado(nroCuenta));
	                    request.getRequestDispatcher("/JSP/cliente/menuCuenta.jsp").forward(request, response);  
	                }
					break;
				}
			}

		}
	}
		
	
		 
					
					// Solo mostrar mensaje si viene de un insert
				/*    String from = request.getParameter("from");
				    if (from != null && from.equals("insert")) {
				        mostrarFormularioAlta(request, response);
				    } else {
				        // Limpiar mensaje si es acceso directo al formulario
				        request.getSession().removeAttribute("mensaje");
				        mostrarFormularioAlta(request, response);
				    } 
		
	} */

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Obtenemos la acción (por ejemplo: insertar, eliminar, modificar)
		System.out.println("Entró al doPost de CuentasServlet");
				if(request.getParameter("accion")!=null) 
				{
					String accion = request.getParameter("accion").toString();
					
					switch (accion) 
					{
						case "insertar":
						{
							insertarCuenta(request, response);
							break;
						}
						case "modificar":
						{
							modificarCuenta(request, response);
							break;
						}
						
					}
					
				}
				
	}
	
	private void modificarCuenta(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException{
		
		Cuenta cuenta = construirCuentaDesdeRequest(request);
		
	    boolean resultado = cuentaNegocio.modificar(cuenta);

	    if (resultado) {
	        response.sendRedirect(request.getContextPath() + "/CuentasServlet?Param=lista&msg=modificar");
	    } else {
	        response.sendRedirect(request.getContextPath() + "/JSP/admin/editarCuenta.jsp?msg=errorModificar");
	    }
	}
	
	
	private Cuenta construirCuentaDesdeRequest(HttpServletRequest request) {
	    Cuenta cuenta = new Cuenta();
	    
	    try {
	        int nroCuenta = Integer.parseInt(request.getParameter("id"));
	        int idCliente = Integer.parseInt(request.getParameter("dni"));
	        String cbu = request.getParameter("cbu");
	        int codTipoCuenta = Integer.parseInt(request.getParameter("tipoCuenta"));

	        cuenta.setNroCuenta(nroCuenta);
	        cuenta.setIdCliente(idCliente);
	        cuenta.setCbu(cbu.trim());
	        cuenta.setCodTipoCuenta(codTipoCuenta);

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return cuenta;
	}

	
	
	private void mostrarFormularioAlta(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {

	    CuentaNegocio cuentaNegocio = new CuentaNegocio();
	    List<TipoCuenta> tiposCuenta = cuentaNegocio.listar();
	    
	    request.setAttribute("tiposCuenta", tiposCuenta);
	    System.out.println("Tipos de cuenta cargados: " + tiposCuenta.size());
	    
	    request.getRequestDispatcher("/JSP/admin/formularioCuentas.jsp").forward(request, response);
	}

	
	private void insertarCuenta(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idClienteStr = request.getParameter("idCliente"); // nuevo campo
	    String tipoCuentaStr = request.getParameter("tipoCuenta");
	    String cbu = request.getParameter("cbu");
	    String fechaStr = request.getParameter("fechaCreacion");

	    HttpSession session = request.getSession();

	    try {
	        // Validaciones básicas
	        if (idClienteStr == null || tipoCuentaStr == null || fechaStr == null ||
	            idClienteStr.isEmpty() || tipoCuentaStr.isEmpty() || fechaStr.isEmpty()) {
	            session.setAttribute("mensaje", "⚠ Todos los campos son obligatorios.");
	            response.sendRedirect(request.getContextPath() + "/CuentasServlet?Param=alta");

	            return;
	        }
	        
	        
	        // Parsear datos
	        int idCliente = Integer.parseInt(idClienteStr);
	        int codTipoCuenta = Integer.parseInt(tipoCuentaStr);
	        java.util.Date fechaUtil = new SimpleDateFormat("yyyy-MM-dd").parse(fechaStr);

	        //Generar el CBU
	        /*
	         * %08d = siempre van a ser 8 digitos, si pasamos del idCLiente 99 al 111 pasaríamos de 00000099 a 00000111
	         * %14d = siempre van a ser 14 digitos, si pasamos del N°Cuenta 99 al 111 pasaríamos de 00000000000099 a 00000000000111
	         * */
	        int proximoNCuenta = cuentaNegocio.obtenerProximoNumeroCuenta();
	        cbu = String.format("%08d%014d" ,idCliente, proximoNCuenta); 
	        
	        // Crear objeto Cuenta
	        Cuenta cuenta = new Cuenta(idCliente, codTipoCuenta, cbu, fechaUtil, 10000.00);

	        // Insertar cuenta
	        String mensaje = "";
	        boolean exito = false;
	        ClienteNegocio clienteNegocio = new ClienteNegocio();
	        Cliente cliente = clienteNegocio.obtenerPorId(idCliente);
	        
	        if(cliente != null) { // CHEQUEA QUE EL CLIENTE NO ESTE DADO DE BAJA PRIMERO 
		        CuentaNegocio cuentaNegocio = new CuentaNegocio();
		        
		        if(cuentaNegocio.clienteTieneTresCuentasActivas(idCliente)) 
		        {
		        	exito =  false;
		        	mensaje = " ⚠ EL CLIENTE YA TIENE 3 CUENTAS ACTIVAS.";
		        }
		        else {
		        	exito = cuentaNegocio.insertar(cuenta);
		        } 
	        
	        }
	        else {
	        	exito = false;
	        	mensaje =" Id de cliente inexistente o dado de baja";
	        }

	        if (exito) {
	            session.setAttribute("mensaje", "✅ Cuenta creada correctamente.");
	        } else {
	            session.setAttribute("mensaje", "❌ Error al crear la cuenta." + mensaje);
	        }

	    } catch (NumberFormatException e) {
	        session.setAttribute("mensaje", "❌ Datos numéricos inválidos.");
	        e.printStackTrace();
	    } catch (ParseException e) {
	        session.setAttribute("mensaje", "❌ Fecha de creación inválida.");
	        e.printStackTrace();
	    } catch (Exception e) {
	        session.setAttribute("mensaje", "❌ Error inesperado: " + e.getMessage());
	        e.printStackTrace();
	    }

	    response.sendRedirect(request.getContextPath() + "/CuentasServlet?Param=alta");

	}
	
    
}
