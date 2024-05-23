<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="../styles/styleCalificacionesAlumno.css" rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Jost:ital,wght@0,100..900;1,100..900&display=swap"
	rel="stylesheet">
<meta charset="UTF-8">
<title>Calificaciones</title>
</head>
<body>

<div class="container">
    <h2>Calificaciones del Alumno</h2>

    <div>
        <label for="tipoSelect">Selecciona Tipo:</label>
        <select id="tipoSelect">
            <option value="">Seleccionar</option>
            <option value="asignaturas">Asignaturas</option>
            <option value="practicas">Prácticas</option>
            <option value="todas">Todas las Asignaturas</option>
        </select>
    </div>

    <div id="asignaturasContainer" style="display: none;">
        <label for="asignaturaSelect">Selecciona la Asignatura:</label>
        <select id="asignaturaSelect">
            <option value="">Seleccionar Asignatura</option>
            <option value="prog">Programación</option>
            <option value="bbdd">Base de datos</option>
            <option value="si">Sistemas informáticos</option>
            <option value="ed">Entornos de desarrollo</option>
            <option value="fol">Formación y orientación laboral</option>
            <option value="ldm">Lenguaje de marcas</option>
        </select>

        <table id="tablaCalificaciones" style="display: none;">
            <thead>
                <tr>
                    <th>Trimestre</th>
                    <th>Nota</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>1</td>
                    <td><span class="notaSpan"></span></td>
                </tr>
                <tr>
                    <td>2</td>
                    <td><span class="notaSpan"></span></td>
                </tr>
                <tr>
                    <td>3</td>
                    <td><span class="notaSpan"></span></td>
                </tr>
            </tbody>
        </table>

        <p id="notaMedia" style="display: none;">Nota Media del Trimestre: <span id="notaMediaSpan"></span></p>
    </div>

    <div id="practicasContainer" style="display: none;">
        <table>
            <thead>
                <tr>
                    <th>Nombre de la Empresa</th>
                    <th>Responsable</th>
                    <th>Calificación</th>
                </tr>
            </thead>
            <tbody id="tablaPracticas">
			</tbody>
        </table>
    </div>

	<div id="todasContainer" style="display: none;">
	    <table>
	        <thead>
	            <tr>
	                <th>Asignatura</th>
	                <th>Nota Media</th>
	            </tr>
	        </thead>
	        <tbody id="notasContainer">
	            <tr>
	                <td>Programación</td>
	                <td><span id="notaMediaProg">8.33</span></td>
	            </tr>
	            <tr>
	                <td>Base de datos</td>
	                <td><span id="notaMediaBbdd">3.21</span></td>
	            </tr>
	            <tr>
	                <td>Sistemas informáticos</td>
	                <td><span id="notaMediaSi">5.42</span></td>
	            </tr>
	            <tr>
	                <td>Entornos de desarrollo</td>
	                <td><span id="notaMediaEd">4.12</span></td>
	            </tr>
	            <tr>
	                <td>Formación y orientación laboral</td>
	                <td><span id="notaMediaFol">7.53</span></td>
	            </tr>
	            <tr>
	                <td>Lenguaje de marcas</td>
	                <td><span id="notaMediaLdm">6.41</span></td>
	            </tr>
	            <tr>
	                <td><strong>Media de Todas</strong></td>
	                <td><strong><span id="mediaTodas">6.1</span></strong></td>
	            </tr>
	        </tbody>
	    </table>
	</div>

    <script src="../scripts/calificacionesAlumno.js"></script>

</body>
</html>