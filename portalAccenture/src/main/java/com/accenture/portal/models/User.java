package com.accenture.portal.models;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class User {

	private int id;
	private String name;
	private String lastName;
	private String email;
	private String dnie;
	private String date;
	private int center;
	private int course;
	private String password;
	private String userType;

	//Importa el usuario a index
	public User(int id2, String name2, String lastName2, String birthDate, String dnie2, String userType2, int school, int course2) {
	    this.id = id2; 
	    this.name = name2; 
	    this.lastName = lastName2; 
	    this.date = birthDate; 
	    this.dnie = dnie2; 
	    this.userType = userType2; 
	    this.center = school; 
	    this.course = course2; 
	}
	
}
