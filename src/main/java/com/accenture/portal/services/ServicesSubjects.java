package com.accenture.portal.services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.accenture.portal.models.Subject;
import com.accenture.portal.conector.Conector;

public class ServicesSubjects {

	
	/**
	 * Finds all subjects associated with a specific course ID in the database.
	 *
	 * @param con The database connection.
	 * @param id  The ID of the course.
	 * @return An ArrayList of Subject objects representing all subjects associated with the course,
	 *         or null if an error occurs or no subjects are found.
	 */
	public ArrayList<Subject> findSubjectsById(Connection con, int id) {
		String sql = "SELECT a.* FROM subject a, course b, course_subject c  WHERE a.id = c.subject AND b.id = c.course AND c.course = ?";

		try (PreparedStatement stmt = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE)) {

			stmt.setInt(1, id);
			
			ResultSet res = stmt.executeQuery();

			ArrayList<Subject> subjects = new ArrayList<Subject>();

			while (res.next()) {

				subjects.add(new Subject(res));

			}

			return subjects;

		} catch (SQLException e) {

			e.printStackTrace();
			return null;
		}
		
		
	}
	
	
	/**
	 * Retrieves all subjects associated with a specific course ID from the database.
	 *
	 * @param id The ID of the course.
	 * @return An ArrayList of Subject objects representing all subjects associated with the course,
	 *         or null if an error occurs or no subjects are found.
	 */
	public ArrayList<Subject> getSubjects(int id) {

		ArrayList<Subject> subjects = new ArrayList<Subject>();
		Connection con = null;

		try {

			con = new Conector().getMySqlConnection();

			if (con != null) {

				subjects.addAll(findSubjectsById(con, id));

				return subjects;
			}

		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			System.out.println("No furula");
			return null;
		} finally {
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return null;

	}
	
	
}
