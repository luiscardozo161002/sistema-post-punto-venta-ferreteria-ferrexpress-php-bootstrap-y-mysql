<?php
include "model/conexion.php";

if (!empty($_POST["descripcion_producto"])) {
    $descripcion = $_POST["descripcion_producto"];

    $sql = $conexion->prepare("SELECT
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
    WHERE p.estado = 1 AND LOWER(p.descripcion) LIKE LOWER(?)
    ORDER BY p.id_producto DESC");

    $descripcion_like = "%".strtolower($descripcion)."%";
    $sql->bind_param("s", $descripcion_like);
    $sql->execute();
    $result = $sql->get_result();

    while ($datos = $result->fetch_object()) { ?>
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
    <?php }    
} else {
    // Si no se proporciona una descripción, puedes manejarlo según tus necesidades
    echo '<tr><td colspan="10">Por favor, ingrese una descripción para buscar productos.</td></tr>';
}
?>
