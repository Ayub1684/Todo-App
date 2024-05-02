package com.dao;

import com.entities.Note;
import com.entities.Register;

public interface UserDao {
	
	public void saveRegister(Register register);
	
	public void saveNote(Note note);
	
	public Register getUserByEmailAndPassword(String email,String password);

}
