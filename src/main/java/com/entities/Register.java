package com.entities;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "Register")
public class Register {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "register_id")
	private int id;
	
	private String name;
	
	@Column(unique = true	)
	private String email;
	
	private String password;
	
	
	
	@OneToMany(mappedBy = "register")
	private List<Note> note;
	
//	static Register class reference
	
	public static Register register;

//	private constructor
	private Register() {
//		super();
		// TODO Auto-generated constructor stub
		System.out.println("this got executed");
	}
	
//	Method to get the object of RFegister class
	public static Register getInstance() {
		
		if(register == null) {
			register = new Register();
		}
		
		return register;
		
	}
	
	private  Register(String name, String email, String password) {
		super();
		this.name = name;
		this.email = email;
		this.password = password;
	}

	private  Register(String name, String email, String password, List<Note> note) {
		super();
		this.name = name;
		this.email = email;
		this.password = password;
		this.note = note;
	}

	

	public List<Note> getNote() {
		return note;
	}


	public void setNote(List<Note> note) {
		this.note = note;
	}


	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "Register [id=" + id + ", name=" + name + ", email=" + email + ", password=" + password + "]";
	}
	

}
