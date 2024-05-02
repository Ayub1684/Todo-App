package com.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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

public class SaveNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SaveNoteServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {

//			getting the register id from Add_note.jsp to get the Object of Register class

//			int resid = Integer.parseInt(request.getParameter("regid").trim());

			String title = request.getParameter("title");

			String content = request.getParameter("content");

			HttpSession httpsession = request.getSession();

//			getting the object of Register class from login servlet

			Register User = (Register) httpsession.getAttribute("register1");
//			Register newres = (Register)httpsession.getAttribute("newres");
			
			UserDao userdao = new UserDaoImpl(FactoryProvider.getFactory());

			System.out.println("this is an id" + User.getId());

			Note note = Note.getInstance();
			note.setContent(content);
			note.setTitle(title);
			note.setDate(new Date());
			note.setRegister(User);

			List<Note> list = new ArrayList();
			list.add(note);

			User.setNote(list);

            userdao.saveNote(note);
			
			response.sendRedirect("Show_notes.jsp");

//			Register resi = session.get(Register.class, resid);


			
//			session.save(User);

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}