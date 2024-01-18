<?php
require 'fpdf186/fpdf.php';

// Define la función remove_junk si no está definida
if (!function_exists('remove_junk')) {
    function remove_junk($string)
    {
        // Implementa la lógica de limpieza según tus necesidades
        // Por ejemplo, puedes usar la función strip_tags para quitar las etiquetas HTML
        return strip_tags($string);
    }
}

// Crear el objeto PDF
$pdf = new FPDF();
$pdf->AddPage();
$pdf->SetFont('Arial', 'B', 15);

// Encabezado del PDF
// Agregar un logo y el nombre de la ferretería
$pdf->Image('src/images/logo_ferreteria.png', 10, 10, 10);
$pdf->Cell(10); // Agrega un espacio entre el logo y el nombre
$pdf->Cell(90, 10, 'Ferreteria | Ferrexpress', 0, 0); // Cambia 'Nombre de la Ferretería' por el nombre real

$pdf->SetFillColor(235, 190, 65);
$pdf->Cell(90, 10, 'REPORTE DE VENTA', 1, 1, 'C',1);



include "model/conexion.php";


// Realizar la consulta SQL y obtener el resultado
$sql = $conexion->query("SELECT descripcion_producto, cantidad_vendida, precio_unitario, subtotal, fecha, id_producto 
                         FROM detalleventas
                         WHERE estado = 1
                         ORDER BY id_detalleventa DESC");

// Verificar si hay resultados
if ($sql && $sql->num_rows > 0) {


    $pdf->SetFillColor(41, 161, 221);
    $pdf->Ln(10);
    $pdf->SetFont('Arial', '', 7, 'C');
    $pdf->Cell(60, 10, 'Producto', 1, 0, 'C', 1);
    $pdf->Cell(20, 10, 'Precio', 1, 0, 'C', 1);
    $pdf->Cell(30, 10, 'Cantidad', 1, 0, 'C', 1);
    $pdf->Cell(40, 10, 'Subtotal', 1, 0, 'C', 1);
    $pdf->Cell(40, 10, 'Fecha y Hora', 1, 1, 'C', 1);


    // Agrega los datos de la tabla al PDF
    while ($datos = $sql->fetch_object()) {
        $pdf->Cell(60, 10, remove_junk($datos->descripcion_producto), 1);
        $pdf->Cell(20, 10, remove_junk($datos->precio_unitario), 1);
        $pdf->Cell(30, 10, remove_junk($datos->cantidad_vendida), 1);
        $pdf->Cell(40, 10, remove_junk($datos->subtotal), 1);
        $pdf->Cell(40, 10, date('Y-m-d H:i:s', strtotime($datos->fecha)), 1);
        $pdf->Ln();
    }

    // Total y Utilidad
    $pdf->SetFillColor(255, 243, 205);
    $pdf->Ln(10);
    $resultado = $conexion->query("SELECT SUM(subtotal) as total FROM detalleventas WHERE estado = 1
    ORDER BY id_detalleventa");
    $fila = $resultado->fetch_assoc();
    $total = $fila['total'];
    $pdf->Cell(50, 10, 'Total', 1, 0, 'C', 1); // El último parámetro "1" indica que se utilizará el color de fondo
    $pdf->Cell(40, 10, '$' . number_format($total, 2), 1, 1, 'C', 1); // El último parámetro "1" indica que se agregará un salto de línea
    

    $pdf->SetFillColor(37, 208, 102);
    $pdf->Ln(2);
    $resultado = $conexion->query("SELECT SUM(subtotal) - SUM(precio_compra) AS utilidad_total
                                   FROM detalleventas
                                   JOIN productos ON detalleventas.id_producto = productos.id_producto WHERE detalleventas.estado = 1");
    $fila = $resultado->fetch_assoc();
    $utilidad_total = $fila['utilidad_total'];
    $pdf->Cell(50, 10, 'Utilidad', 1, 0,'C',1);
    $pdf->Cell(40, 10, '$' . number_format($utilidad_total, 2), 1, 1, 'C', 1);
       
    
    // Mostrar el PDF
    $pdf->Output();
    exit;
} else {
    // Manejar el caso en que no hay resultados
    echo '<div style="background-color: #F8BB00; font-size:4rem; text-align:center; margin: 0; padding: 0; box-sizing: border-box;
    font-family: sans-serif;">No hay resultados para mostrar en el PDF</div>';

    echo '<div style="background-color: #F8BB00; font-size:4rem; text-align:center; margin: 0; padding: 0; box-sizing: border-box;
    font-family: sans-serif;">¡Porfavor, Registre Ventas!</div>';
}

// Liberar el resultado de la consulta
$sql->free();

// Cerrar la conexión a la base de datos
$conexion->close();
?>
