package com.accenture.portal.services;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.accenture.portal.conector.Conector;
import com.accenture.portal.models.User;

/**
 * This class provides various services related to user authentication, data retrieval, and registration.
 */
public class Services {

    /**
     * Authenticates a user based on their email and password.
     * 
     * @param conn         The database connection.
     * @param userEmail    The user's email.
     * @param userPassword The user's password.
     * @return true if authentication is successful, false otherwise.
     */
    public static boolean authenticateUser(Connection conn, String userEmail, String userPassword) {
        PreparedStatement ps = null;
        ResultSet rs = null;
        boolean ret = false;

        try {
            String query = "SELECT * FROM credentials WHERE email = ? AND pass = ?";
            ps = conn.prepareStatement(query);
            ps.setString(1, userEmail);
            ps.setString(2, userPassword);
            rs = ps.executeQuery();

            if (rs.next()) {
                ret = true;
            }
            return ret;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * Retrieves the user ID based on their email.
     * 
     * @param conn      The database connection.
     * @param userEmail The user's email.
     * @return The user ID if found, -1 otherwise.
     */
    public static int getUserId(Connection conn, String userEmail) {
        PreparedStatement ps = null;
        ResultSet rs = null;
        int userId = -1;

        try {
            String query = "SELECT id FROM credentials WHERE email = ?";
            ps = conn.prepareStatement(query);
            ps.setString(1, userEmail);
            rs = ps.executeQuery();

            if (rs.next()) {
                userId = rs.getInt("id");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        System.out.println("User ID based on email: " + userId);
        return userId;
    }

    /**
     * Retrieves user details by user ID.
     * 
     * @param conn   The database connection.
     * @param userId The user ID.
     * @return User object containing user details.
     * @throws SQLException If a database access error occurs.
     */
    public static User getUserDetailsById(Connection conn, int userId) throws SQLException {
        PreparedStatement ps = null;
        ResultSet rs = null;
        User user = null;

        try {
            String query = "SELECT id, user_name, user_surname, birthDate, dnie, user_type, school_id, course_id FROM user_obj WHERE id = ?";
            ps = conn.prepareStatement(query);
            ps.setInt(1, userId);
            rs = ps.executeQuery();

            if (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("user_name");
                String lastName = rs.getString("user_surname");
                String birthDate = rs.getString("birthDate");
                String dnie = rs.getString("dnie");
                String userType = rs.getString("user_type");
                int school = rs.getInt("school_id");
                int course = rs.getInt("course_id");

                user = new User(id, name, lastName, birthDate, dnie, userType, school, course);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        System.out.println("User object returned");
        return user;
    }

    /**
     * Registers a new user.
     * 
     * @param name     The user's first name.
     * @param lastname The user's last name.
     * @param email    The user's email.
     * @param date     The user's birth date.
     * @param dnie     The user's DNI number.
     * @param alumn    The user's type (e.g., student, teacher).
     * @param pass1    The user's password.
     * @param pass2    The user's password confirmation.
     * @param center   The ID of the user's school.
     * @param course   The ID of the user's course.
     * @return true if registration is successful, false otherwise.
     */
    public boolean registerUser(String name, String lastname, String email, Date date, String dnie, String alumn, String pass1, String pass2, int center, int course) {
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = new Conector().getMySqlConnection();

            if (conn != null) {
                ps = conn.prepareStatement("SELECT * FROM credentials WHERE email = ?");
                ps.setString(1, email);
                ResultSet rs = ps.executeQuery();

                if (rs.next()) {
                    return false; // User already exists
                } else {
                    ps = conn.prepareStatement("INSERT INTO credentials (email, pass) VALUES (?, ?)");
                    ps.setString(1, email);
                    ps.setString(2, pass1);
                    
                    ps.executeUpdate();
                    int id = getUserId(conn, email);
                    ps = conn.prepareStatement("INSERT INTO user_obj (id, user_name, user_surname, birthDate, dnie, user_type, school_id, course_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
                    ps.setInt(1, id);
                    ps.setString(2, name);
                    ps.setString(3, lastname);
                    ps.setDate(4, date);
                    ps.setString(5, dnie);
                    ps.setString(6, alumn);
                    ps.setInt(7, center);
                    ps.setInt(8, course);
                    ps.executeUpdate();
                    return true; 
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            System.out.println("Registration error");
            return false; 
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return false; 
    }   
    
    /**
     * Retrieves the stored password for a given user ID. // Used in UpdatePasswordServlet
     * 
     * @param userId The user ID.
     * @return The stored password.
     */
    public String getStoredPassword(int userId) {
        String storedPassword = null;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = new Conector().getMySqlConnection();
            String query = "SELECT pass FROM credentials WHERE id = ?";
            ps = conn.prepareStatement(query);
            ps.setInt(1, userId);
            rs = ps.executeQuery();

            if (rs.next()) {
                storedPassword = rs.getString("pass");
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            System.out.println("Error en pass credentials");
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return storedPassword;
    }
    
    /**
     * Updates the password for a given user ID. //Used in UpdatePasswordServlet
     * 
     * @param userId      The user ID.
     * @param newPassword The new password.
     * @return true if the update is successful, false otherwise.
     */
    public boolean updatePassword(int userId, String newPassword) {
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = new Conector().getMySqlConnection();
            String updateQuery = "UPDATE credentials SET pass = ? WHERE id = ?";
            ps = conn.prepareStatement(updateQuery);
            ps.setString(1, newPassword);
            ps.setInt(2, userId);
            ps.executeUpdate();
            return true;
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            System.out.println("Error updating password");
            return false;
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } 
    }
    
    /**
     * Retrieves the stored email for a given user ID. //Used in UpdateEmailServlet
     * 
     * @param userId The user ID.
     * @return The stored email.
     */
    //Used in UpdateEmailServlet
    public String getStoredEmail(int userId) {
    	String storedEmail = null;
    	Connection conn = null;
    	PreparedStatement ps = null;
    	ResultSet rs = null;
    	
    	try {
			conn = new Conector().getMySqlConnection();
			String query = "SELECT email FROM credentials WHERE id = ?";
			ps = conn.prepareStatement(query);
			ps.setInt(1, userId);
			rs = ps.executeQuery();
			
			if (rs.next()) {
				storedEmail = rs.getString("Email");
			}
		} catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            System.out.println("Error fetching stored email");
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return storedEmail;
    }
    
    
    /**
     * Updates the email for a given user ID.  //Used in UpdateEmailServlet
     * 
     * @param userId   The user ID.
     * @param newEmail The new email.
     * @return true if the update is successful, false otherwise.
     */
    public boolean updateEmail(int userId, String newEmail) {
    	Connection conn = null;
    	PreparedStatement ps = null;
    	
    	try {
			conn = new Conector().getMySqlConnection();
			String query = "UPDATE credentials SET email = ? WHERE id = ?";
			ps = conn.prepareStatement(query);
			ps.setString(1, newEmail);
			ps.setInt(2, userId);
			ps.executeUpdate();
			return true;
		} catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            System.out.println("Error updating email");
            return false;
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    	
    /**
     * Retrieves the email associated with the given user ID from the database.
     *
     * @param userId The ID of the user whose email is to be retrieved.
     * @return The email address of the user, or null if the user ID is not found or an error occurs.
     */
    public static String getEmail(int userId) {
        String getEmail = null;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = new Conector().getMySqlConnection();
            String query = "SELECT email FROM credentials WHERE id = ?";
            ps = conn.prepareStatement(query);
            ps.setInt(1, userId);
            rs = ps.executeQuery();

            if (rs.next()) {
                getEmail = rs.getString("email");
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            System.out.println("Error en obtener email");
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return getEmail;
    }
    
    /**
     * Deletes a user and their associated credentials from the database by the given user ID.
     *
     * @param userId The ID of the user to be deleted.
     * @return True if the user and their credentials were successfully deleted, otherwise false.
     * @throws SQLException          If a database access error occurs.
     * @throws ClassNotFoundException If the JDBC driver class is not found.
     */
    public static boolean deleteUserById(int userId) throws SQLException, ClassNotFoundException {
        Connection conn = null;
        PreparedStatement userObjStmt = null;
        PreparedStatement credentialsStmt = null;

        try {
            conn = new Conector().getMySqlConnection();
            conn.setAutoCommit(false); // Comprueba que todo se complete

            String deleteUserObjSql = "DELETE FROM user_obj WHERE id = ?";
            userObjStmt = conn.prepareStatement(deleteUserObjSql);
            userObjStmt.setInt(1, userId);
            int userObjDeleted = userObjStmt.executeUpdate();

            String deleteCredentialsSql = "DELETE FROM credentials WHERE id = ?";
            credentialsStmt = conn.prepareStatement(deleteCredentialsSql);
            credentialsStmt.setInt(1, userId);
            int credentialsDeleted = credentialsStmt.executeUpdate();

            if (userObjDeleted > 0 && credentialsDeleted > 0) {
                conn.commit();
                return true;
            } else {
                conn.rollback();
                return false;
            }
        } catch (SQLException e) {
            if (conn != null) {
                conn.rollback();
            }
            throw e;
        } finally {
            if (userObjStmt != null) {
                userObjStmt.close();
            }
            if (credentialsStmt != null) {
                credentialsStmt.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }
}
