//package com.servlets;
//
//import java.io.IOException;
//import java.util.Date;
//
//import javax.servlet.ServletException;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//import org.hibernate.Session;
//import org.hibernate.Transaction;
//
//import com.dao.UserDao;
//import com.entities.Note;
//import com.entities.Register;
//import com.helper.FactoryProvider;
//
///**
// * Servlet implementation class RegisterServlet
// */
//public class RegisterServlet extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//
//	
//	public RegisterServlet() {
//		super();
//		
//	}
//
//	protected void doPost(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//
//		try {
//
//			String name = request.getParameter("Name");
//
//			String email = request.getParameter("email");
//
//			String password = request.getParameter("password");
//			
//			HttpSession httpsession = request.getSession();
//			
//			UserDao userdao = new UserDao(FactoryProvider.getFactory());
//			
//			Register confirmUser = userdao.getUserByEmailAndPassword(email, password);
//			
//			System.out.println("tha value is "+confirmUser);
//			
//			if(confirmUser == null) {
//				
//				Register register = Register.getInstance();
//				register.setEmail(email);
//				register.setName(name);
//				register.setPassword(password);
//				
//				
//				System.out.println(register);
//
//				Session session = FactoryProvider.getFactory().openSession();
//
//				Transaction tx = session.beginTransaction();
//
//				session.save(register);
//
//				tx.commit();
//
//				session.close();
//				
//				
//				
//			}else {
//				
//				httpsession.setAttribute("newmessage", "User already exist");
//				
//				response.sendRedirect("Register.jsp");
//				
//				return;
//				
//			}
//			
////			request.setAttribute("newres", register);
//
//			httpsession.setAttribute("message", "User register successfully");
//
//			response.sendRedirect("index.jsp");
//
//		} catch (Exception e) {
//			// TODO: handle exception
//			e.printStackTrace();
//		}
//
//	}
//
//}


package com.servlets;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.dao.UserDao;
import com.dao.UserDaoImpl;
import com.entities.Note;
import com.entities.Register;
import com.helper.FactoryProvider;

/**
 * Servlet implementation class RegisterServlet
 */
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public RegisterServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String name = request.getParameter("Name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            HttpSession httpsession = request.getSession();
            
//          checking if the user already exist
            UserDao userdao = new UserDaoImpl(FactoryProvider.getFactory());
//          if confirmuser is Null then the user doesn't exist
            Register confirmUser = userdao.getUserByEmailAndPassword(email, password);

            System.out.println("The value is: " + confirmUser);

            if (confirmUser == null) {
                Register register = Register.getInstance();
                register.setEmail(email);
                register.setName(name);
                register.setPassword(password);

                System.out.println(register);

                // Creating a new thread to handle the database transaction
               userdao.saveRegister(register);

            } else {
                httpsession.setAttribute("newmessage", "User already exists");
                response.sendRedirect("Register.jsp");
                return;
            }

            httpsession.setAttribute("message", "User registered successfully");
            response.sendRedirect("index.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}

