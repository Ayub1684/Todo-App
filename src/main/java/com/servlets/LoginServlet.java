package com.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.result.Output;

import com.dao.UserDaoImpl;
import com.entities.Register;
import com.helper.FactoryProvider;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public LoginServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			String email = request.getParameter("email").trim();
			
			String password = request.getParameter("password").trim();
			
			UserDaoImpl userdao = new  UserDaoImpl(FactoryProvider.getFactory());
			
			Register register = userdao.getUserByEmailAndPassword(email, password);
					
			HttpSession httpsession = request.getSession();

			
			if(register == null){
				httpsession.setAttribute("message", "Wrong Email or password");
				response.sendRedirect("index.jsp");
			}else {
				httpsession.setAttribute("message", "User register successfully");
				httpsession.setAttribute("register1", register);
				response.sendRedirect("Add_notes.jsp");
				
				
//				httpsession.setAttribute("id", resid);
//				response.sendRedirect("Add_notes.jsp");
				
//				request.getRequestDispatcher("Add_notes.jsp").forward(request, response);
			}
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
