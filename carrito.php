<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>🛠️ Ferreteria | Carrito de Compras </title>
    <!--Bootstrap CSS-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <!--Hoja de estilos-->
    <link rel="stylesheet" href="./src/css/style_productos.css">
    <link rel="stylesheet" href="./src/css/style_carrito.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light color_navbar p-3">
        <div class="container-fluid d-flex align-items-center justify-content-between">
            <a class="navbar-brand d-flex align-items-center justify-content-center" href="#" style="color:#843C0C; font-size:1rem;">
                <img src="./src/images/logo_ferreteria.png" alt="" width="50" height="50" class="d-inline-block align-text-center">
                Ferrexpress | Carrito de Compras
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

    <!-- Coloca el formulario alrededor de tu contenido -->
    <div class="container-fluid d-flex row justify-content-center">
    <form class="col-sm-4 col-md-12 pt-3" method="POST" onsubmit="convertirAMayusculas()">
        <h3 class="text-center color_h3">Carrito de Compras</h3>

        <?php
        include "model/conexion.php";
        include "controller/eliminar_ventas.php"
        ?>

        <?php
        include "controller/registro_ventas_carrito.php";
        ?>

        <div class="mb-1 row d-flex justify-content-center">
            <?php
            include "model/conexion.php";
            $sql = "SELECT descripcion,nombre_marca FROM productos INNER JOIN marcas ON productos.id_marca = marcas.id_marca;";
            $resultado = mysqli_query($conexion, $sql);

            while ($consulta = mysqli_fetch_array($resultado)) {  

                $descripcion_p = $consulta['descripcion'];
                $sqlExistencia = $conexion->query("SELECT existencia FROM productos WHERE descripcion = '$descripcion_p';");
                $resultadoExistencia = $sqlExistencia->fetch_assoc();
                $existencia = $resultadoExistencia['existencia'];

                echo '<div class="col-sm-2 col-md-2 card m-3 d-flex justify-content-center" style="background-color:#E27526;">';
                echo '<div class="card-body">';
                echo '<form method="POST">';
                echo '<input type="hidden" name="descripcion_producto" value="' . $consulta['descripcion'] . '">'; 
                echo '<p class="card-title" style="font-size:15px; color:#ffffff;">' . $consulta['descripcion'] . '</p>';
                echo '<p class="card-title" style="font-size:10px; color:#ffffff;">' . $consulta['nombre_marca'] . '</p>';
                echo '<div class="input-group mb-1">';

                // Mostrar el mensaje según la existencia
                if ($existencia <= 15) {
                    echo '<div class="alert alert-danger">Existencia Mínima: ' . $consulta['descripcion'] . ' ¡No se puede adquirir!</div>';
                    echo '<input hidden type="number" class="form-control" name="cantidad_vendida" style="width: 30px;" id="cantidad_' . $consulta['descripcion'] . '" min="0" value="0" onkeyup="mayus(this);" readonly data-producto="' . $consulta['descripcion'] . '">';
                    echo '<button hidden class="btn btn-outline-secondary" style="background-color:#FEBF00; border:1px solid #ffffff; color:#ffffff;" type="button" onclick="incrementarCantidad(\'cantidad_' . $consulta['descripcion'] . '\')">+</button>';
                    echo '<button hidden class="btn btn-outline-secondary" style="background-color:#FEBF00; border:1px solid #ffffff; color:#ffffff;" type="button" onclick="decrementarCantidad(\'cantidad_' . $consulta['descripcion'] . '\')">-</button>';
                    echo '<div class="m-2  d-none align-items-center justify-content-center">';
                    echo '<button type="submit" class="btn mt-2" name="btnregistrar" value="ok" style="background-color:#813B0C; color:#ffffff;">Agregar al carrito</button>';
                    echo '</div>';
                }else{
                    echo '<input type="number" class="form-control" name="cantidad_vendida" style="width: 30px;" id="cantidad_' . $consulta['descripcion'] . '" min="0" value="0" onkeyup="mayus(this);" readonly>';
                    echo '<button class="btn btn-outline-secondary" style="background-color:#FEBF00; border:1px solid #ffffff; color:#ffffff;" type="button" onclick="incrementarCantidad(\'cantidad_' . $consulta['descripcion'] . '\', ' . $existencia . ')">+</button>';
                    echo '<button class="btn btn-outline-secondary" style="background-color:#FEBF00; border:1px solid #ffffff; color:#ffffff;" type="button" onclick="decrementarCantidad(\'cantidad_' . $consulta['descripcion'] . '\')">-</button>';
                    
                    /* 
                    <input type="number" class="form-control" name="cantidad_vendida" id="cantidad_' . $consulta['id_producto'] . '" min="0" value="0" onkeyup="mayus(this);" readonly>
                    <button class="btn btn-outline-secondary" type="button" onclick="incrementarCantidad(\'cantidad_' . $consulta['id_producto'] . '\', ' . $consulta['existencia'] . ')">+</button>
                    <button class="btn btn-outline-secondary" type="button" onclick="decrementarCantidad(\'cantidad_' . $consulta['id_producto'] . '\')">-</button>                    
                    */
                                
                    echo '<div class="m-2 d-flex align-items-center justify-content-center">';
                    echo '<button type="submit" class="btn mt-2" name="btnregistrar" value="ok" style="background-color:#813B0C; color:#ffffff;">Agregar al carrito</button>';
                    echo '</div>';
                }    
                // Cierra el formulario dentro de la tarjeta
                echo '</form>';
                // Fin del contenido de la tarjeta
                echo '</div>';
                echo '</div>';
                // Cierra el formulario para cada tarjeta
                echo '</div>';
            }
            ?>
        </div>    
    </form>
    </div>

    <script>
        function mostrarAlerta(mensaje) {
            var alertContainer = document.getElementById('customAlert');
            var alertMessage = document.getElementById('alertMessage');

            alertMessage.textContent = mensaje;
            alertContainer.style.display = 'block';
        }

        function cerrarAlerta() {
            var alertContainer = document.getElementById('customAlert');
            alertContainer.style.display = 'none';
        }
    </script>

    
    <div id="customAlert" class="custom-alert">
    <span id="alertMessage"></span>
    <button onclick="cerrarAlerta()">Cerrar</button>
    </div>

    <script>
        function incrementarCantidad(inputId, existencia) {
            var cantidadInput = document.getElementById(inputId);
            var cantidadActual = parseInt(cantidadInput.value);

            // Incrementa la cantidad solo si no excede la existencia
            if (cantidadActual < existencia - 15) {
                cantidadInput.value = cantidadActual + 1;
            } else {
                mostrarAlerta('¡La cantidad, excede la existencia mínima!');
            }
        }

        function decrementarCantidad(inputId) {
            var cantidadInput = document.getElementById(inputId);
            var cantidadActual = parseInt(cantidadInput.value);

            // Decrementa la cantidad solo si es mayor que cero
            if (cantidadActual > 0) {
                cantidadInput.value = cantidadActual - 1;
            }
        }
    </script>





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