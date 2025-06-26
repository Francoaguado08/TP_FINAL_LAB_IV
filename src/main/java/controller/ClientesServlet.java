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
					request.setAttribute("listaClientes", clienteNegocio.listar());
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
		System.out.println(cliente.getUsuario().getUser());
	    boolean resultado = clienteNegocio.modificar(cliente);

	    if (resultado) {
	        response.sendRedirect(request.getContextPath() + "/ClientesServlet?Param=lista");
	    } else {
	        //request.setAttribute("mensaje", "No se pudo actualizar el cliente.");
	        response.sendRedirect(request.getContextPath() + "/JSP/admin/editarCliente.jsp");
	    }
		
	}
	
	
	
	private void insertarCliente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    
	    String dni = request.getParameter("dni");
	    String cuil = request.getParameter("cuil");
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

	    if (!password.equals(confirmPassword)) {
	        HttpSession session = request.getSession();
	        session.setAttribute("mensaje", "⚠ Las contraseñas no coinciden.");
	        response.sendRedirect(request.getContextPath() + "/JSP/admin/formularioClientes.jsp");
	        return;
	    }

	    try {
	        Usuario usuario = new Usuario();
	        usuario.setUser(username);
	        usuario.setContrasena(password);
	        usuario.setTipoUsuario(new TipoUsuario(2, "cliente")); // ID 2 = Cliente

	        IUsuarioDAO usuarioDAO = new UsuarioDAOImpl();
	        int idUsuario = usuarioDAO.insertar(usuario);

	        if (idUsuario <= 0) {
	            HttpSession session = request.getSession();
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

	        boolean exito = clienteNegocio.insertar(cliente);

	        HttpSession session = request.getSession();
	        if (exito) {
	            session.setAttribute("mensaje", " Cliente registrado correctamente.");
	        } else {
	            session.setAttribute("mensaje", " Hubo un error al registrar el cliente.");
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	        HttpSession session = request.getSession();
	        session.setAttribute("mensaje", "Error inesperado: " + e.getMessage());
	    }

	    response.sendRedirect(request.getContextPath() + "/JSP/admin/formularioClientes.jsp");
	}
	
	
	
	private Cliente construirClienteDesdeRequest(HttpServletRequest request) {
	    Cliente cliente = new Cliente();

	    cliente.setIdCliente(Integer.parseInt(request.getParameter("id")));
	    cliente.setDni(request.getParameter("dni"));
	    cliente.setCuil(request.getParameter("cuil"));
	    cliente.setNombre(request.getParameter("nombre"));
	    cliente.setApellido(request.getParameter("apellido"));
	    cliente.setSexo(request.getParameter("sexo"));
	    cliente.setNacionalidad(request.getParameter("nacionalidad"));
	    cliente.setDireccion(request.getParameter("direccion"));
	    cliente.setLocalidad(request.getParameter("localidad"));
	    cliente.setProvincia(request.getParameter("provincia"));
	    cliente.setCorreoElectronico(request.getParameter("email"));
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
	    user.setIdUsuario(user.getIdUsuario());
	    user.setUser(request.getParameter("usuario"));
	    user.setContrasena(request.getParameter("password"));
	    user.setTipoUsuario(new TipoUsuario(2, "cliente"));
	    
	    cliente.setUsuario(user);

	    return cliente;
	}

	
	
	
	
	
	
	
	
     }
