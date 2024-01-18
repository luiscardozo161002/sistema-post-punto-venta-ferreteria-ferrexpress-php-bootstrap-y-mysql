<?php 
    include "model/conexion.php";

    //Recolectar el id 
    $id = $_GET["id"];

    $consulta_datos = $conexion->query("SELECT productos.descripcion,
                                        categorias.nombre_categoria, 
                                        marcas.nombre_marca, 
                                        proveedores.nombre_proveedor, 
                                        productos.precio_compra, 
                                        productos.precio_venta,
                                        productos.numero_serie,
                                        productos.existencia
                                FROM productos
                                INNER JOIN categorias ON productos.id_categoria = categorias.id_categoria
                                INNER JOIN marcas ON productos.id_marca = marcas.id_marca
                                INNER JOIN proveedores ON productos.id_proveedor = proveedores.id_proveedor
                                WHERE productos.id_producto = $id;");    

    //Verifica si la consulta se ejecutó correctamente
    if(!$consulta_datos){
        die("Error en la consulta: " . mysqli_error($conexion));
    }
    ?>
        <!DOCTYPE html>
        <html lang="en">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>🛠️ Ferreteria | Modificar Productos</title>
            <!--Bootstrap CSS-->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
            
            <!--Hoja de estilos-->
            <link rel="stylesheet" href="./src/css/style_productos.css">
        </head>
        <body>
        <nav class="navbar navbar-expand-lg navbar-light color_navbar p-3">
                <div class="container-fluid d-flex align-items-center justify-content-between">
                    <a class="navbar-brand" href="#" style="color:#843C0C; font-size:1.2rem;">
                        <img src="./src/images/logo_ferreteria.png" alt="" width="50" height="50" class="d-inline-block align-text-center">
                        Ferrexpress | Modificar Productos
                    </a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                      <span class="navbar-toggler-icon"></span>
                    </button>
                </div>
            
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav d-flex align-items-center justify-content-center"> 
                        <li class="nav-item">
                             <a class="nav-link active" aria-current="page" href="productos.php" style="color:#843C0C;">Salir</a>
                        </li>
                    </ul>
                </div>
            </nav>
            
            <div class="container-fluid columns d-flex align-items-center justify-content-center">  
                <form class="col-md-3 col-sm-3 pt-1" method="POST">
                        <h3 class="text-center color_h3">Modificar Productos</h3>
                        
                        <input type="hidden" name="id" value="<?php echo $_GET["id"]; ?>">

                        <?php   
                            include "controller/modificar_productos.php";
                        ?>

                        <?php
                            //Obtener una sola fila de resultados
                            while($datos=$consulta_datos->fetch_object()){ 
                        ?>
                        <div class="mb-1 mt-1">
                            <label for="exampleInputEmail1" class="form-label">Descripción:</label>
                            <input type="text" class="form-control" name="descripcion" value="<?= $datos -> descripcion ?>" onkeyup="mayus(this);"> 
                        </div>
                  
                        <div class="mb-1">
                            <label for="exampleInputEmail1" class="form-label">Categoria:</label>
                            <select class="form-select" aria-label="Default select" name="nombre_categoria">
                                <option value="0">--Seleccione--</option>
                                <?php 
                                include "model/conexion.php";
                                $sqlCategorias = "SELECT categorias.nombre_categoria FROM categorias;";                
                                $resultadoCategorias = mysqli_query($conexion, $sqlCategorias);
                                while ($consultaCategoria = mysqli_fetch_array($resultadoCategorias)) {
                                    $selected = ($consultaCategoria['nombre_categoria'] == $datos->nombre_categoria) ? 'selected' : '';
                                    echo '<option value="' . $consultaCategoria['nombre_categoria'] . '" ' . $selected . '>' . $consultaCategoria['nombre_categoria'] . '</option>';
                                }
                                ?>
                            </select>
                        </div>
                            
                        <div class="mb-1">
                            <label for="exampleInputEmail1" class="form-label">Marca:</label>
                            <select class="form-select" aria-label="Default select" name="nombre_marca">
                                <option value="0">--Seleccione--</option>
                                <?php 
                                include "model/conexion.php";
                                $sqlMarcas = "SELECT marcas.nombre_marca FROM marcas;";                
                                $resultadoMarcas = mysqli_query($conexion, $sqlMarcas);
                                while ($consultaMarca = mysqli_fetch_array($resultadoMarcas)) {
                                    $selected = ($consultaMarca['nombre_marca'] == $datos->nombre_marca) ? 'selected' : '';
                                    echo '<option value="' . $consultaMarca['nombre_marca'] . '" ' . $selected . '>' . $consultaMarca['nombre_marca'] . '</option>';
                                }
                                ?>
                            </select>
                        </div>
                            
                        <div class="mb-1">
                            <label for="exampleInputEmail1" class="form-label">Proveedor:</label>
                            <select class="form-select" aria-label="Default select" name="nombre_proveedor">
                                <option value="0">--Seleccione--</option>
                                <?php 
                                include "model/conexion.php";
                                $sqlProveedores = "SELECT proveedores.nombre_proveedor FROM proveedores;";                
                                $resultadoProveedores = mysqli_query($conexion, $sqlProveedores);
                                while ($consultaProveedor = mysqli_fetch_array($resultadoProveedores)) {
                                    $selected = ($consultaProveedor['nombre_proveedor'] == $datos->nombre_proveedor) ? 'selected' : '';
                                    echo '<option value="' . $consultaProveedor['nombre_proveedor'] . '" ' . $selected . '>' . $consultaProveedor['nombre_proveedor'] . '</option>';
                                }
                                ?>
                            </select>
                        </div>

                              
                        <div class="mb-1">
                            <label for="exampleInputEmail1" class="form-label">Precio Compra:</label>
                            <input type="number" class="form-control" name="precio_compra" value="<?= $datos -> precio_compra?>" onkeyup="mayus(this);">
                        </div>
                              
                        <div class="mb-1">
                          <label for="exampleInputEmail1" class="form-label">Precio Venta:</label>
                          <input type="number" class="form-control" name="precio_venta" value="<?= $datos -> precio_venta ?>" onkeyup="mayus(this);">
                        </div>  
                        
                        <div class="mb-1">
                          <label for="exampleInputEmail1" class="form-label">Serie Producto:</label>
                          <input type="text" class="form-control" name="numero_serie" value="<?= $datos -> numero_serie ?>" onkeyup="mayus(this);">
                        </div> 
                        
                        <div class="mb-1">
                          <label for="exampleInputEmail1" class="form-label">Existencia:</label>
                          <input type="number" class="form-control" name="existencia" value="<?= $datos -> existencia ?>" onkeyup="mayus(this);">
                        </div     
                        <?php          
                            }
                        ?>
                        <div class="mb-1 d-flex align-items-center justify-content-center">
                            <button type="submit" class="btn mt-2 col-4" name="btnactualizar" value="ok" style="background-color:#813B0C; color:#ffffff;">Actualizar</button>       
                        </div>

                </form>
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