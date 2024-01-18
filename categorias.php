<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>🛠️ Ferreteria | Categorias</title>
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
                Ferrexpress | Categorias
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
        <form class="col-sm-1 col-md-3  pt-3" method="POST" onsubmit="convertirAMayusculas()">
            <h3 class="text-center color_h3">Registro de Categorias</h3>
            <?php
            include "model/conexion.php";
            include "controller/eliminar_categorias.php"
            ?>

            <?php 
            include "controller/registro_categorias.php";
            ?>

            <div class="mb-1 mt-3">
              <label for="exampleInputEmail1" class="form-label">Categoria:</label>
              <input type="text" class="form-control" name="categoria" onkeyup="mayus(this);">
            </div>
            
            <div class="mb-1 d-flex align-items-center justify-content-center">
              <button type="submit" class="btn mt-2" name="btnregistrar" value="ok" style="background-color:#813B0C; color:#ffffff;">Agregar</button>
            </div>
        </form>

        <div class="col-sm-1 col-md-3 p-4" style="max-height: 500px; overflow-y: auto;">
            <table class="table">
                <thead style="background-color: #E27526;">
                    <tr>
                        <th style="color: #843C0C;" scope="col">#</th>
                        <th style="color: #843C0C;" scope="col">DESCRIPCION</th>
                    </tr>
                </thead>
                <tbody>
                    <?php 
                    include "model/conexion.php";                    
                    $sql = $conexion->query("SELECT * FROM categorias c WHERE c.estado = 1 ORDER BY c.id_categoria DESC;");
                    while ($datos = $sql->fetch_object()) { ?>
                        <tr>
                            <th><?php echo $datos->id_categoria; ?></th>
                            <td><?php echo $datos->nombre_categoria; ?></td>
                            <td>
                                <a href="modificar_categorias.php?id=<?= $datos->id_categoria; ?>"><ion-icon style="color: #843C0C; font-size:2rem; background-color: #E27526; padding:1px; border-radius: 5px;" name="create-outline"></ion-icon></a>
                                <a href="categorias.php?id=<?= $datos->id_categoria; ?>"><ion-icon style="color: #843C0C; font-size:2rem; background-color: #E27526; padding:1px; border-radius: 5px;" name="trash-outline"></ion-icon></a>
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