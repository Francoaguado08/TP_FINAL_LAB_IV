package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//  usar GET para listar clientes, por ejemplo
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Obtenemos la acción (por ejemplo: insertar, eliminar, modificar)
		String accion = request.getParameter("accion");

		// Si la acción es "insertar", llamamos al método insertarCliente()
		if ("insertar".equals(accion)) {
			insertarCliente(request, response);
		}
	}

	
	
	private void insertarCliente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    
	    // 1. Obtener parámetros del formulario
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

	    // 2. Verificar contraseñas
	    if (!password.equals(confirmPassword)) {
	        request.setAttribute("mensaje", "⚠ Las contraseñas no coinciden.");
	        request.getRequestDispatcher("/JSP/admin/formularioClientes.jsp").forward(request, response);
	        return;
	    }

	    
	    System.out.println("=== [INFO] Iniciando alta de cliente ===");
	    
	    try {
	        
	    	
	    	
	    	// 3. Crear objeto Usuario
	        Usuario usuario = new Usuario();
	        usuario.setUser(username);
	        usuario.setContrasena(password);
	        usuario.setTipoUsuario(new TipoUsuario(2, "Cliente")); // Tipo 2: Cliente

	        System.out.println("-> Usuario a insertar:");
	        System.out.println("   Username: " + usuario.getUser());
	        System.out.println("   TipoUsuario: " + usuario.getTipoUsuario().getCodTipoUsuario());
	        
	        // 4. Insertar usuario y obtener ID generado
	        System.out.println("-> Intentando insertar usuario...");
	        IUsuarioDAO usuarioDAO = new UsuarioDAOImpl();
	        int idUsuario = usuarioDAO.insertar(usuario);
	        System.out.println("-> ID generado por la BD: " + idUsuario);

	        if (idUsuario <= 0) {
	            request.setAttribute("mensaje", "❌ No se pudo registrar el usuario.");
	            request.getRequestDispatcher("/JSP/admin/formularioClientes.jsp").forward(request, response);
	            return;
	        }

	        
	        System.out.println("-> Insertando cliente con ID_Usuario: " + usuario.getIdUsuario());
	        
	        // 5. Crear objeto Cliente
	        usuario.setIdUsuario(idUsuario); // vincular el ID generado
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

	        // 6. Insertar cliente
	        boolean exito = clienteNegocio.insertar(cliente);

	        if (exito) {
	            request.setAttribute("mensaje", "✅ Cliente registrado correctamente.");
	        } else {
	            request.setAttribute("mensaje", "❌ Hubo un error al registrar el cliente.");
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	        request.setAttribute("mensaje", "❌ Error inesperado: " + e.getMessage());
	    }

	    // 7. Redireccionar con mensaje
	    request.getRequestDispatcher("/JSP/admin/formularioClientes.jsp").forward(request, response);
	}
	
	
	
	
	
	
	
     }
