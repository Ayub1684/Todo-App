package com.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.entities.Note;
import com.entities.Register;
import com.helper.FactoryProvider;

public class UserDaoImpl implements UserDao {
	
	 private SessionFactory sessionFactory;

	    public UserDaoImpl(SessionFactory sessionFactory) {
	        this.sessionFactory = sessionFactory;
	    }

	public void saveRegister(final Register register) {
		// TODO Auto-generated method stub
		
		 Thread dbThread = new Thread(new Runnable() {
             public void run() {
                 Session session = FactoryProvider.getFactory().openSession();
                 Transaction tx = null;
                 try {
                     tx = session.beginTransaction();
                     session.save(register);
                     tx.commit();
                 } catch (Exception e) {
                     if (tx != null)
                         tx.rollback();
                     e.printStackTrace();
                 } finally {
                     session.close();
                 }
             }
         });
         dbThread.start();
		
	}
	
	public void saveNote(final Note note) {
		// TODO Auto-generated method stub
		// Creating a new thread to handle the database transaction
					Thread thread = new Thread(new Runnable() {
						
						public void run() {
							// TODO Auto-generated method stub
							
							Session session = FactoryProvider.getFactory().openSession();
							Transaction tx = null;
							try {
								tx = session.beginTransaction();
								session.save(note);
								tx.commit();
							} catch (Exception e) {
								// TODO: handle exception
								if (tx != null)
		                            tx.rollback();
		                        e.printStackTrace();
							}
							
							session.close();

//							httpsession.setAttribute("resid", resi);

						}
					});
					
					thread.start();
//					thread.join();
		
	}

	public Register getUserByEmailAndPassword(String email, String password) {
		// TODO Auto-generated method stub
		
		Register register = null;
		
		try {
			
			String query = "from Register where email =: e and password =: p";
			
			Session session = this.sessionFactory.openSession();
			
			Query q =  session.createQuery(query);
			
			q.setParameter("e", email);
			
			q.setParameter("p", password);
			
			
			register = (Register)q.getSingleResult();
					
			session.close();
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return register;
		
	}

	

}
