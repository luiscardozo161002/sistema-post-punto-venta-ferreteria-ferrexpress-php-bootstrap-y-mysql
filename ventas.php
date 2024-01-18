<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>🛠️ Ferreteria | Ventas </title>
    <!--Bootstrap CSS-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <!--Hoja de estilos-->
    <link rel="stylesheet" href="./src/css/style_productos.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light color_navbar p-3">
        <div class="container-fluid d-flex align-items-center justify-content-between">
            <a class="navbar-brand d-flex align-items-center justify-content-center" href="#" style="color:#843C0C; font-size:1.2rem;">
                <img src="./src/images/logo_ferreteria.png" alt="" width="50" height="50" class="d-inline-block align-text-center">
                Ferrexpress | Ventas
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
        </div>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav d-flex align-items-center justify-content-center"> <!--me-auto mb-3 mb-lg-0-->
                <li class="nav-item">
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav d-flex align-items-center justify-content-center"> 
                        <li class="nav-item">
                             <a class="nav-link active" aria-current="page" href="panel_control.php" style="color:#843C0C;">Salir</a>
                        </li>
                    </ul>
                </div> 
                </li>
            </ul>
        </div>
    </nav>

    <div class="container-fluid row d-flex justify-content-center">
        <form class="col-sm-2 col-md-3 pt-3" method="POST" onsubmit="convertirAMayusculas()">
            <h3 class="text-center color_h3">Registro de Ventas</h3>
            <?php
            include "model/conexion.php";
            include "controller/eliminar_ventas.php";
            include "controller/registro_ventas.php";

            /*
            <div class="mb-1">
                <label for="exampleInputEmail1" class="form-label">Producto:</label>
                echo '<div class="alert alert-danger">Existencia Mínima: ' . $consulta['descripcion'] . ' ¡No se puede adquirir!</div>';
                <select class="form-select" aria-label="Default select" name="descripcion_producto">
                    <option value="0" selected="">--Seleccione--</option>
                    <?php 
                    include "model/conexion.php";
                    $sql = "SELECT DISTINCT productos.descripcion FROM productos;";                
                    $resultado = mysqli_query($conexion, $sql);
                    while ($consulta = mysqli_fetch_array($resultado)) {
                        echo '<option value="' . $consulta['descripcion'] . '">' . $consulta['descripcion'] . '</option>';
                    }
                    ?>
                </select>
            </div>
            
            <div class="mb-1 mt-3">    
              <label for="exampleInputEmail1" class="form-label">Cantidad:</label>
              <input type="numer" class="form-control" name="cantidad_vendida" onkeyup="mayus(this);">
            </div>
            
            */
            ?>
            <div class="mb-1">
                <label for="exampleInputEmail1" class="form-label">Producto:</label>
                <select class="form-select" aria-label="Default select" name="descripcion_producto" id="descripcion_producto">
                    <option value="0" selected="">--Seleccione--</option>
                    <?php 
                    $sql = "SELECT DISTINCT productos.descripcion FROM productos WHERE estado = 1;";                
                    $resultado = mysqli_query($conexion, $sql);
                    while ($consulta = mysqli_fetch_array($resultado)) {
                        $selected = ($consulta['descripcion'] == $_POST['descripcion_producto']) ? 'selected' : '';
                        echo '<option value="' . $consulta['descripcion'] . '" ' . $selected . '>' . $consulta['descripcion'] . '</option>';
                    }
                    ?>
                </select>
            </div>
                
            <div class="mb-1 mt-3">    
                <label for="exampleInputEmail1" class="form-label">Cantidad:</label>
                <input type="number" class="form-control" name="cantidad_vendida" id="cantidad_vendida" onkeyup="mayus(this);">
            </div>

            <div class="mb-1 d-flex align-items-center justify-content-center">
                <button type="submit" class="btn mt-2" name="btnregistrar" value="ok" style="background-color:#813B0C; color:#ffffff;">Agregar</button>
            </div>
                
            </form>
    

        <div class="col-sm-2 col-md-3 pt-3">
            <h3 class="text-center color_h3">Total Ventas</h3>
            <?php
                include "model/conexion.php";

                // Realizar la consulta SQL y obtener el resultado
                $resultado = $conexion->query("SELECT SUM(subtotal) as total FROM detalleventas WHERE estado = 1;");

                // Verificar si la consulta se ejecutó correctamente
                if ($resultado) {
                    // Obtener la fila asociada al resultado
                    $fila = $resultado->fetch_assoc();
                
                    // Verificar si $fila['total'] está definido antes de asignar a $total
                    $total = isset($fila['total']) ? $fila['total'] : 0;
                
                    // Imprimir el resultado dentro del div
                    echo '<div class="alert alert-warning mt-4">Total: $ ' . number_format($total, 2, '.', ',') . '</div>';
                } else {
                    // Imprimir un mensaje de error si la consulta falla
                    echo '<div class="alert alert-danger">Error en la consulta: ' . $conexion->error . '</div>';
                }

                // Liberar el resultado de la consulta
                $resultado->free();

                // Cerrar la conexión a la base de datos
                $conexion->close();
            ?>


            <?php
            include "model/conexion.php";
                        
            // Realizar la consulta SQL y obtener el resultado
            $resultado = $conexion->query("SELECT SUM(subtotal) as total FROM detalleventas WHERE estado = 1;");
                        
            // Verificar si la consulta se ejecutó correctamente
            if ($resultado) {
                // Obtener la fila asociada al resultado
                $fila = $resultado->fetch_assoc();
                // Obtener el valor total de la fila
                $total = $fila['total'];
            }
            
            // Cerrar la conexión a la base de datos
            $conexion->close();
            ?>

            

            <form id="mainForm" class="col-12 pt-3" method="POST" action="registro_pagado_cliente.php" onsubmit="convertirAMayusculas()">
            
                <div class="mb-1 mt-1">
                    <label for="exampleInputEmail1" class="form-label">¿Cuánto pago?:</label>
                    <input type="number" class="form-control" name="cantidad_pago" id="cantidad_pago" onkeyup="calcularCambio()">
                </div>

                <div class="mb-1 d-flex align-items-center justify-content-center">
                    <button type="submit" class="btn mt-2" name="btn_registrar_pago" value="ok" style="background-color:#813B0C; color:#ffffff;">Agregar Pago</button>
                </div>
            </form>

           
            <!-- Script JavaScript -->
            <script>
            function calcularCambio() {
                // Obtener el valor total desde PHP
                var total = <?php echo $total; ?>;
            
                // Obtener la cantidad de pago del campo de texto
                var cantidad_pago = parseFloat(document.getElementById('cantidad_pago').value);
            
                // Validar si la cantidad de pago es un número válido
                if (!isNaN(cantidad_pago)) {
                    // Calcular el cambio
                    var cambio = cantidad_pago - total;
                
                    // Imprimir el resultado dentro del div de cambio
                    document.getElementById('cambio_resultado').innerHTML = 'Cambio: $ ' + cambio.toFixed(2).replace(/\d(?=(\d{3})+\.)/g, '$&,');
                    
                    // Mostrar la cantidad de pago en un nuevo div
                    document.getElementById('pago_resultado').innerHTML = 'Pago: $ ' + cantidad_pago.toFixed(2).replace(/\d(?=(\d{3})+\.)/g, '$&,');
                    
                    // Enviar los valores al servidor usando AJAX
                    enviarValoresAlServidor(cambio, cantidad_pago);
                } else {
                    // Si la cantidad de pago no es válida, mostrar un mensaje de error
                    document.getElementById('cambio_resultado').innerHTML = 'Ingresa una cantidad válida';
                    
                    // Limpiar el div de pago en caso de error
                    document.getElementById('pago_resultado').innerHTML = '';
                }
            }           
            </script>

            <!-- Resultado del cambio -->
            <div id="cambio_resultado" class="alert alert-warning mt-1"></div>

            <div class="mb-1 d-flex align-items-center justify-content-center">
                <button class="btn mt-1" style="background-color:#813B0C; color:#ffffff;"><a href="nota_remision.php" style="text-decoration:none; color:#ffffff;">Generar Nota de Venta</a></button>
            </div>
            <div class="mb-1 d-flex align-items-center justify-content-center">
                <button class="btn mt-1" style="background-color:#813B0C; color:#ffffff;"><a href="nueva_venta.php" style="text-decoration:none; color:#ffffff;">Generar Nueva Venta</a></button>
            </div>    
        </div>  

        <div class="col-sm-2 col-md-6 mt-3" style="max-height: 545px; overflow-y: auto;">
            <table class="table">
                <thead style="background-color: #E27526; ">
                    <tr>
                        <th style="color: #843C0C;" scope="col">#</th>
                        <th style="color: #843C0C;" scope="col">PRODUCTO</th>
                        <th style="color: #843C0C;" scope="col">CANTIDAD</th>
                        <th style="color: #843C0C;" scope="col">PRECIO VENTA</th>
                        <th style="color: #843C0C;" scope="col">SUBTOTAL</th>
                        <th style="color: #843C0C;" scope="col">FECHA</th>
                        <th style="color: #843C0C; display: none;" scope="col">ID PRODUCTO</th>
                    </tr>
                </thead>
                <tbody>
                    <?php 
                    include "model/conexion.php";                    
                    $sql = $conexion->query("SELECT id_detalleventa, descripcion_producto, cantidad_vendida, precio_unitario, subtotal, fecha, id_producto FROM detalleventas
                    WHERE detalleventas.estado = 1 ORDER BY detalleventas.id_detalleventa DESC;");
                    while ($datos = $sql->fetch_object()) { ?>
                        <tr>
                            <th><?php echo $datos->id_detalleventa; ?></th>
                            <td><?php echo $datos->descripcion_producto; ?></td>
                            <td><?php echo $datos->cantidad_vendida; ?></td>
                            <td><?php echo $datos->precio_unitario; ?></td>
                            <td><?php echo $datos->subtotal; ?></td>
                            <td><?php echo $datos->fecha; ?></td>
                            <td  style="display: none;"><?php echo $datos->id_producto; ?></td>
                            <td>
                                <a href="modificar_ventas.php?id=<?= $datos->id_detalleventa; ?>"><ion-icon style="color: #843C0C; font-size:2rem; background-color: #E27526; padding:1px; border-radius: 5px;" name="create-outline"></ion-icon></a>
                                <a href="ventas.php?id=<?= $datos->id_detalleventa; ?>"><ion-icon style="color: #843C0C; font-size:2rem; background-color: #E27526; padding:1px; border-radius: 5px;" name="trash-outline"></ion-icon></a>
                            </td>
                        </tr>
                    <?php } ?>
                </tbody>
            </table>             
        </div>
    </div>


    <!--Bootstrap JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    <!--CDN Iconicons-->
    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>

    <!--Script para los inputs pasarlos a MAYUSCULAS-->
    <script>
      function mayus(e) {
          e.value = e.value.toUpperCase();
      }
    </script>  
  </body>
</html>