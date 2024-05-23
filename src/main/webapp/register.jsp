<%@page import="com.accenture.portal.models.Course"%>
<%@page import="com.accenture.portal.models.School"%>
<%@page import="com.accenture.portal.services.ServicesModels"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<%!ServicesModels sm = new ServicesModels();
ArrayList<School> schools = new ArrayList<School>();
HashMap<Integer, ArrayList<Course>> coursesMap = new HashMap<>();%>

<%
schools.clear();
coursesMap.clear();

schools.addAll(sm.getAllSchools());
for (School school : schools) {
	ArrayList<Course> courses = sm.getAllCoursesBySchoolId(school.getIdSchool());
	coursesMap.put(school.getIdSchool(), courses);

}

%>

<head>
	<meta charset="UTF-8" name="viewport"
		content="width=device-width, initial-scale=1.25, maximum-scale=1">
	<!-- CSS -->
	<link href="${pageContext.request.contextPath}/styles/styleRegister2.css" rel="stylesheet">
	<!-- FONTS -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link
		href="https://fonts.googleapis.com/css2?family=Jost:ital,wght@0,100..900;1,100..900&display=swap"
		rel="stylesheet">
	<!-- FAVICON -->
	<link rel="icon" type="image/x-icon" href="../images/accFavicon.jpg">
	<title>Register</title>
</head>

<body>
	<div id="mainContainer">
		<!-- ACCENTURE IMAGE -->
		<img src="${pageContext.request.contextPath}/images/logoAccenture.svg" id="logoAccenture">
		
		<!-- FORM -->
		<form action="${pageContext.request.contextPath}/register" method="post" class="login" onsubmit="return validateInput();">
			<!-- NOMBRE -->
			<div class="input_container">
				<input type="text" name="user_name" required> <label>Nombre</label>
			</div>
			
			<!-- APELLIDOS -->
			<div class="input_container">
				<input type="text" name="user_lastname" required> <label>Apellidos</label>
			</div>
			
			<!-- EMAIL -->
			<div class="input_container">
				<input id="user_email" type="text" name="user_email" required> <label>Email</label>
				<div id="email_alert" class="advertencia"></div>
			</div>
			
			<!-- FECHA NACIMIENTO -->
			<div class="input_container">
				<input id="user_birthday" type="date" class="date" name="user_birthday" required>
				<div id="birth_alert" class="advertencia"></div>
			</div>
			
			<!-- NIF -->
			<div class="input_container">
				<input id="user_nif" type="text" name="user_nif" required> <label>NIF</label>
				<div id="nif_alert" class="advertencia"></div>
			</div>
			
			<!-- CENTRO -->
			<div class="input_container">
				<select name="user_center" id="user_center" onchange="updateCourses()">
					<option value="0" disabled selected> -- Seleccione un centro --</option>
					<% for(int i = 0; i < schools.size(); i++) { %>
						 <option value="<%= schools.get(i).getIdSchool() %>" > <%= schools.get(i).getNombreSchool()%> </option>				
					<% }; %>
					
				</select>
			</div>
			
			<!-- CURSO -->
			<div class="input_container">
				<select name="user_course" id="user_course">
					<option value="0" disabled selected>-- Seleccione un curso --</option>
				</select>
			</div>
			
			<!-- CONTRASEÑA -->
			<div class="input_container">
				<input id="user_password" type="password" name="user_password" required> <label>Contraseña</label>
				<div id="pass1_alert" class="advertencia"></div>
			</div>
			
			<!-- REPITE CONTRASEÑA -->
			<div class="input_container">
				<input id="user_password2" type="password" name="user_password2" required> <label>Repetir contraseña</label>
				<div id="pass2_alert" class="advertencia"></div>
			</div>
	
			<div class="advertencia">
                    <%
                    if (request.getAttribute("errorUsuarioRegistrado") != null) {
                    %>
                    <img src="${pageContext.request.contextPath}/images/advertencia.png" id="logoAdvertencia"><span>
                        <%=request.getAttribute("errorUsuarioRegistrado")%></span>
                    <%
                    }
                    %>
             </div>
			

			<!-- BOTÓN REGISTRO -->
			<button id="registerButton" type="submit" class="register-button container-button">Registrar</button>

			<!-- LOGIN LINK -->
			<div class="account-animation">
				<a href="${pageContext.request.contextPath}/login.jsp" class="animated-link"> Tengo una cuenta creada</a>
			</div>
		</form>
	</div>

	<!-- FOOTER -->
	<footer>
		<p>Aplicación creada por <strong>Grupo La Rubia & co</strong></p>
	</footer>
	
<script>
    
    const coursesMap = {
        <% for (Map.Entry<Integer, ArrayList<Course>> entry : coursesMap.entrySet()) { %>
            <%= entry.getKey() %>: [
                <% for (Course course : entry.getValue()) { %>
                    { id_course: <%= course.getId_course() %>, nameCourse: '<%= course.getNameCourse() %>' },
                <% } %> 
            ],
        <% } %>
    };

    function updateCourses() {
        const schoolId = document.getElementById("user_center").value;
        const coursesSelect = document.getElementById("user_course");
        
        coursesSelect.innerHTML = '<option value="0" disabled selected>-- Seleccione un curso --</option>';

        if (coursesMap[schoolId]) {
            coursesMap[schoolId].forEach(course => {
                const option = document.createElement('option');
                option.value = course.id_course;
                option.textContent = course.nameCourse;
                coursesSelect.appendChild(option);
            });
        }
    }
</script>

	
	<script src="${pageContext.request.contextPath}/scripts/registerValidations2.js"></script>
</body>
</html>
