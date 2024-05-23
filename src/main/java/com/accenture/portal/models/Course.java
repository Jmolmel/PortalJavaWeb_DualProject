package com.accenture.portal.models;

import java.sql.ResultSet;
import java.sql.SQLException;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Course {
	

	Integer id_course;
	String nameCourse;
    String description;
	
	
    public Course(int id_course, String nameCourse, String description) {
        this.id_course = id_course;
        this.nameCourse = nameCourse;
        this.description = description;
    }


	public Course(ResultSet res) {
		try {
			this.id_course = res.getInt("id");
			this.nameCourse = res.getString("course_name");
			this.description = res.getString("description");

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

}
