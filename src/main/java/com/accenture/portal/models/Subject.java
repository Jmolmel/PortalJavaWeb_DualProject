package com.accenture.portal.models;

import java.sql.ResultSet;
import java.sql.SQLException;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class Subject {

	private int id;
	private String subjectName;
	private int weeklyHours;
	private int total_hours;

	
	public Subject(ResultSet res) {
		
		try {
			
			this.id = res.getInt("id");
			this.subjectName = res.getString("subject_name");
			this.weeklyHours = res.getInt("weekly_hours");
			this.total_hours = res.getInt("total_hours");
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
}
