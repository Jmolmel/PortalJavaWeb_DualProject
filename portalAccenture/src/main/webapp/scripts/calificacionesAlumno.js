/* funcion de js de calificacionesAlumno.jsp */

// Constantes
const tipoSelect = document.getElementById('tipoSelect');
const asignaturaSelect = document.getElementById('asignaturaSelect');
const tablaCalificaciones = document.getElementById('tablaCalificaciones');
const notaSpans = document.querySelectorAll('.notaSpan');
const notaMediaParagraph = document.getElementById('notaMedia');
const notaMediaSpan = document.getElementById('notaMediaSpan');
const asignaturasContainer = document.getElementById('asignaturasContainer');
const practicasContainer = document.getElementById('practicasContainer');
const tablaPracticas = document.getElementById('tablaPracticas');
const todasContainer = document.getElementById('todasContainer');
const tablaTodas = document.getElementById('tablaTodas');

// Notas por defecto para cada asignatura (arrays de ejemplo)
const notasPorAsignatura = {
    prog: [8.5, 7.9, 9.2],
    bbdd: [7.8, 8.3, 8.9],
    si: [6.5, 7.2, 8.0],
    ed: [4.3, 2.4, 1.3],
    fol: [5.3, 6.4, 6.4],
    ldm: [7.5, 7.5, 6.7]
    //...
};

// Datos de las prácticas
const practicas = [
    { empresa: 'Empresa 1', responsable: 'Juan Pérez', calificacion: 9.0 },
    { empresa: 'Empresa 2', responsable: 'Ana Gómez', calificacion: 8.5 }
];

// Función para cambiar las notas por asignatura
function cambiarNotasPorAsignatura(asignatura) {
    const notas = notasPorAsignatura[asignatura] || [];
    notaSpans.forEach((span, index) => {
        if (notas[index] !== undefined) {
            span.textContent = notas[index];
        } else {
            span.textContent = '-';
        }
    });
    calcularNotaMedia();
}


// Función para calcular la nota media
function calcularNotaMedia() {
    let total = 0;
    let count = 0;

    notaSpans.forEach(span => {
        if (span.textContent !== '-') {
            total += parseFloat(span.textContent);
            count++;
        }
    });

    const notaMedia = total / count || 0;
    notaMediaSpan.textContent = notaMedia.toFixed(2);
    notaMediaParagraph.style.display = count > 0 ? 'block' : 'none';
}

// Función para mostrar datos de prácticas
function mostrarDatosPracticas() {
    tablaPracticas.innerHTML = '';
    practicas.forEach(practica => {
        const row = document.createElement('tr');
        row.innerHTML = `
            <td>${practica.empresa}</td>
            <td>${practica.responsable}</td>
            <td>${practica.calificacion}</td>
        `;
        tablaPracticas.appendChild(row);
    });
}

// Función para mostrar las notas medias de todas las asignaturas
function mostrarTodasLasNotas() {
    tablaTodas.innerHTML = '';
    for (let asignatura in notasPorAsignatura) {
        const notas = notasPorAsignatura[asignatura];
        const sumaNotas = notas.reduce((a, b) => a + b, 0);
        const notaMedia = (sumaNotas / notas.length).toFixed(2);

        const row = document.createElement('tr');
        row.innerHTML = `
            <td>${asignatura}</td>
            <td>${notaMedia}</td>
        `;
        tablaTodas.appendChild(row);
    }
}

// Evento cuando se cambia el tipo
tipoSelect.addEventListener('change', () => {
    const tipo = tipoSelect.value;
    asignaturasContainer.style.display = 'none';
    practicasContainer.style.display = 'none';
    todasContainer.style.display = 'none';

    if (tipo === 'asignaturas') {
        asignaturasContainer.style.display = 'block';
        tablaCalificaciones.style.display = 'none';
        notaMediaParagraph.style.display = 'none';
    } else if (tipo === 'practicas') {
        practicasContainer.style.display = 'block';
        mostrarDatosPracticas();
    } else if (tipo === 'todas') {
        todasContainer.style.display = 'block';
        mostrarTodasLasNotas();
    }
});

// Evento cuando se cambia la asignatura
asignaturaSelect.addEventListener('change', () => {
    const asignatura = asignaturaSelect.value;
    if (asignatura) {
        tablaCalificaciones.style.display = 'table';
        cambiarNotasPorAsignatura(asignatura);
    } else {
        tablaCalificaciones.style.display = 'none';
        notaMediaParagraph.style.display = 'none';
    }
});

// Inicialización
tablaCalificaciones.style.display = 'none';
notaMediaParagraph.style.display = 'none';
asignaturasContainer.style.display = 'none';
practicasContainer.style.display = 'none';
todasContainer.style.display = 'none';
