<?php
//servidor
$servidor="localhost";
//usuario
$usuario="root";
//contraseña
$contraseña="";
//y la base de datos
$bd="bd_sistema";
//coneccion de los 4 atributos
$conexion=mysqli_connect($servidor,$usuario,$contraseña,$bd);
if(!$conexion){
 echo"Error al conectar la BD";
}
mysqli_query($conexion,"SET NAMES utf8");
date_default_timezone_set("America/La_Paz");
?>