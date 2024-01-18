/*
 Navicat Premium Data Transfer

 Source Server         : AdministrationDataBase
 Source Server Type    : MySQL
 Source Server Version : 80030
 Source Host           : localhost:3306
 Source Schema         : bd_ferreteria_ferrexpress

 Target Server Type    : MySQL
 Target Server Version : 80030
 File Encoding         : 65001

 Date: 04/01/2024 15:41:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bitacora
-- ----------------------------
DROP TABLE IF EXISTS `bitacora`;
CREATE TABLE `bitacora`  (
  `id_bitacora` int(0) NOT NULL AUTO_INCREMENT,
  `id_producto` int(0) NOT NULL,
  `fecha` datetime(0) NOT NULL,
  `cantidad` int unsigned NOT NULL,
  `subtotal` decimal(19, 2) NOT NULL,
  PRIMARY KEY (`id_bitacora`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for categorias
-- ----------------------------
DROP TABLE IF EXISTS `categorias`;
CREATE TABLE `categorias`  (
  `id_categoria` int(0) NOT NULL AUTO_INCREMENT,
  `nombre_categoria` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `estado` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_categoria`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of categorias
-- ----------------------------
INSERT INTO `categorias` VALUES (1, 'AISLANTES', '1');
INSERT INTO `categorias` VALUES (3, 'ELECTRICA', '1');
INSERT INTO `categorias` VALUES (4, 'PRODUCTOS INTERIORES', '1');
INSERT INTO `categorias` VALUES (5, 'PINTURAS EN AEROSOL', '1');
INSERT INTO `categorias` VALUES (6, 'PINZAS PARA ACERO', '1');
INSERT INTO `categorias` VALUES (7, 'COSAS DE LA CASA', '1');

-- ----------------------------
-- Table structure for detallecompras
-- ----------------------------
DROP TABLE IF EXISTS `detallecompras`;
CREATE TABLE `detallecompras`  (
  `id_detallecompra` int(0) NOT NULL AUTO_INCREMENT,
  `id_producto` int(0) NULL DEFAULT NULL,
  `cantidad_comprada` int unsigned NOT NULL,
  `precio_unitario` decimal(19, 2) UNSIGNED NOT NULL DEFAULT 0.00,
  `subtotal` decimal(19, 2) UNSIGNED NOT NULL DEFAULT 0.00,
  `fecha` datetime(6) NULL DEFAULT NULL,
  `id_proveedor` int(0) NOT NULL,
  `estado` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1',
  `descripcion_producto` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_detallecompra`) USING BTREE,
  INDEX `id_producto`(`id_producto`) USING BTREE,
  INDEX `id_proveedor_fk`(`id_proveedor`) USING BTREE,
  CONSTRAINT `detallecompras_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `id_proveedor_fk` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id_proveedor`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of detallecompras
-- ----------------------------
INSERT INTO `detallecompras` VALUES (1, 4, 4, 30.00, 150.00, '2023-12-22 20:58:47.000000', 5, '0', '');
INSERT INTO `detallecompras` VALUES (2, 4, 5, 30.00, 150.00, '2024-01-03 10:34:25.000000', 1, '0', 'FOCO');
INSERT INTO `detallecompras` VALUES (3, 4, 5, 30.00, 150.00, '2024-01-03 10:53:59.000000', 1, '0', 'FOCO');
INSERT INTO `detallecompras` VALUES (4, 4, 5, 30.00, 150.00, '2024-01-03 11:00:40.000000', 1, '0', 'KG DE CABLE DE COBRE 220VLTS');
INSERT INTO `detallecompras` VALUES (5, 8, 18, 30.00, 150.00, '2024-01-03 12:58:48.000000', 1, '0', 'PALA DE PUNTA CURVA');
INSERT INTO `detallecompras` VALUES (6, 8, 55, 500.00, 27500.00, '2024-01-03 17:13:01.000000', 1, '1', 'KG DE CABLE DE COBRE 220VLTS');

-- ----------------------------
-- Table structure for detalleventas
-- ----------------------------
DROP TABLE IF EXISTS `detalleventas`;
CREATE TABLE `detalleventas`  (
  `id_detalleventa` int(0) NOT NULL AUTO_INCREMENT,
  `descripcion_producto` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `cantidad_vendida` int unsigned NULL,
  `precio_unitario` decimal(19, 2) UNSIGNED NULL DEFAULT 0.00,
  `subtotal` decimal(19, 2) UNSIGNED NULL DEFAULT 0.00,
  `fecha` datetime(6) NULL DEFAULT NULL,
  `estado` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1',
  `id_producto` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id_detalleventa`) USING BTREE,
  INDEX `id_producto`(`descripcion_producto`) USING BTREE,
  INDEX `id_producto_fk`(`id_producto`) USING BTREE,
  CONSTRAINT `id_producto_fk` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 95 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of detalleventas
-- ----------------------------
INSERT INTO `detalleventas` VALUES (21, 'FOCO', 15, 60.00, 300.00, '2023-12-23 13:40:56.000000', '0', 4);
INSERT INTO `detalleventas` VALUES (22, 'KG DE CABLE DE COBRE 220VLTS', 15, 700.00, 10500.00, '2023-12-23 13:51:26.000000', '0', 8);
INSERT INTO `detalleventas` VALUES (23, 'PROBADOR DE CORRIENTE DE 120VTS', 13, 70.00, 910.00, '2023-12-23 13:52:22.000000', '0', 11);
INSERT INTO `detalleventas` VALUES (27, 'FOCO', 3, 60.00, 180.00, '2023-12-23 14:05:15.000000', '0', 4);
INSERT INTO `detalleventas` VALUES (28, 'PROBADOR DE CORRIENTE DE 120VTS', 5, 70.00, 350.00, '2023-12-23 14:05:38.000000', '0', 11);
INSERT INTO `detalleventas` VALUES (29, 'KG DE CABLE DE COBRE 220VLTS', 3, 700.00, 2100.00, '2023-12-23 14:06:54.000000', '0', 8);
INSERT INTO `detalleventas` VALUES (30, 'FOCO', 3, 45.00, 135.00, '2023-12-23 15:16:13.000000', '0', 4);
INSERT INTO `detalleventas` VALUES (31, 'FOCO', 5, 60.00, 300.00, '2023-12-23 15:16:13.000000', '0', 4);
INSERT INTO `detalleventas` VALUES (32, 'FOCO', 5, 60.00, 300.00, '2023-12-23 15:16:13.000000', '0', 4);
INSERT INTO `detalleventas` VALUES (33, 'MANGO DE PICO', 3, 120.00, 360.00, '2023-12-23 17:48:13.000000', '0', 15);
INSERT INTO `detalleventas` VALUES (34, 'FOCO', 18, 60.00, 900.00, '2023-12-23 17:48:32.000000', '0', 4);
INSERT INTO `detalleventas` VALUES (35, 'CINTA DE AISLAR', 35, 70.00, 2450.00, '2023-12-24 08:35:26.000000', '0', 12);
INSERT INTO `detalleventas` VALUES (36, 'CINTA DE AISLAR', 4, 70.00, 280.00, '2023-12-24 08:35:59.000000', '0', 12);
INSERT INTO `detalleventas` VALUES (37, 'CINTA DE AISLAR', 5, 70.00, 350.00, '2023-12-24 08:36:05.000000', '0', 12);
INSERT INTO `detalleventas` VALUES (38, 'KG DE CABLE DE COBRE 220VLTS', 3, 700.00, 2100.00, '2023-12-24 08:36:32.000000', '0', 8);
INSERT INTO `detalleventas` VALUES (39, 'PROBADOR DE CORRIENTE DE 120VTS', 3, 70.00, 210.00, '2023-12-24 08:54:59.000000', '0', 11);
INSERT INTO `detalleventas` VALUES (40, 'MANGO DE PICO', 2, 120.00, 240.00, '2023-12-24 08:55:18.000000', '0', 15);
INSERT INTO `detalleventas` VALUES (41, 'CINTA DE AISLAR', 4, 70.00, 280.00, '2023-12-24 09:47:37.000000', '0', 12);
INSERT INTO `detalleventas` VALUES (42, 'KG DE CABLE DE COBRE 220VLTS', 3, 700.00, 2100.00, '2023-12-24 09:50:32.000000', '0', 8);
INSERT INTO `detalleventas` VALUES (43, 'KG DE CABLE DE COBRE 220VLTS', 2, 700.00, 1400.00, '2023-12-24 09:53:13.000000', '0', 8);
INSERT INTO `detalleventas` VALUES (44, 'KG DE CABLE DE COBRE 220VLTS', 3, 700.00, 2100.00, '2023-12-24 18:04:51.000000', '0', 8);
INSERT INTO `detalleventas` VALUES (45, 'FOCO', 1, 60.00, 60.00, '2023-12-26 11:18:30.000000', '0', 4);
INSERT INTO `detalleventas` VALUES (46, 'PROBADOR DE CORRIENTE DE 120VTS', 3, 70.00, 210.00, '2023-12-26 13:48:52.000000', '0', 11);
INSERT INTO `detalleventas` VALUES (47, 'FOCO', 1, 60.00, 60.00, '2023-12-26 13:51:25.000000', '0', 4);
INSERT INTO `detalleventas` VALUES (48, 'CINTA DE AISLAR', 3, 70.00, 140.00, '2023-12-26 13:55:10.000000', '0', 12);
INSERT INTO `detalleventas` VALUES (49, 'CINTA DE AISLAR', 2, 70.00, 140.00, '2023-12-26 14:02:09.000000', '0', 12);
INSERT INTO `detalleventas` VALUES (50, 'KG DE CABLE DE COBRE 220VLTS', 3, 700.00, 2100.00, '2023-12-26 14:02:15.000000', '0', 8);
INSERT INTO `detalleventas` VALUES (51, 'CABLE DE COBRE DE 220V', 2, 300.00, 600.00, '2023-12-26 14:02:21.000000', '0', 21);
INSERT INTO `detalleventas` VALUES (52, 'KG DE CABLE DE COBRE 220VLTS', 1, 700.00, 700.00, '2023-12-26 14:04:07.000000', '0', 8);
INSERT INTO `detalleventas` VALUES (53, 'PROBADOR DE CORRIENTE DE 120VTS', 1, 70.00, 70.00, '2023-12-26 14:04:12.000000', '0', 11);
INSERT INTO `detalleventas` VALUES (54, 'FOCO DE LUZ INTENSA', 5, 50.00, 50.00, '2023-12-26 14:04:14.000000', '0', 14);
INSERT INTO `detalleventas` VALUES (55, 'KG DE CABLE DE COBRE 220VLTS', 1, 700.00, 700.00, '2023-12-26 14:54:47.000000', '0', 8);
INSERT INTO `detalleventas` VALUES (56, 'FOCO', 3, 60.00, 180.00, '2023-12-26 14:56:02.000000', '0', 4);
INSERT INTO `detalleventas` VALUES (57, 'MANGO DE PICO', 2, 120.00, 240.00, '2023-12-26 14:56:09.000000', '0', 15);
INSERT INTO `detalleventas` VALUES (58, 'FOCO AHORRADOR', 1, 60.00, 60.00, '2023-12-26 14:57:52.000000', '0', 17);
INSERT INTO `detalleventas` VALUES (59, 'KG DE CABLE DE COBRE 220VLTS', 1, 700.00, 700.00, '2023-12-26 14:58:35.000000', '0', 8);
INSERT INTO `detalleventas` VALUES (60, 'PROBADOR DE CORRIENTE DE 120VTS', 1, 70.00, 70.00, '2023-12-26 15:01:07.000000', '0', 11);
INSERT INTO `detalleventas` VALUES (61, 'FOCO', 1, 60.00, 60.00, '2023-12-26 15:22:24.000000', '0', 4);
INSERT INTO `detalleventas` VALUES (62, 'FOCO AHORRADOR', 2, 60.00, 120.00, '2023-12-26 16:05:54.000000', '0', 17);
INSERT INTO `detalleventas` VALUES (63, 'CINTA DE AISLAR', 2, 70.00, 140.00, '2023-12-26 19:41:14.000000', '0', 12);
INSERT INTO `detalleventas` VALUES (64, 'FOCO', 1, 60.00, 60.00, '2023-12-28 12:26:46.000000', '0', 4);
INSERT INTO `detalleventas` VALUES (65, 'CINTA DE AISLAR', 35, 70.00, 2450.00, '2023-12-28 12:33:52.000000', '0', 12);
INSERT INTO `detalleventas` VALUES (66, 'FOCO', 5, 60.00, 300.00, '2023-12-28 13:16:11.000000', '0', 4);
INSERT INTO `detalleventas` VALUES (67, 'FOCO', 5, 60.00, 300.00, '2023-12-28 14:19:30.000000', '0', 4);
INSERT INTO `detalleventas` VALUES (68, 'FOCO', 25, 60.00, 1500.00, '2023-12-28 14:52:56.000000', '0', 4);
INSERT INTO `detalleventas` VALUES (69, 'FOCO', 30, 60.00, 1800.00, '2023-12-28 14:55:59.000000', '0', 4);
INSERT INTO `detalleventas` VALUES (70, 'PINZAS PEQUEÑAS', 5, 50.00, 250.00, '2023-12-31 12:52:08.000000', '0', 22);
INSERT INTO `detalleventas` VALUES (71, 'PINZAS PEQUEÑAS', 5, 50.00, 250.00, '2023-12-31 12:53:21.000000', '0', 22);
INSERT INTO `detalleventas` VALUES (72, 'PINZAS PEQUEÑAS', 5, 50.00, 250.00, '2023-12-31 12:54:02.000000', '0', 22);
INSERT INTO `detalleventas` VALUES (73, 'PINZAS PEQUEÑAS', 5, 50.00, 250.00, '2024-01-01 20:00:49.000000', '0', 22);
INSERT INTO `detalleventas` VALUES (74, 'FOCO', 5, 60.00, 300.00, '2024-01-01 20:16:47.000000', '0', 4);
INSERT INTO `detalleventas` VALUES (75, 'CINTA DE AISLAR(PANDOQUIT)', 5, 70.00, 350.00, '2024-01-02 10:24:30.000000', '0', 13);
INSERT INTO `detalleventas` VALUES (76, 'FOCO', 3, 60.00, 180.00, '2024-01-02 10:24:49.000000', '0', 4);
INSERT INTO `detalleventas` VALUES (77, 'KG DE CABLE DE COBRE 220VLTS', 1, 700.00, 700.00, '2024-01-02 10:49:10.000000', '0', 8);
INSERT INTO `detalleventas` VALUES (78, 'FOCO', 2, 60.00, 120.00, '2024-01-02 10:49:36.000000', '0', 4);
INSERT INTO `detalleventas` VALUES (79, 'PINZAS PEQUEÑAS', 1, 50.00, 50.00, '2024-01-02 10:58:21.000000', '0', 22);
INSERT INTO `detalleventas` VALUES (80, 'CABLE DE COBRE DE 220V', 2, 300.00, 600.00, '2024-01-02 11:32:20.000000', '0', 21);
INSERT INTO `detalleventas` VALUES (81, 'FOCO', 2, 60.00, 120.00, '2024-01-02 11:57:15.000000', '0', 4);
INSERT INTO `detalleventas` VALUES (82, 'CABLE DE COBRE DE 220V', 3, 300.00, 900.00, '2024-01-02 11:57:21.000000', '0', 21);
INSERT INTO `detalleventas` VALUES (83, 'FOCO', 3, 60.00, 180.00, '2024-01-02 11:59:53.000000', '0', 4);
INSERT INTO `detalleventas` VALUES (84, 'FOCO DE LZ VERDE', 7, 90.00, 630.00, '2024-01-02 13:50:05.000000', '0', 18);
INSERT INTO `detalleventas` VALUES (85, 'CABLE DE COBRE DE 220V', 22, 300.00, 6600.00, '2024-01-02 13:54:53.000000', '0', 21);
INSERT INTO `detalleventas` VALUES (86, 'CABLE DE COBRE DE 220V', 2, 300.00, 600.00, '2024-01-02 17:12:20.000000', '0', 21);
INSERT INTO `detalleventas` VALUES (87, 'CABLE DE COBRE DE 220V', 50, 300.00, 15000.00, '2024-01-02 17:16:00.000000', '0', 21);
INSERT INTO `detalleventas` VALUES (88, 'CABLE DE COBRE DE 220V', 15, 300.00, 4500.00, '2024-01-02 18:41:21.000000', '0', 21);
INSERT INTO `detalleventas` VALUES (89, 'FOCO', 4, 60.00, 240.00, '2024-01-02 18:52:55.000000', '0', 4);
INSERT INTO `detalleventas` VALUES (90, 'FOCO', 18, 60.00, 1080.00, '2024-01-02 18:53:00.000000', '0', 4);
INSERT INTO `detalleventas` VALUES (91, 'FOCO', 2, 60.00, 120.00, '2024-01-02 18:53:32.000000', '0', 4);
INSERT INTO `detalleventas` VALUES (92, 'FOCO', 1, 60.00, 60.00, '2024-01-02 19:21:31.000000', '0', 4);
INSERT INTO `detalleventas` VALUES (93, 'FOCO', 1, 60.00, 60.00, '2024-01-02 21:13:18.000000', '0', 4);
INSERT INTO `detalleventas` VALUES (94, 'PROBADOR DE CORRIENTE DE 120VTS', 3, 70.00, 210.00, '2024-01-03 17:12:23.000000', '1', 11);

-- ----------------------------
-- Table structure for marcas
-- ----------------------------
DROP TABLE IF EXISTS `marcas`;
CREATE TABLE `marcas`  (
  `id_marca` int(0) NOT NULL AUTO_INCREMENT,
  `nombre_marca` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `estado` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_marca`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of marcas
-- ----------------------------
INSERT INTO `marcas` VALUES (1, 'PANDOQUIT', '1');
INSERT INTO `marcas` VALUES (2, 'TRUPPER', '1');
INSERT INTO `marcas` VALUES (3, 'BOSCH', '1');
INSERT INTO `marcas` VALUES (4, 'PRETUL', '1');
INSERT INTO `marcas` VALUES (6, 'MAKITA', '1');
INSERT INTO `marcas` VALUES (7, 'BEYOTA PRO', '1');
INSERT INTO `marcas` VALUES (8, 'RIGHTMATH PRO', '1');

-- ----------------------------
-- Table structure for productos
-- ----------------------------
DROP TABLE IF EXISTS `productos`;
CREATE TABLE `productos`  (
  `id_producto` int(0) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_categoria` int(0) NULL DEFAULT NULL,
  `id_marca` int(0) NULL DEFAULT NULL,
  `id_proveedor` int(0) NULL DEFAULT NULL,
  `precio_compra` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00,
  `precio_venta` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00,
  `numero_serie` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `existencia` decimal(10, 2) NOT NULL,
  `estado` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_producto`) USING BTREE,
  INDEX `id_categoria`(`id_categoria`) USING BTREE,
  INDEX `id_marca`(`id_marca`) USING BTREE,
  INDEX `id_proveedor`(`id_proveedor`) USING BTREE,
  CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `productos_ibfk_2` FOREIGN KEY (`id_marca`) REFERENCES `marcas` (`id_marca`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of productos
-- ----------------------------
INSERT INTO `productos` VALUES (4, 'FOCO', 3, 1, 2, 30.00, 60.00, 'BDEUBU3H734', 40.00, '1');
INSERT INTO `productos` VALUES (8, 'KG DE CABLE DE COBRE 220VLTS', 3, 1, 1, 500.00, 700.00, 'E3J94KRKMFEN', 254.00, '1');
INSERT INTO `productos` VALUES (11, 'PROBADOR DE CORRIENTE DE 120VTS', 1, 1, 1, 50.00, 70.00, 'E339FR94K0R40', 20.00, '1');
INSERT INTO `productos` VALUES (12, 'CINTA DE AISLAR(TRUPPER)', 1, 2, 2, 50.00, 70.00, 'EI3JR849DJ3J9JR', 54.00, '1');
INSERT INTO `productos` VALUES (13, 'CINTA DE AISLAR(PANDOQUIT)', 1, 1, 1, 50.00, 70.00, 'EW38JIR49EK03', 18.00, '1');
INSERT INTO `productos` VALUES (14, 'FOCO DE LUZ INTENSA', 1, 1, 1, 25.00, 50.00, 'E388ER949JR49', 56.00, '1');
INSERT INTO `productos` VALUES (15, 'MANGO DE PICO', 4, 3, 5, 70.00, 120.00, 'NE3IJEI94RJ495', 234.00, '1');
INSERT INTO `productos` VALUES (16, 'PALA DE PUNTA CURVA', 4, 2, 5, 50.00, 70.00, 'DENID3NI4NIN', 234.00, '1');
INSERT INTO `productos` VALUES (17, 'FOCO AHORRADOR', 1, 1, 1, 30.00, 60.00, 'BDEUBU3H734', 23.00, '1');
INSERT INTO `productos` VALUES (18, 'FOCO DE LZ VERDE', 1, 1, 1, 70.00, 90.00, 'DNEIDNEIDMEIDME', 49.00, '1');
INSERT INTO `productos` VALUES (19, 'PINSAS DE PRESION', 1, 1, 1, 45.00, 50.00, 'NIDIEMIFMRIFMRI', 346.00, '1');
INSERT INTO `productos` VALUES (20, 'DISCO 50 PULGADAS', 1, 1, 1, 30.00, 60.00, 'BDEUBU3H734', 50.00, '1');
INSERT INTO `productos` VALUES (21, 'CABLE DE COBRE DE 220V', 1, 1, 1, 250.00, 300.00, 'ND3UHNE3HN8', 16.00, '1');
INSERT INTO `productos` VALUES (22, 'PINZAS PEQUEÑAS', 1, 1, 1, 35.00, 50.00, 'BEYE2Y45', 44.00, '1');

-- ----------------------------
-- Table structure for proveedores
-- ----------------------------
DROP TABLE IF EXISTS `proveedores`;
CREATE TABLE `proveedores`  (
  `id_proveedor` int(0) NOT NULL AUTO_INCREMENT,
  `nombre_proveedor` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `telefono_proveedor` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `direccion_proveedor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `estado` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1',
  PRIMARY KEY (`id_proveedor`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of proveedores
-- ----------------------------
INSERT INTO `proveedores` VALUES (1, 'ANGEL LUGO PUENTE', '5562381216', 'S.A. DE C.V. PANQUIT', '1');
INSERT INTO `proveedores` VALUES (2, 'HUGO NOGUEZ ', '5567431623', 'S.A. DE C.V TRUPPER', '1');
INSERT INTO `proveedores` VALUES (3, 'JOSE RAMON', '5567897654', 'S.A. DE C.V PROVEEDOR', '1');
INSERT INTO `proveedores` VALUES (4, 'JOSE JUAN RAMOS BALTAZAR', '5567544125', 'SA DE CV ACEROS OAXACA', '1');
INSERT INTO `proveedores` VALUES (5, 'JOSE ALBERTO', '5534123467', 'SA DE CV COLORES DE MEXICO', '1');

-- ----------------------------
-- Procedure structure for ActualizarAlmacen
-- ----------------------------
DROP PROCEDURE IF EXISTS `ActualizarAlmacen`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarAlmacen`(
		IN p_id INT,
    IN p_descripcion VARCHAR(50),
    IN p_direccion VARCHAR(50),
		IN p_ubicacionproductos VARCHAR(50)
)
BEGIN
    UPDATE almacen
		SET descripcion = p_descripcion,
				direccion = p_direccion,
				ubicacionproductos = p_ubicacionproductos
		WHERE id = p_id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for ActualizarCategoria
-- ----------------------------
DROP PROCEDURE IF EXISTS `ActualizarCategoria`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarCategoria`(
    IN p_nombre_categoria VARCHAR(50),
    IN p_id_categoria INT
)
BEGIN
    UPDATE categorias
    SET nombre_categoria = p_nombre_categoria
    WHERE id_categoria = p_id_categoria;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for ActualizarCompra
-- ----------------------------
DROP PROCEDURE IF EXISTS `ActualizarCompra`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarCompra`(
    IN p_id_detalle_compra INT,
    IN p_descripcion_producto VARCHAR(50),
    IN p_cantidad_comprada INT,
    IN p_nombre_proveedor VARCHAR(50)
)
BEGIN
    UPDATE detallecompras
    SET descripcion_producto = p_descripcion_producto,
        cantidad_comprada = p_cantidad_comprada,
        id_proveedor = (SELECT id_proveedor FROM proveedores WHERE nombre_proveedor COLLATE utf8mb4_general_ci = p_nombre_proveedor)
    WHERE id_detallecompra = p_id_detalle_compra;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for ActualizarMarca
-- ----------------------------
DROP PROCEDURE IF EXISTS `ActualizarMarca`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarMarca`(
    IN p_nombre_marca VARCHAR(50),
    IN p_id_marca INT
)
BEGIN
    UPDATE marcas
		SET nombre_marca = p_nombre_marca
		WHERE id_marca = p_id_marca;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for ActualizarProducto
-- ----------------------------
DROP PROCEDURE IF EXISTS `ActualizarProducto`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarProducto`(
    IN p_id INT,
    IN p_descripcion_producto VARCHAR(100),
    IN p_nombre_categoria VARCHAR(50),
    IN p_nombre_marca VARCHAR(50),
    IN p_nombre_proveedor VARCHAR(100),
    IN p_precio_compra DECIMAL(10, 2),
    IN p_precio_venta DECIMAL(10, 2),
		IN numero_serie VARCHAR(50),
		IN existencia DECIMAL(10,2)
)
BEGIN
    UPDATE productos
    SET descripcion = p_descripcion_producto,
        id_categoria = (
            SELECT id_categoria
            FROM categorias
            WHERE nombre_categoria = p_nombre_categoria COLLATE utf8mb4_general_ci
            LIMIT 1
        ),
        id_marca = (
            SELECT id_marca
            FROM marcas
            WHERE nombre_marca = p_nombre_marca COLLATE utf8mb4_general_ci
            LIMIT 1
        ),
        id_proveedor = (
            SELECT id_proveedor
            FROM proveedores
            WHERE nombre_proveedor = p_nombre_proveedor COLLATE utf8mb4_general_ci
            LIMIT 1
        ),
        precio_compra = p_precio_compra,
        precio_venta = p_precio_venta,
				numero_serie = numero_serie,
				existencia = existencia
    WHERE id_producto = p_id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for ActualizarProveedor
-- ----------------------------
DROP PROCEDURE IF EXISTS `ActualizarProveedor`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarProveedor`(
    IN p_id_proveedor INT,
    IN p_nombre_proveedor VARCHAR(50),
    IN p_telefono_proveedor VARCHAR(50),
    IN p_direccion_proveedor VARCHAR(50)
)
BEGIN
    UPDATE proveedores
    SET nombre_proveedor = p_nombre_proveedor,
        telefono_proveedor = p_telefono_proveedor,
        direccion_proveedor = p_direccion_proveedor
    WHERE id_proveedor = p_id_proveedor;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for ActualizarSerializacionProducto
-- ----------------------------
DROP PROCEDURE IF EXISTS `ActualizarSerializacionProducto`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarSerializacionProducto`(IN p_id_serie INT, IN p_nombre_producto VARCHAR(50), IN p_numero_serie VARCHAR(50))
BEGIN
    -- Actualizar el número de serie si el producto existe
    UPDATE serializacion
    SET numero_serie = p_numero_serie,
        id_producto = (SELECT productos.id_producto FROM productos 
                       WHERE productos.descripcion COLLATE utf8mb4_general_ci = p_nombre_producto COLLATE utf8mb4_general_ci)
    WHERE id_serializacion = p_id_serie;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for ActualizarStock
-- ----------------------------
DROP PROCEDURE IF EXISTS `ActualizarStock`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarStock`(
    IN p_id INT,
    IN p_descripcion_producto VARCHAR(50),
    IN p_cantidad INT,
    IN p_descripcion_almacen VARCHAR(50),
    IN p_nombre_proveedor VARCHAR(50)
)
BEGIN
    DECLARE v_id_producto INT;
    DECLARE v_id_almacen INT;
    DECLARE v_id_proveedor INT;

    -- Obtener el id_producto con la misma collación que la columna productos.descripcion
    SELECT id_producto INTO v_id_producto
    FROM productos
    WHERE descripcion COLLATE utf8mb4_general_ci = p_descripcion_producto COLLATE utf8mb4_general_ci
    LIMIT 1;

    -- Obtener el id_almacen con la misma collación que la columna almacen.descripcion
    SELECT id INTO v_id_almacen
    FROM almacen
    WHERE descripcion COLLATE utf8mb4_general_ci = p_descripcion_almacen COLLATE utf8mb4_general_ci
    LIMIT 1;

    -- Obtener el id_proveedor con la misma collación que la columna proveedores.nombre_proveedor
    SELECT id_proveedor INTO v_id_proveedor
    FROM proveedores
    WHERE nombre_proveedor COLLATE utf8mb4_general_ci = p_nombre_proveedor COLLATE utf8mb4_general_ci
    LIMIT 1;

    UPDATE stock
    SET id_producto = v_id_producto,
        cantidad = p_cantidad,
        id_almacen = v_id_almacen,
        id_proveedores = v_id_proveedor
    WHERE id_stock = p_id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for ActualizarVenta
-- ----------------------------
DROP PROCEDURE IF EXISTS `ActualizarVenta`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarVenta`(
		IN p_id_detalle_venta INT,
		IN p_cantidad_vendida INT
)
BEGIN
    UPDATE detalleventas
    SET cantidad_vendida = p_cantidad_vendida
    WHERE id_detalleventa = p_id_detalle_venta;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for BuscarProductoPorLetra
-- ----------------------------
DROP PROCEDURE IF EXISTS `BuscarProductoPorLetra`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `BuscarProductoPorLetra`(
    IN p_letra VARCHAR(50)
)
BEGIN
    SET @filtro = CONCAT('%', p_letra, '%') COLLATE utf8mb4_general_ci;

    SELECT descripcion
    FROM productos
    WHERE descripcion LIKE @filtro COLLATE utf8mb4_general_ci;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for EliminarAlmacenPorEstado
-- ----------------------------
DROP PROCEDURE IF EXISTS `EliminarAlmacenPorEstado`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarAlmacenPorEstado`(
    IN p_id_almacen INT
)
BEGIN
    UPDATE almacen SET estado = 0 WHERE id = p_id_almacen;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for EliminarCategoriaPorEstado
-- ----------------------------
DROP PROCEDURE IF EXISTS `EliminarCategoriaPorEstado`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarCategoriaPorEstado`(
    IN p_id_categoria INT
)
BEGIN
    UPDATE categorias SET estado = 0 WHERE id_categoria = p_id_categoria;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for EliminarCompraPorEstado
-- ----------------------------
DROP PROCEDURE IF EXISTS `EliminarCompraPorEstado`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarCompraPorEstado`(
    IN p_id_detallecompra INT
)
BEGIN
    UPDATE detallecompras SET estado = 0 WHERE id_detallecompra = p_id_detallecompra;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for EliminarMarcaPorEstado
-- ----------------------------
DROP PROCEDURE IF EXISTS `EliminarMarcaPorEstado`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarMarcaPorEstado`(
    IN p_id_marca INT
)
BEGIN
    UPDATE marcas SET estado = 0 WHERE id_marca = p_id_marca;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for EliminarNumeroSerieProductoPorEstado
-- ----------------------------
DROP PROCEDURE IF EXISTS `EliminarNumeroSerieProductoPorEstado`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarNumeroSerieProductoPorEstado`(
	IN p_id_serializacion INT
)
BEGIN
		UPDATE serializacion SET estado = 0 WHERE id_serializacion = p_id_serializacion;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for EliminarProductoPorEstado
-- ----------------------------
DROP PROCEDURE IF EXISTS `EliminarProductoPorEstado`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarProductoPorEstado`(
    IN p_id_producto INT
)
BEGIN
    UPDATE productos SET estado = 0 WHERE id_producto = p_id_producto;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for EliminarProveedorPorEstado
-- ----------------------------
DROP PROCEDURE IF EXISTS `EliminarProveedorPorEstado`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarProveedorPorEstado`(
    IN p_id_proveedor INT
)
BEGIN
    UPDATE proveedores SET estado = 0 WHERE id_proveedor = p_id_proveedor;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for EliminarStockPorEstado
-- ----------------------------
DROP PROCEDURE IF EXISTS `EliminarStockPorEstado`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarStockPorEstado`(
    IN p_id_stock INT
)
BEGIN
    UPDATE stock SET estado = 0 WHERE id_stock = p_id_stock;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for EliminarVentaPorEstado
-- ----------------------------
DROP PROCEDURE IF EXISTS `EliminarVentaPorEstado`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarVentaPorEstado`(
	IN p_id_detalleventa INT
)
BEGIN
	UPDATE detalleventas SET estado = 0 WHERE id_detalleventa = p_id_detalleventa;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for InsertarAlmacen
-- ----------------------------
DROP PROCEDURE IF EXISTS `InsertarAlmacen`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarAlmacen`(
	IN p_descripcion VARCHAR(50),
	IN p_direccion VARCHAR(50),
	IN p_ubicacionproductos VARCHAR(50)
)
BEGIN 
		INSERT INTO almacen (id, descripcion, direccion, ubicacionproductos) 
		VALUES (DEFAULT,p_descripcion,p_direccion, p_ubicacionproductos);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for InsertarCategoria
-- ----------------------------
DROP PROCEDURE IF EXISTS `InsertarCategoria`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarCategoria`(p_nombre_categoria VARCHAR(50))
BEGIN
    INSERT INTO categorias(id_categoria, nombre_categoria) VALUES (DEFAULT, p_nombre_categoria);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for InsertarCompra
-- ----------------------------
DROP PROCEDURE IF EXISTS `InsertarCompra`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarCompra`(
    IN p_descripcion_producto VARCHAR(50),
    IN p_cantidad_comprada INT,
    IN p_proveedor_nombre VARCHAR(255)
)
BEGIN
    DECLARE v_precio_compra DECIMAL(10, 2);
    DECLARE v_id_producto INT;
    DECLARE v_existencia_anterior INT;
    DECLARE v_id_proveedor INT;

    -- Obtener el precio de compra del producto y su ID
    SELECT id_producto, precio_compra INTO v_id_producto, v_precio_compra
    FROM productos
    WHERE descripcion = p_descripcion_producto COLLATE utf8mb4_0900_ai_ci
    LIMIT 1;

    -- Obtener el stock actual del producto
    SELECT existencia INTO v_existencia_anterior
    FROM productos
    WHERE id_producto = v_id_producto;

    -- Actualizar el stock en la tabla productos
    UPDATE productos
    SET existencia = v_existencia_anterior + p_cantidad_comprada
    WHERE id_producto = v_id_producto;

    -- Obtener el ID del proveedor
    SELECT id_proveedor INTO v_id_proveedor
    FROM proveedores
    WHERE nombre_proveedor = p_proveedor_nombre COLLATE utf8mb4_0900_ai_ci
    LIMIT 1;

    -- Insertar en la tabla detallecompras
    INSERT INTO detallecompras (
        id_detallecompra,
        id_producto,
        cantidad_comprada,
        precio_unitario,
        subtotal,
        fecha,
        id_proveedor,
        estado,
        descripcion_producto
    )
    VALUES (
        DEFAULT,
        v_id_producto,
        p_cantidad_comprada,
        v_precio_compra,
        (p_cantidad_comprada * v_precio_compra),
        CURRENT_TIMESTAMP,
        v_id_proveedor,
        DEFAULT,
        p_descripcion_producto
    );
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for InsertarMarca
-- ----------------------------
DROP PROCEDURE IF EXISTS `InsertarMarca`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarMarca`(p_nombre_marca VARCHAR(50))
BEGIN
    INSERT INTO marcas(id_marca,nombre_marca) VALUES (DEFAULT, p_nombre_marca);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for InsertarProducto
-- ----------------------------
DROP PROCEDURE IF EXISTS `InsertarProducto`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarProducto`(
    IN descripcion_producto VARCHAR(100),
    IN nombre_categoria VARCHAR(50),
    IN nombre_marca VARCHAR(50),
    IN nombre_proveedor VARCHAR(100),
    IN precio_compra DECIMAL(10, 2),
    IN precio_venta DECIMAL(10, 2),
		IN numero_serie VARCHAR(50),
		IN existencia DECIMAL(10,2)
)
BEGIN
    DECLARE categoria_id, marca_id, proveedor_id INT;

    -- Obtener el ID de la categoría
    SELECT id_categoria INTO categoria_id FROM categorias WHERE nombre_categoria = nombre_categoria LIMIT 1;

    -- Obtener el ID de la marca
    SELECT id_marca INTO marca_id FROM marcas WHERE nombre_marca = nombre_marca LIMIT 1;

    -- Obtener el ID del proveedor
    SELECT id_proveedor INTO proveedor_id FROM proveedores WHERE nombre_proveedor = nombre_proveedor LIMIT 1;

    -- Insertar el nuevo producto con los IDs obtenidos
    INSERT INTO productos(descripcion, id_categoria, id_marca, id_proveedor, precio_compra, precio_venta, numero_serie, existencia)
    VALUES (descripcion_producto, categoria_id, marca_id, proveedor_id, precio_compra, precio_venta, numero_serie, existencia);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for InsertarProveedores
-- ----------------------------
DROP PROCEDURE IF EXISTS `InsertarProveedores`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarProveedores`(p_nombre_proveedor VARCHAR(50), 
								 p_telefono_proveedor VARCHAR(50), 
								 p_direccion_proveedor VARCHAR(50))
BEGIN
    INSERT INTO proveedores(id_proveedor, nombre_proveedor, telefono_proveedor, direccion_proveedor) 
		VALUES (DEFAULT, p_nombre_proveedor, p_telefono_proveedor, p_direccion_proveedor);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for InsertarSerializacionProducto
-- ----------------------------
DROP PROCEDURE IF EXISTS `InsertarSerializacionProducto`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarSerializacionProducto`(IN p_nombre_producto VARCHAR(50), IN p_numero_serie VARCHAR(50))
BEGIN
    DECLARE v_id_producto INT;

    -- Obtener el id_producto con la misma collación que la columna productos.descripcion
    SELECT productos.id_producto INTO v_id_producto
    FROM productos
    WHERE productos.descripcion COLLATE utf8mb4_general_ci = p_nombre_producto COLLATE utf8mb4_general_ci;

    INSERT INTO serializacion (id_producto, numero_serie) VALUES (v_id_producto, p_numero_serie);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for InsertarStock
-- ----------------------------
DROP PROCEDURE IF EXISTS `InsertarStock`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarStock`(
    IN p_descripcion_producto VARCHAR(50),
    IN p_cantidad INT,
    IN p_descripcion_almacen VARCHAR(50),
    IN p_nombre_proveedor VARCHAR(50)
)
BEGIN
    DECLARE v_id_producto INT;
    DECLARE v_id_almacen INT;
    DECLARE v_id_proveedor INT;

    -- Obtener el id_producto con la misma collación que la columna productos.descripcion
    SELECT id_producto INTO v_id_producto
    FROM productos
    WHERE descripcion COLLATE utf8mb4_general_ci = p_descripcion_producto COLLATE utf8mb4_general_ci;

    -- Obtener el id_almacen con la misma collación que la columna almacen.descripcion
    SELECT id INTO v_id_almacen
    FROM almacen
    WHERE descripcion COLLATE utf8mb4_general_ci = p_descripcion_almacen COLLATE utf8mb4_general_ci;

    -- Obtener el id_proveedor con la misma collación que la columna proveedores.nombre_proveedor
    SELECT id_proveedor INTO v_id_proveedor
    FROM proveedores
    WHERE nombre_proveedor COLLATE utf8mb4_general_ci = p_nombre_proveedor COLLATE utf8mb4_general_ci;

    -- Insertar en la tabla stock
    INSERT INTO stock (id_producto, cantidad, id_almacen, id_proveedores)
    VALUES (v_id_producto, p_cantidad, v_id_almacen, v_id_proveedor);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for InsertarVenta
-- ----------------------------
DROP PROCEDURE IF EXISTS `InsertarVenta`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarVenta`(
    IN p_descripcion_producto VARCHAR(50),
    IN p_cantidad_vendida INT
)
BEGIN
    DECLARE v_precio_venta DECIMAL(10, 2);
    DECLARE v_id_producto INT;
    DECLARE v_existencia_anterior INT;

    -- Obtener el precio de venta del producto y su ID
    SELECT id_producto, precio_venta INTO v_id_producto, v_precio_venta
    FROM productos
    WHERE descripcion COLLATE utf8mb4_general_ci = p_descripcion_producto
    LIMIT 1;

    -- Obtener el stock actual del producto
    SELECT existencia INTO v_existencia_anterior
    FROM productos
    WHERE id_producto = v_id_producto;

    -- Actualizar el stock en la tabla productos
    UPDATE productos
    SET existencia = v_existencia_anterior - p_cantidad_vendida
    WHERE id_producto = v_id_producto;

    -- Insertar en la tabla detalleventas
    INSERT INTO detalleventas (
        id_detalleventa,
        descripcion_producto,
        cantidad_vendida,
        precio_unitario,
        subtotal,
        fecha,
        id_producto
    )
    VALUES (
        DEFAULT,
        p_descripcion_producto,
        p_cantidad_vendida,
        v_precio_venta,
        (p_cantidad_vendida * v_precio_venta),
        CURRENT_TIMESTAMP,
        v_id_producto
    );
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for VerificarVenta
-- ----------------------------
DROP PROCEDURE IF EXISTS `VerificarVenta`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `VerificarVenta`(
    IN p_descripcion VARCHAR(50)
)
BEGIN
    DECLARE v_existencia INT;

    -- Obtener la existencia actual del producto
    SELECT existencia INTO v_existencia
    FROM productos
    WHERE descripcion COLLATE utf8mb4_general_ci = p_descripcion COLLATE utf8mb4_general_ci;

    -- Verificar si la existencia es menor que 15
    IF v_existencia <= 15 THEN
        SELECT 'No puedes vender' AS mensaje;
    ELSE
        -- Puedes realizar otras operaciones aquí si es necesario
        -- En este ejemplo, simplemente devuelve un mensaje indicando que se puede vender
        SELECT 'Puedes vender' AS mensaje;
    END IF;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
