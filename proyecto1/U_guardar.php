<?php
// Iniciar la sesión al principio del script
session_start();
// Paso 1: recibir datos del formulario
$nombre = $_POST['nombre'];
$apellido = $_POST['apellido'];
$ci = $_POST['ci'];
$correo = $_POST['correo'];
$password = sha1($_POST['password']); // ENCRIPTAR CONTRASEÑA
$tipo_usuario = $_POST['tipo_usuario'];
$celular = $_POST['celular'];
// Paso 2: unificar los valores cambiándolos a un solo tipo
$nombre = mb_strtolower($nombre);
// Paso 3: conectar con la base de datos
require_once "conexionbd.php"; // Debemos asegurarnos de que $conexion esté definido en este archivo 
// Paso 4: preparar la consulta con todos los datos con comillas simples ''
$consulta = "INSERT INTO usuario (nombre, apellido, ci, correo, password, tipo_usuario, celular) 
VALUES ('$nombre', '$apellido', '$ci', '$correo', '$password', '$tipo_usuario', '$celular')";
echo $consulta;
// Paso 5: ejecutar la consulta
$respuesta = mysqli_query($conexion, $consulta);
if ($respuesta) { // Paso 6: evaluar la respuesta
    // Guardamos datos en la sesion del usuario (su id, su nombre, su ci, y su tipo de usuario)
    $_SESSION['id_usuario'] = getIdUsuario($ci, $conexion);
    $_SESSION['nombre_usuario'] = $nombre;
    $_SESSION['ci_usuario'] = $ci;
    $_SESSION['tipo_usuario'] = $tipo_usuario;
    // Verificamos que tipo de usuario es para redirigirlo a su respectivo panel
    switch ($tipo_usuario) {
        case 'administrador':
            header("Location: panel_administrador/panel_admin.html");
        break;
        case 'docente':
            header("Location: panel_administrador/panel_docente.html");
        break;
        case 'estudiante':
            header("Location: panel_administrador/panel_estudiante.html");
        break;
    }
} else {
    $mensaje = "Error de registro. Intente nuevamente!!!";
}
// Función para obtener el ID del usuario de la base de datos
function getIdUsuario($ci, $conexion) {
    $consulta = "SELECT id_usuario FROM usuario WHERE ci='$ci'"; 
    $respuesta = mysqli_query($conexion, $consulta);
    // Verificar si hay resultados
    $fila = mysqli_fetch_assoc($respuesta); 
    // Obtener el tipo de usuario
    $id_usuario = $fila['id_usuario'];
    return $id_usuario;
}
?>
<div class="alert alert-info">
    <?php
    echo isset($mensaje) ? $mensaje : '';
    ?>
    <h1>Listar Usuarios</h1>
    <a href="U_listar.php"><button>Listar Usuarios</button></a>
</div>
