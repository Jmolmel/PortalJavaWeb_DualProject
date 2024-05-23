package com.accenture.portal.services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.accenture.portal.conector.Conector;
import com.accenture.portal.models.Course;
import com.accenture.portal.models.School;
import com.accenture.portal.models.User;



/**
 * This class provides various services related to retrieving information from the database.
 */
public class ServicesModels {
    
    /**
     * Retrieves information about a school based on its ID.
     * 
     * @param idSchool The ID of the school.
     * @return School object containing school information.
     */
    public static School getInfoSchool(int idSchool){

        int idSchoolConstr=idSchool;
        String nombreSchool="";
        String tlfSchool= "";
        String email= "";
        String scheduleSchool= "";
        String locSchool="";

        Conector conector = new Conector();

        try(Connection conx = conector.getMySqlConnection()){

            if (conx != null) {
                String sql = "SELECT * FROM school where id="+idSchool;
                Statement sentencia = conx.createStatement();

                try (ResultSet rs = sentencia.executeQuery(sql)) {
                    while (rs.next()) {
                        idSchoolConstr=rs.getInt(1);
                        nombreSchool=rs.getString(2);
                        tlfSchool= rs.getString(3);
                        email= rs.getString(4);
                        scheduleSchool= rs.getString(5);
                        locSchool=rs.getString(6);
                    }
                }
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return new School(idSchoolConstr, nombreSchool, tlfSchool, email, scheduleSchool, locSchool);
    }
    
    /**
     * Retrieves information about a course based on its ID.
     * 
     * @param idCourse The ID of the course.
     * @return Course object containing course information.
     */
    public static Course getCourseInfo(int idCourse) {
        String nameCourse = null;
        String description = null;

        Conector conector = new Conector();

        try (Connection conx = conector.getMySqlConnection()) {
            String sql = "SELECT course_name, description FROM course WHERE id = ?";
            try (PreparedStatement ps = conx.prepareStatement(sql)) {
                ps.setInt(1, idCourse);
                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        nameCourse = rs.getString("course_name");
                        description = rs.getString("description");
                    } else {
                        System.out.println("No course found");
                    }
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        return new Course(idCourse, nameCourse, description);
    }
    
    /**
     * Defines the image path based on the ID.
     * 
     * @param id The ID used to determine the image path.
     * @return The path to the image.
     */
    public static String defineImageCenter(Integer id){
        String imagen="";

        switch(id) {
            case 1 -> imagen = "../images/logos/LOGOTIPO-CESUR.png";
            case 2 -> imagen = "../images/logos/LOGOTIPO-IES-PABLO-PICASSO.png";
            case 3 -> imagen = "../images/logos/LOGOTIPO-IES-BELEN.png";
            case 4 -> imagen = "../images/logos/LOGOTIPO-ALAN-TURING.png";
            case 5 -> imagen = "../images/logos/LOGOTIPO-IES-SAN-JOSE.png";
            default -> imagen = "../images/logos/LOGOTIPO-ACCENTURE.png";
        }
        return imagen;
    }
    
    /**
     * Defines the image path based on the ID.
     * 
     * @param id The ID used to determine the image path.
     * @return The path to the image.
     */
    public static String defineImageIndex(Integer id){
        String imagen="";

        switch(id) {
            case 1 -> imagen = "./images/logos/LOGOTIPO-CESUR.png";
            case 2 -> imagen = "./images/logos/LOGOTIPO-IES-PABLO-PICASSO.png";
            case 3 -> imagen = "./images/logos/LOGOTIPO-IES-BELEN.png";
            case 4 -> imagen = "./images/logos/LOGOTIPO-ALAN-TURING.png";
            case 5 -> imagen = "./images/logos/LOGOTIPO-IES-SAN-JOSE.png";
            default -> imagen = "./images/logos/LOGOTIPO-ACCENTURE.png";
        }
        return imagen;
    }
    
    public static String defineColor(int schoolId) {
    	String color = "";
    	switch(schoolId) {
	    	case 1 -> {
	    		color = "#244AA4";
	    	}
	    	case 2 -> {
	    		color = "#461B70";
	    	}
	    	case 3 -> {
	    		color = "#FF8005";
	    	}
	    	case 4 -> {
	    		color = "#43A7DB";
	    	}
	    	case 6 -> {
	    		color = "#006B99";
	    	}
	    	default -> {
	    		color = "#A100FF";
	    	}
    	}
    	return color;
    }
    
    /**
     * Defines the map link based on the school ID.
     * 
     * @param idSchool The ID of the school.
     * @return The link to the map.
     */
    public static String defineMap(int idSchool) {
        String mapLink="";
        
        switch(idSchool){
        case 1->{
            mapLink="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d10757.374130614628!2d-4.372041717464043!3d36.71808277803187!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xd7259120bfc4db3%3A0xec0ecedd8dc61902!2sCESUR%20M%C3%A1laga%20Este%20Formaci%C3%B3n%20Profesional!5e0!3m2!1ses!2ses!4v1715334512514!5m2!1ses!2ses";
            break;
        }
        case 2->{
            mapLink="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d6395.717928363966!2d-4.455162806420868!3d36.725948300000006!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xd72f70c3d574e37%3A0x67343146876c734b!2sIES%20Pablo%20Picasso!5e0!3m2!1ses!2ses!4v1715335018709!5m2!1ses!2ses";
            break;
        }
        case 3->{
            mapLink="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3199.124902411609!2d-4.459761523439527!3d36.69553637227712!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xd72f9dee2ea3131%3A0xe00a7d745fb8b2e3!2sIES%20Bel%C3%A9n!5e0!3m2!1ses!2ses!4v1715335056310!5m2!1ses!2ses";
            break;
        }
        case 4->{
            mapLink="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3197.2394272377824!2d-4.554430616275409!3d36.740823696739334!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xd72f10963ce0f3d%3A0x310ae7d4bb2e8f7b!2sCPIFP%20Alan%20Turing!5e0!3m2!1ses!2ses!4v1715335096355!5m2!1ses!2ses";
            break;
        }
        case 5->{
            mapLink="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d60854.997797710945!2d-4.459410649332534!3d36.715431468654785!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xd72f711c56e8bed%3A0x6de2361e88593aeb!2sColegio%20Diocesano%20San%20Jos%C3%A9%20Obrero!5e0!3m2!1ses!2ses!4v1715335137121!5m2!1ses!2ses";
            break;
        }
        }
        return mapLink;
    }
    
    //Define notices
	public static String defineID(int idSchool) {
    	String srcCentro="";
    	
    	switch(idSchool){
    	case 1->{
    		srcCentro="jsp/noticiasCesur.jsp";
    	}
    	case 2->{
    		srcCentro="jsp/noticiasPabloPicasso.jsp";
    	}
    	case 3->{
    		srcCentro="jsp/noticiasBelen.jsp";
    	}
    	case 4->{
    		srcCentro="jsp/noticiasAlanTuring.jsp";
    	}
    	case 5->{
    		srcCentro="jsp/noticiasSanJose.jsp";
    		}
    	}
    	return srcCentro;
    }
    
    /**
     * Constructs the content for the index card.
     * 
     * @param activeUser     The active user.
     * @param centroUsuario  The name of the user's center.
     * @param crs            The course object.
     * @return The content for the index card.
     */
    public static String getContentTarjetaIndex(User activeUser, String centroUsuario, Course crs) {
        String content = "Bienvenido a " + centroUsuario;

        if (activeUser != null) {
        	System.out.println("entra");
            if (crs != null) {
                content += ". Estás inscrito en el curso ";
            }
        }

        return content;
    }

    public static String getContentCard(User activeUser) {

        School colegio = getInfoSchool(activeUser.getCenter());
        Course curso = getCourseInfo(activeUser.getCourse());

        switch (activeUser.getUserType()) {
            case "01": {
                return "Alumno: " + activeUser.getName() + " " + activeUser.getLastName() +
                       "<br>" + "Curso: " + (curso != null ? curso.getNameCourse() : "N/A");
            }
            case "02": {
                return "Profesor: " + activeUser.getName() + " " + activeUser.getLastName() +
                       "<br>" + "Centro: " + (colegio != null ? colegio.getNombreSchool() : "N/A");
            }
            case "03": {

                return "Empleado Accenture: " + activeUser.getName() + " " + activeUser.getLastName();
            }
            default: {
                return "";
            }
        }
    }

  
    /**
     * Utility method to close database resources.
     * 
     * @param conn The database connection.
     * @param ps   The prepared statement.
     * @param rs   The result set.
     */
    private static void closeResources(Connection conn, PreparedStatement ps, ResultSet rs) {
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
    
    /**
     * Retrieves the course information for a user.
     * 
     * @param userId The ID of the user.
     * @return The course object.
     * @throws ClassNotFoundException If the class is not found.
     */
    public Course getCourse(int userId) throws ClassNotFoundException {
        Course course = null;
        Conector con = new Conector();
        try (Connection conx = con.getMySqlConnection()) {
            String query = "SELECT id, course_name, description FROM course WHERE user_id = ?";
            try (PreparedStatement ps = conx.prepareStatement(query)) {
                ps.setInt(1, userId);
                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        Integer courseId = rs.getInt("id");
                        String courseName = rs.getString("course_name");
                        String courseDescription = rs.getString("description");


                        if (rs.wasNull()) {
                            course = new Course(0, null, null);
                        } else {
                            course = new Course(courseId, courseName, courseDescription);
                        }
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return course;
    }
    
    
    /**
     * Retrieves the names of subjects for a list of course IDs.
     * 
     * @param courseIds List of course IDs.
     * @return List of subject names.
     */
    public List<String> getSubjectNames(List<Integer> courseIds) {
        List<String> subjectNames = new ArrayList<>();

        Conector conector = new Conector();

        try (Connection conn = conector.getMySqlConnection()) {
            String sql = "SELECT subject_name FROM subject WHERE id = ?";
            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                for (Integer courseId : courseIds) {
                    ps.setInt(1, courseId);
                    try (ResultSet rs = ps.executeQuery()) {
                        if (rs.next()) {
                            subjectNames.add(rs.getString("subject_name"));
                        }
                    }
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        return subjectNames;
    }
    
    

    /**
     * Retrieves all schools from the database.
     *
     * @return An ArrayList of School objects representing all schools in the database,
     *         or null if an error occurs or no schools are found.
     * @throws SQLException If a database access error occurs.
     */
    	public ArrayList<School> getAllSchools() throws SQLException {

    		ArrayList<School> schools = new ArrayList<School>();
    		Connection conn = null;
    		ServicesModels sm = new ServicesModels();
    		try {
    			conn = new Conector().getMySqlConnection();

    			if (conn != null) {
    				schools.addAll(sm.findAllSchools(conn));
    				return schools;
    			}

    		} catch (ClassNotFoundException | SQLException e) {
    			e.printStackTrace();
    			System.out.println("No furula getallSchools");
    			return null;
    		} finally {
    			if (conn != null) {
    				try {
    					conn.close();
    				} catch (SQLException e) {
    					e.printStackTrace();
    				}
    			}
    		}
    		return null;
    	}
    	
    	/**
    	 * Finds all schools in the database.
    	 *
    	 * @param conn The database connection.
    	 * @return A List of School objects representing all schools in the database.
    	 * @throws SQLException If a database access error occurs.
    	 */
    	public List<School> findAllSchools(Connection conn) {
    		String sql = "SELECT * FROM school";
    		
    		try (PreparedStatement stmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE)) {
    			ResultSet res = stmt.executeQuery();
    			List<School> schools = new ArrayList<School>();
    			
    			while (res.next()) {
    				schools.add(new School(res));
    			}
    			return schools;
    		} catch (SQLException e) {
    			e.printStackTrace();
    			System.out.println("No funcioan findAllSchools");
    			return null;
    		}
    	}
    	
    	/**
    	 * Retrieves all courses associated with a specific school from the database.
    	 *
    	 * @param id The ID of the school.
    	 * @return An ArrayList of Course objects representing all courses associated with the school,
    	 *         or null if an error occurs or no courses are found.
    	 * @throws SQLException If a database access error occurs.
    	 */
    	public ArrayList<Course> getAllCoursesBySchoolId(int id) throws SQLException {

    		ArrayList<Course> courses = new ArrayList<Course>();
    		ServicesModels sm = new ServicesModels();
    		Connection con = null;

    		try {
    			con = new Conector().getMySqlConnection();
    			
    			if (con != null) {
    				courses.addAll(sm.findAllCoursesBySchoolId(con, id));

    				return courses;
    			}

    		} catch (ClassNotFoundException | SQLException e) {
    			e.printStackTrace();
    			return null;
    		}
    		return null;

    	}
    	
    	/**
    	 * Finds all courses associated with a specific school in the database.
    	 *
    	 * @param con The database connection.
    	 * @param id  The ID of the school.
    	 * @return A List of Course objects representing all courses associated with the school.
    	 * @throws SQLException If a database access error occurs.
    	 */
    	public List<Course> findAllCoursesBySchoolId(Connection con, int id) {
    		String sql = "SELECT a.* FROM course a, school_course b WHERE a.id = b.course AND b.school = ?";
    		
    		try (PreparedStatement stmt = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE)) {
    			stmt.setInt(1, id);
    			
    			ResultSet res = stmt.executeQuery();
    			List<Course> courses = new ArrayList<Course>();
    			
    			while (res.next()) {
    				courses.add(new Course(res));
    			}
    			return courses;
    		} catch (SQLException e) {
    			
    			e.printStackTrace();
    			return null;
    		}
    	}
}