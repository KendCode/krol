<?php
 //1. Recibir el Id de la base de datos
 $id_usuario=($_GET['id_usuario']);
 //2. Revizar los valores recibidos
 //3. Unificar los valores
 //4. Cinectar a la base de datos
 require_once "conexionbd.php";
 //preparar la consulta la consulta SQL
 $consulta="DELETE from usuario WHERE id_usuario=$id_usuario";
 //6. Ejecutar la consulta
 $respuesta=mysqli_query($conexion,$consulta);
 //7. Evaluar respuesta
 if($respuesta){
 echo"Usuario Eliminado correctamente!!!";
 header("Location:U_listar.php");
 }
 else{
 echo"Error de eliminar. Intente nuevamente!!!";
 }
?>