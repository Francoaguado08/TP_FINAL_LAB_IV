package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import negocioImpl.LoginNegocio;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user = request.getParameter("usuario");
		String pass = request.getParameter("clave");
		LoginNegocio l = new LoginNegocio();
		try {
	        String tipoUsuario = l.validarUsuarioYTipo(user, pass);
	        if (tipoUsuario != null) {
	        	/*int idCliente = l.ObtenerIdCliente(user, pass);
	        	HttpSession sesCli = request.getSession();
	        	sesCli.setAttribute("IdCliente", idCliente);*/
	            HttpSession session = request.getSession();
	            session.setAttribute("usuario", user);
	            switch (tipoUsuario.toLowerCase()) {
	                case "cliente":
	                	response.sendRedirect(request.getContextPath() + "/JSP/cliente/menuCliente.jsp");
	                    break;
	                case "admin":
	                    response.sendRedirect(request.getContextPath() + "/JSP/admin/menuAdmin.jsp");
	                    break; 
	            }
	        } else {
	            request.setAttribute("error", "Credenciales invalidas");
	            request.getRequestDispatcher("/JSP/login.jsp").forward(request, response);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        request.setAttribute("error", "Error en el servidor");
	        request.getRequestDispatcher("/JSP/login.jsp").forward(request, response);	   
	        }
	}
	
	}

