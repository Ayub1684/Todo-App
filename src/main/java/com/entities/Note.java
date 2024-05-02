package com.entities;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;



@Entity
@Table(name = "note")
public class Note {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String title;
	
	@Column(length = 1500)
	private String content;
	
	private Date date;
	
	@ManyToOne
	@JoinColumn(name = "register_id", nullable = false)
	private Register register;
	
	public static Note note;
	

	private Note() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public static Note getInstance() {
		
		if(note == null) {
			note = new Note();
		}
		
		return note;
	}
	
	private Note(String title, String content, Date date, Register register) {
		super();
		this.title = title;
		this.content = content;
		this.date = date;
		this.register = register;
	}


	private Note(String title, String content, Date date) {
		super();
		this.title = title;
		this.content = content;
		this.date = date;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}
	
	public Register getRegister() {
		return register;
	}

	public void setRegister(Register register) {
		this.register = register;
	}
	

}
