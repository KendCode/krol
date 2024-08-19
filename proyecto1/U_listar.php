<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <?php
        // Conectar a la base de datos
        require_once  "conexionbd.php";
        //preparar la consulta la consulta SQL
        $consulta="SELECT * from usuario";
        // Ejecutar la consulta
        $respuesta=mysqli_query($conexion,$consulta);
        // Evaluar respuesta
    ?>
  <!-- creamos una tabla con las siguientes columas --> 
    <table class="table" border="1">
        <thead class="thead-dark">
        <tr>
            <th scope="col">Nro</th>
            <th scope="col">Nombre</th>
            <th scope="col">Apellido</th>
            <th scope="col">Ci</th>
            <th scope="col">Correo</th>
            <th scope="col">Password</th>
            <th scope="col">Tipo de Usuario</th>  
            <th scope="col">celular</th>
            <th scope="col">Eliminar</th>  
        </tr>
        </thead>
        <?php        
        while($fila=mysqli_fetch_assoc($respuesta)){
        ?>
        <tbody>
        <tr>
                <td><?php echo $fila['id_usuario']; ?></td>
                <td><?php echo $fila['nombre']; ?></td>
                <td><?php echo $fila['apellido']; ?></td>
                <td><?php echo $fila['ci']; ?></td>
                <td><?php echo $fila['correo']; ?></td>
                <td><?php echo $fila['password']; ?></td>
                <td><?php echo $fila['tipo_usuario']; ?></td>
                <td><?php echo $fila['celular']; ?></td>
                <td><a href="U_eliminar.php?id_usuario=<?php echo $fila['id_usuario'];?>"class="btn btn-danger"> Eliminar</a></td>   
            </tr>
        </tbody> 
        <?php
            }
        ?>
    </table>
</body>
</html>