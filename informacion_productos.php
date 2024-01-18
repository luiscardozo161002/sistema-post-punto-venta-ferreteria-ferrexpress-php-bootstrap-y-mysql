<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>🛠️ Ferreteria | Productos</title>
    <!--Bootstrap CSS-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

    <!--Hoja de estilos-->
    <link rel="stylesheet" href="./src/css/style_productos.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light color_navbar p-3">
        <div class="container-fluid d-flex align-items-center justify-content-between">
            <a class="navbar-brand" href="#" style="color:#843C0C; font-size:1.2rem;">
                <img src="./src/images/logo_ferreteria.png" alt="" width="50" height="50" class="d-inline-block align-text-center">
                Ferrexpress | Productos
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
        </div>
    
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav d-flex align-items-center justify-content-center"> <!--me-auto mb-3 mb-lg-0-->
                <li class="nav-item">
                     <a class="nav-link active" aria-current="page" href="productos.php" style="color:#843C0C;">Registrar</a>
                </li>
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

    <div class="container-fluid row d-flex justify-content-center" style="max-height: 550px; overflow-y: auto;">
        <div class="col-md-9 col-sm-6 p-4">

        <div class="mb-1 pb-2">
            <h5 class="text-center" style="color:#843C0C; font-size:2rem;">Buscar Producto</h5>

            <form id="formBuscarProducto">
                <div class="input-group">
                    <input type="text" class="form-control" id="buscar_descripcion_producto" onkeyup="mayus(this);" placeholder="Ingresa la descripción del producto">
                    <div class="input-group-append">
                        <button type="button" class="btn btn-search" style="background-color:#843C0C; color:#ffffff;">Buscar</button>
                    </div>
                </div>
            </form>
        </div>

        <script>
        $(document).ready(function() {
          $(".btn-search").click(function() {
                var descripcion = $("#buscar_descripcion_producto").val();
            
                console.log("Descripción a buscar:", descripcion);
            
                // Realizar la solicitud AJAX
                $.ajax({
                    type: "POST",
                    url: "buscar_productos.php",
                    data: { 
                        descripcion_producto: descripcion
                    },
                    success: function(response) {
                        console.log("Respuesta de AJAX:", response);
                        $("#resultadosProductos").html(response);
                    },
                    error: function(jqXHR, textStatus, errorThrown) {
                        console.error("Error en la solicitud AJAX:", textStatus, errorThrown);
                    }
                });
                
            });
        });
        </script>
            <table class="table">
                <thead style="background-color: #E27526;">
                    <tr>
                        <th style="color: #843C0C;" scope="col">#</th>
                        <th style="color: #843C0C;" scope="col">DESCRIPCION</th>
                        <th style="color: #843C0C;" scope="col">CATEGORIA</th>
                        <th style="color: #843C0C;" scope="col">MARCA</th>
                        <th style="color: #843C0C;" scope="col">PROVEEDOR</th>
                        <th style="color: #843C0C;" scope="col">PRECIO COMPRA</th>
                        <th style="color: #843C0C;" scope="col">PRECIO VENTA</th>
                        <th style="color: #843C0C;" scope="col">NUM. SERIE</th>
                        <th style="color: #843C0C;" scope="col">EXISTENCIA</th>
                        <th style="color: #843C0C;" scope="col"></th>
                    </tr>
                </thead>
                <tbody id="resultadosProductos">
                    <?php 
                    include "model/conexion.php";                    
                    $sql = $conexion->query("SELECT
                        p.id_producto,
                        p.descripcion,
                        c.nombre_categoria,
                        m.nombre_marca,
                        pr.nombre_proveedor,
                        p.precio_compra,
                        p.precio_venta,
                        p.numero_serie,
                        p.existencia
                    FROM
                        productos p
                    INNER JOIN categorias c ON p.id_categoria = c.id_categoria
                    INNER JOIN marcas m ON p.id_marca = m.id_marca
                    INNER JOIN proveedores pr ON p.id_proveedor = pr.id_proveedor
                    WHERE p.estado = 1
                    ORDER BY p.id_producto DESC;");
                    while ($datos = $sql->fetch_object()) { ?>
                        <tr>
                            <th><?php echo $datos->id_producto; ?></th>
                            <td><?php echo $datos->descripcion; ?></td>
                            <td><?php echo $datos->nombre_categoria; ?></td>
                            <td><?php echo $datos->nombre_marca; ?></td>
                            <td><?php echo $datos->nombre_proveedor; ?></td>
                            <td>$<?php echo $datos->precio_compra; ?></td>
                            <td>$<?php echo $datos->precio_venta; ?></td>
                            <td><?php echo $datos->numero_serie; ?></td>
                            <td><?php echo $datos->existencia; ?> PZS</td>
                            <td>
                                <a href="modificar_productos.php?id=<?= $datos->id_producto; ?>"><ion-icon style="color: #843C0C; font-size:2rem; background-color: #E27526; padding:1px; border-radius: 5px;" name="create-outline"></ion-icon></a>
                                <a href="productos.php?id=<?= $datos->id_producto; ?>"><ion-icon style="color: #843C0C; font-size:2rem; background-color: #E27526; padding:1px; border-radius: 5px;" name="trash-outline"></ion-icon></a>
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