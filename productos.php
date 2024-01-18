<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>🛠️ Ferreteria | Productos</title>
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
                Ferrexpress | Productos
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
        </div>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav d-flex align-items-center justify-content-center"> <!--me-auto mb-3 mb-lg-0-->
                <li class="nav-item">
                     <a class="nav-link active" aria-current="page" href="informacion_productos.php" style="color:#843C0C;">Productos</a>
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

    <div class="container-fluid row d-flex justify-content-center">
        <h3 class="text-center color_h3">Registro de Productos</h3>

        <?php
        include "model/conexion.php";
        include "controller/eliminar_productos.php"
        ?>

        <?php 
        include "controller/registro_productos.php";
        ?>

        <div class="col-sm-1 col-md-4 mt-3 pt-1">
            <form method="POST" onsubmit="convertirAMayusculas()">

                <div class="mb-1">
                  <label for="exampleInputEmail1" class="form-label">Descripción:</label>
                  <input type="text" class="form-control" name="descripcion" onkeyup="mayus(this);">
                </div>

                <div class="mb-1">
                <label for="exampleInputEmail1" class="form-label">Categoria:</label>
                <select class="form-select" aria-label="Default select" name="nombre_categoria">
                    <option value="0" selected="">--Seleccione--</option>
                    <?php 
                    include "model/conexion.php";
                    $sql = "SELECT DISTINCT categorias.nombre_categoria FROM categorias;";                
                    $resultado = mysqli_query($conexion, $sql);
                    while ($consulta = mysqli_fetch_array($resultado)) {
                        echo '<option value="' . $consulta['nombre_categoria'] . '">' . $consulta['nombre_categoria'] . '</option>';
                    }
                    ?>
                </select>
                </div>
                
                <div class="mb-1">
                <label for="exampleInputEmail1" class="form-label">Marca:</label>
                <select class="form-select" aria-label="Default select" name="nombre_marca">
                    <option value="0" selected="">--Seleccione--</option>
                    <?php 
                    include "model/conexion.php";
                    $sql = "SELECT DISTINCT marcas.nombre_marca FROM marcas;";                
                    $resultado = mysqli_query($conexion, $sql);
                    while ($consulta = mysqli_fetch_array($resultado)) {
                        echo '<option value="' . $consulta['nombre_marca'] . '">' . $consulta['nombre_marca'] . '</option>';
                    }
                    ?>
                </select>
                </div>

                <div class="mb-1">
                <label for="exampleInputEmail1" class="form-label">Proveedor:</label>
                <select class="form-select" aria-label="Default select" name="nombre_proveedor">
                    <option value="0" selected="">--Seleccione--</option>
                    <?php 
                    include "model/conexion.php";
                    $sql = "SELECT DISTINCT proveedores.nombre_proveedor FROM proveedores;";                
                    $resultado = mysqli_query($conexion, $sql);
                    while ($consulta = mysqli_fetch_array($resultado)) {
                        echo '<option value="' . $consulta['nombre_proveedor'] . '">' . $consulta['nombre_proveedor'] . '</option>';
                    }
                    ?>
                </select>
                </div>
        </div>  

        <div class="col-sm-1 col-md-4 mt-3 pt-1">      
                <div class="mb-1">
                  <label for="exampleInputEmail1" class="form-label">Precio Compra:</label>
                  <input type="number" class="form-control" name="precio_compra" onkeyup="mayus(this);">
                </div>

                <div class="mb-1">
                  <label for="exampleInputEmail1" class="form-label">Precio Venta:</label>
                  <input type="number" class="form-control" name="precio_venta" onkeyup="mayus(this);">
                </div>

                <div class="mb-1">
                  <label for="exampleInputEmail1" class="form-label">Serie Producto:</label>
                  <input type="text" class="form-control" name="numero_serie" onkeyup="mayus(this);">
                </div
                
                <div class="mb-1">
                  <label for="exampleInputEmail1" class="form-label">Existencia:</label>
                  <input type="number" class="form-control" name="existencia" onkeyup="mayus(this);">
                </div       
            </form>
                <div class="mb-1 d-flex align-items-center justify-content-center">
                      <button type="submit" class="btn mt-2 col-4" name="btnregistrar" value="ok" style="background-color:#813B0C; color:#ffffff;">Agregar</button>
                </div> 
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