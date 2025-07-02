package controller;

import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entidades.Cliente;
import entidades.Usuario;
import entidades.TipoUsuario;
import negocio.IClienteNegocio;
import negocioImpl.ClienteNegocio;
import dao.IUsuarioDAO;
import daoImpl.UsuarioDAOImpl;



@WebServlet("/ClientesServlet") // Mapea este servlet a la URL /ClientesServlet
public class ClientesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// Instancia de la capa de negocio que maneja la lógica de cliente
	private IClienteNegocio clienteNegocio = new ClienteNegocio();

	// Constructor
	public ClientesServlet() {
		super();
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		//  usar GET para listar clientes, por ejemplo 
		if(request.getParameter("Param")!=null)
		{
			String accion = request.getParameter("Param").toString();
			
			switch (accion) 
			{
				case "lista":
				{
					String dni = request.getParameter("dni");
					String usuario = request.getParameter("usuario");
					//if((dni!=null && !dni.isEmpty()) || (usuario !=null && !usuario.isEmpty())) {
						//request.setAtribute("listaClientes", clienteNegocio.filtrar(dni, usuario));
					//}else {
						request.setAttribute("listaClientes", clienteNegocio.listar());
					//}
				
					RequestDispatcher dispatcher = request.getRequestDispatcher("/JSP/admin/listarClientes.jsp");
					dispatcher.forward(request, response);
					break;
				}
				case "editar":
				{
					String idParam = request.getParameter("id");
					if (idParam != null) {
	                    int idCliente = Integer.parseInt(idParam);
	                    request.setAttribute("cliente", clienteNegocio.obtenerPorId(idCliente));
	                    RequestDispatcher dispatcherEditar = request.getRequestDispatcher("/JSP/admin/editarCliente.jsp");
	                    dispatcherEditar.forward(request, response);  
	                }
					break;
				}
				case "eliminar":
				{
				    String idParam = request.getParameter("id");
				    if (idParam != null) {
				        int idCliente = Integer.parseInt(idParam);
				        boolean res =  clienteNegocio.eliminar(idCliente);
				 
				        if(res) {
				            response.sendRedirect("ClientesServlet?Param=lista&msg=eliminado");
				        } else {
				            response.sendRedirect("ClientesServlet?Param=lista&msg=error");
				        }
				    }
				    break;
				}

			}		
		}
	}
	
	


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		// Obtenemos la acción (por ejemplo: insertar, eliminar, modificar)
		
		if(request.getParameter("accion")!=null) {
			String accion = request.getParameter("accion").toString();
			
			switch (accion) 
			{
				case "insertar":
				{
					insertarCliente(request, response);
					break;
				}
				case "modificar":
				{
					modificarCliente(request, response);
					break;
				}
			
			
			}
			
			
		}
		
		
	}

	
	private void modificarCliente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	    Cliente cliente = construirClienteDesdeRequest(request);
		
	    boolean resultado = clienteNegocio.modificar(cliente);

	    if (resultado) {
	        response.sendRedirect(request.getContextPath() + "/ClientesServlet?Param=lista&msg=modificar");
	    } else {
	        response.sendRedirect(request.getContextPath() + "/JSP/admin/editarCliente.jsp?msg=errorModificar");
	    }

		
	}
	
	
	
	private void insertarCliente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    
	    String dni = request.getParameter("dni");
	    String cuil = request.getParameter("cuilPrefijo") + request.getParameter("cuilDni") + request.getParameter("cuilVerificador");
	    String nombre = request.getParameter("nombre");
	    String apellido = request.getParameter("apellido");
	    String sexo = request.getParameter("sexo");
	    String nacionalidad = request.getParameter("nacionalidad");
	    String fechaNacimientoStr = request.getParameter("fechaNacimiento");
	    String direccion = request.getParameter("direccion");
	    String provincia = request.getParameter("provincia");
	    String localidad = request.getParameter("localidad");
	    String email = request.getParameter("email");
	    String telefono = request.getParameter("telefono");
	    String username = request.getParameter("username");
	    String password = request.getParameter("password");
	    String confirmPassword = request.getParameter("confirmPassword");
	    
        HttpSession session = request.getSession();

	    if (!password.equals(confirmPassword)) {
	        session.setAttribute("mensaje", "⚠ Las contraseñas no coinciden.");
	        response.sendRedirect(request.getContextPath() + "/JSP/admin/formularioClientes.jsp");
	        return;
	    }

	    try {
	        Usuario usuario = new Usuario();
	        usuario.setUser(username);
	        usuario.setContrasena(password);
	        usuario.setTipoUsuario(new TipoUsuario(1, "cliente")); // ID 1 = cliente

	        IUsuarioDAO usuarioDAO = new UsuarioDAOImpl();
	        int idUsuario = usuarioDAO.insertar(usuario);

	        if (idUsuario <= 0) {
	            session.setAttribute("mensaje", "❌ No se pudo registrar el usuario.");
	            response.sendRedirect(request.getContextPath() + "/JSP/admin/formularioClientes.jsp");
	            return;
	        }

	        usuario.setIdUsuario(idUsuario);

	        Cliente cliente = new Cliente();
	        cliente.setDni(dni);
	        cliente.setCuil(cuil);
	        cliente.setNombre(nombre);
	        cliente.setApellido(apellido);
	        cliente.setSexo(sexo);
	        cliente.setNacionalidad(nacionalidad);
	        cliente.setFechaNacimiento(java.sql.Date.valueOf(fechaNacimientoStr));
	        cliente.setDireccion(direccion);
	        cliente.setProvincia(provincia);
	        cliente.setLocalidad(localidad);
	        cliente.setCorreoElectronico(email);
	        cliente.setTelefono(telefono);
	        cliente.setUsuario(usuario);

	        boolean exito = validarDatos(cliente, request);
	        
	        if (exito) {
	        	clienteNegocio.insertar(cliente);
	            session.setAttribute("mensaje-AltaCliente", " Cliente registrado correctamente.");
	        } else {
	            session.setAttribute("mensaje-AltaCliente", " Hubo un error al registrar el cliente: " + session.getAttribute("mensaje-AltaCliente"));
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	        session.setAttribute("mensaje-AltaCliente", "Error inesperado: " + e.getMessage());
	    }

	    response.sendRedirect(request.getContextPath() + "/JSP/admin/formularioClientes.jsp");
	}
	
	
	
	private Cliente construirClienteDesdeRequest(HttpServletRequest request) {
	    Cliente cliente = new Cliente();

	    cliente.setIdCliente(Integer.parseInt(request.getParameter("id")));
	    cliente.setDni(request.getParameter("dni"));
	    cliente.setCuil(request.getParameter("cuil"));
	    cliente.setNombre(request.getParameter("nombre").trim());
	    cliente.setApellido(request.getParameter("apellido").trim());
	    cliente.setSexo(request.getParameter("sexo"));
	    cliente.setNacionalidad(request.getParameter("nacionalidad"));
	    cliente.setDireccion(request.getParameter("direccion"));
	    cliente.setLocalidad(request.getParameter("localidad"));
	    cliente.setProvincia(request.getParameter("provincia"));
	    cliente.setCorreoElectronico(request.getParameter("email").trim());
	    cliente.setTelefono(request.getParameter("telefono"));
	    cliente.setEstado(true);

	    // Parseo de fecha
	    try {
	        String fecha = request.getParameter("fechaNacimiento");
	        if (fecha != null && !fecha.isEmpty()) {
	            SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
	            cliente.setFechaNacimiento(formato.parse(fecha));
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    // Datos de Usuario
	    Usuario user = new Usuario();
	    user.setIdUsuario(Integer.parseInt(request.getParameter("idUsuario")));
	    user.setUser(request.getParameter("usuario"));
	    user.setContrasena(request.getParameter("password"));
	    user.setTipoUsuario(new TipoUsuario(1, "cliente"));
	    
	    cliente.setUsuario(user);

	    return cliente;
	}
	
	private boolean validarDatos(Cliente cliente, HttpServletRequest request){	//Cliente para verificar los datos cargados, Request para los mensajes en session
		HttpSession session = request.getSession();
		
		if(clienteNegocio.existeCliente(cliente.getDni() )) {	//Valida que el cliente no exista
			session.setAttribute("mensaje-AltaCliente", " DNI ya registrado.");
			return false;
		}	
		
		if(cliente.getDni().length() < 8 || !cliente.getDni().matches("[0-9]+")) {	//Valida que el DNI tenga 8 caracteres y que sean solo números
			session.setAttribute("mensaje-AltaCliente", " DNI inválido.");
			return false;
		}
		
		if(cliente.getCuil().length() < 11 || !cliente.getCuil().matches("[0-9]+")) { //Valida que el CUIL tenga 11 caracteres y que sean solo números
			session.setAttribute("mensaje-AltaCliente", " CUIL inválido.");
			return false;
		}
		
		
		return true;
	}

	
	
	
	
	
	
     }
