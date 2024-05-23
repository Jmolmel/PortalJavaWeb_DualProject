package com.accenture.portal.models;

import java.sql.ResultSet;
import java.sql.SQLException;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class School {
	

	int idSchool;
	String nombreSchool;
	String tlfSchool; 
	String email;
	String scheduleSchool;
	String locSchool;

	
	
	public School(ResultSet res) {
		
		try {
			this.idSchool = res.getInt("id");
			this.nombreSchool = res.getString("school_name");
			this.tlfSchool = res.getString("tel");
			this.email = res.getString("email");
			this.scheduleSchool = res.getString("secretarySchedule");
			this.locSchool = res.getString("loc");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
}
