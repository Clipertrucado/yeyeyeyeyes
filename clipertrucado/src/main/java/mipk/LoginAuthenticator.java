package mipk;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import org.apache.jasper.tagplugins.jstl.core.Out;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginAuthenticator
 */
public class LoginAuthenticator extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginAuthenticator() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendRedirect("./index.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		beanDB db = new beanDB();
		HttpSession session = request.getSession();
		String usuario = request.getParameter("usuario");
		String pass = request.getParameter("pass");
		String query = "select email_Usuario, contrasenya_Usuario from Usuarios;";
		String[][] tablares = null;

		boolean okdb = false;
		boolean ok = false;

		try {
			db.conectarBD();
			okdb = true;
		} catch (Exception e) {
			okdb = false;
			// e.printStackTrace();
		}
		if (okdb) {
			try {
				tablares = db.resConsultaSelectA3(query);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if (usuario == null)
				usuario = "";
			if (pass == null)
				pass = "";

			if (tablares != null) {
				for (int i = 0; i < tablares.length; i++) { // g es una variable tipo grupo que va recorriendo la lista
					if (tablares[i][0].equals(usuario) & tablares[i][1].equals(pass)) {
						session.setAttribute("attributo2", usuario);
						session.setAttribute("attributo1", "1");
						ok = true;

					}

				}
			}
			db.desconectarBD();
		}

		if (ok) {
			response.sendRedirect("Catalogo.jsp");
		} else {

			response.sendRedirect("index.jsp");
		}

	}

}
