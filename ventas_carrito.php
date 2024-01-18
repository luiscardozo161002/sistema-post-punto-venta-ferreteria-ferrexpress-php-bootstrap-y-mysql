<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>🛠️ Ferreteria | Ventas Carrito </title>
    <!--Bootstrap CSS-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <!--Hoja de estilos-->
    <link rel="stylesheet" href="./src/css/style_productos.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light color_navbar p-3">
        <div class="container-fluid d-flex align-items-center justify-content-between">
            <a class="navbar-brand d-flex align-items-center justify-content-center" href="#" style="color:#843C0C; font-size:2rem;">
                <img src="./src/images/logo_ferreteria.png" alt="" width="60" height="60" class="d-inline-block align-text-center">
                Ferrexpress | Ventas Carrito
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
        </div>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav d-flex align-items-center justify-content-center"> <!--me-auto mb-3 mb-lg-0-->
                <li class="nav-item">
                     <a class="nav-link active" aria-current="page" href="index.php">Inicio</a>
                </li>
                <li class="nav-item">
                     <a class="nav-link active" aria-current="page" href="informacion_productos.php">Productos</a>
                </li>
                <li class="nav-item">
                     <a class="nav-link active" aria-current="page" href="categorias.php">Categorias</a>
                </li>
                <li class="nav-item">
                     <a class="nav-link active" aria-current="page" href="#">Ventas</a>
                </li>
                <li class="nav-item">
                     <a class="nav-link active" aria-current="page" href="#">Informes</a>
                </li>
                <li class="nav-item">
                     <a class="nav-link active" aria-current="page" href="#">Salir</a>
                </li>
            </ul>
        </div>
    </nav>
    
    <div class="col-6 mt-3 d-flex justify-content-center align-items-center" style="max-height: 545px; overflow-y: auto;">
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