package com.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entities.Register;

public class LogoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public LogoutServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            Register res = (Register)session.getAttribute("register1");
            System.out.println(res);
            session.removeAttribute("register1"); // Remove the user object from session
            Register res1 = (Register)session.getAttribute("register1");
            System.out.println(res1);
//            session.invalidate(); // Invalidate the session

            // Redirect to the login page with a success message
            session.setAttribute("message", "Logged out successfully");
            response.sendRedirect("index.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
