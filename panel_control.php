<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>🛠️ Ferreteria | Panel de Control</title>
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
                Ferrexpress | Panel de Control
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
        </div>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav d-flex align-items-center justify-content-center"> 
                <li class="nav-item">
                     <a class="nav-link active" aria-current="page" href="index.php" style="color:#843C0C;">Salir</a>
                </li>
            </ul>
        </div>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav d-flex align-items-center justify-content-center"> 
                <li class="nav-item">
                <button onclick="window.location.href='./src/REVISTA_DE_PRODUCTOS_FERREXPRESS.pdf'" style="background-color:#843C0C; color:#ffffff; border:none; cursor: pointer;">Revista</button>
                </li>
            </ul>
        </div>
    </nav>

    <div class="container-fluid row d-flex justify-content-center mt-3 p-3">
        <div class="row d-flex justify-content-center gap-5">
            
            <div class="card" style="width: 18rem; background-color:#E27526;">
                <img src="./src/images/producto.png" class="card-img-top p-3" alt="producto" >
                <div class="card-body">
                  <h5 class="card-title" style="color:#FFFFFF;">GESTION DE PRODUCTOS</h5>
                  <a href="informacion_productos.php" class="btn" style="color:#FFFFFF; background-color:#843C0C;">Ir a productos</a>
                </div>
             </div>


            <div class="card" style="width: 18rem; background-color:#E27526;">
                <img src="./src/images/categorias.png"class="card-img-top p-3" alt="producto" >
                <div class="card-body">
                  <h5 class="card-title" style="color:#FFFFFF;">GESTION DE CATEGORIAS</h5>
                  <a href="categorias.php" class="btn" style="color:#FFFFFF; background-color:#843C0C;">Ir a categorias</a>
                </div>
             </div>


            <div class="card" style="width: 18rem; background-color:#E27526;">
                <img src="./src/images/marca.png"class="card-img-top p-3" alt="producto" >
                <div class="card-body">
                  <h5 class="card-title" style="color:#FFFFFF;">GESTION DE MARCAS</h5>
                  <a href="marcas.php" class="btn" style="color:#FFFFFF; background-color:#843C0C;">Ir a marcas</a>
                </div>
             </div>


            <div class="card" style="width: 18rem; background-color:#E27526;">
                <img src="./src/images/repartidor.png"class="card-img-top p-3" alt="producto" >
                <div class="card-body">
                  <h5 class="card-title" style="color:#FFFFFF;" >GESTION DE PROVEEDORES</h5>
                  <a href="proveedores.php" class="btn" style="color:#FFFFFF; background-color:#843C0C;">Ir a proveedores</a>
                </div>
             </div>

             <div class="card" style="width: 18rem; background-color:#E27526;">
                <img src="./src/images/compras.png"class="card-img-top p-3" alt="producto" >
                <div class="card-body">
                  <h5 class="card-title" style="color:#FFFFFF;" >GESTION DE COMPRAS</h5>
                  <a href="compras.php" class="btn" style="color:#FFFFFF; background-color:#843C0C;">Ir a compras</a>
                </div>
             </div> 

             <div class="card" style="width: 18rem; background-color:#E27526;">
                <img src="./src/images/ventas.png"class="card-img-top p-3" alt="producto" >
                <div class="card-body">
                  <h5 class="card-title" style="color:#FFFFFF;" >GESTION DE VENTAS</h5>
                  <a href="ventas.php" class="btn" style="color:#FFFFFF; background-color:#843C0C;">Ir a ventas</a>
                </div>
             </div> 

             <div class="card" style="width: 18rem; background-color:#E27526;">
                <img src="./src/images/reportes.png"class="card-img-top p-3" alt="producto" >
                <div class="card-body">
                  <h5 class="card-title" style="color:#FFFFFF;" >GESTION DE REPORTES</h5>
                  <a href="reportes_venta.php" class="btn" style="color:#FFFFFF; background-color:#843C0C;">Reporte por venta</a>
                </div>
             </div> 

             <div class="card" style="width: 18rem; background-color:#E27526;">
                <img src="./src/images/carrito.png"class="card-img-top p-3" alt="producto" >
                <div class="card-body">
                  <h5 class="card-title" style="color:#FFFFFF;" >CARRITO DE COMPRAS</h5>
                  <a href="carrito.php" class="btn" style="color:#FFFFFF; background-color:#843C0C;">Ir a carrito de compras</a>
                </div>
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