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

 Date: 18/01/2024 18:08:24
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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for categorias
-- ----------------------------
DROP TABLE IF EXISTS `categorias`;
CREATE TABLE `categorias`  (
  `id_categoria` int(0) NOT NULL AUTO_INCREMENT,
  `nombre_categoria` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `estado` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_categoria`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of categorias
-- ----------------------------
INSERT INTO `categorias` VALUES (1, 'AISLANTES', '1');
INSERT INTO `categorias` VALUES (3, 'ELECTRICA', '1');
INSERT INTO `categorias` VALUES (4, 'PRODUCTOS INTERIORES', '1');
INSERT INTO `categorias` VALUES (5, 'PINTURAS EN AEROSOL', '1');
INSERT INTO `categorias` VALUES (6, 'PINZAS ', '1');
INSERT INTO `categorias` VALUES (7, 'COSAS DE LA CASA', '1');
INSERT INTO `categorias` VALUES (8, 'HERRAMIENTAS HOGAR', '1');
INSERT INTO `categorias` VALUES (9, 'DESARMADORES', '1');
INSERT INTO `categorias` VALUES (10, 'LLAVES', '1');
INSERT INTO `categorias` VALUES (11, 'JUEGO DE HERRAMIENTAS', '1');
INSERT INTO `categorias` VALUES (12, 'JUEGO DE HERRAMIENTAS', '0');
INSERT INTO `categorias` VALUES (13, 'SEGUETAS', '1');
INSERT INTO `categorias` VALUES (14, 'MICROFIBRAS', '1');
INSERT INTO `categorias` VALUES (15, 'PORTAHERRAMIENTAS', '1');

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
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of detallecompras
-- ----------------------------
INSERT INTO `detallecompras` VALUES (1, 4, 4, 30.00, 150.00, '2023-12-22 20:58:47.000000', 5, '0', '');
INSERT INTO `detallecompras` VALUES (2, 4, 5, 30.00, 150.00, '2024-01-03 10:34:25.000000', 1, '0', 'FOCO');
INSERT INTO `detallecompras` VALUES (3, 4, 5, 30.00, 150.00, '2024-01-03 10:53:59.000000', 1, '0', 'FOCO');
INSERT INTO `detallecompras` VALUES (4, 4, 5, 30.00, 150.00, '2024-01-03 11:00:40.000000', 1, '0', 'KG DE CABLE DE COBRE 220VLTS');
INSERT INTO `detallecompras` VALUES (5, 8, 18, 30.00, 150.00, '2024-01-03 12:58:48.000000', 1, '0', 'PALA DE PUNTA CURVA');
INSERT INTO `detallecompras` VALUES (6, 8, 55, 500.00, 27500.00, '2024-01-03 17:13:01.000000', 1, '0', 'KG DE CABLE DE COBRE 220VLTS');
INSERT INTO `detallecompras` VALUES (7, 4, 200, 30.00, 6000.00, '2024-01-06 14:23:39.000000', 1, '0', 'FOCO');
INSERT INTO `detallecompras` VALUES (8, 4, 10, 30.00, 300.00, '2024-01-06 14:24:11.000000', 1, '0', 'FOCO');
INSERT INTO `detallecompras` VALUES (9, 4, 20, 30.00, 600.00, '2024-01-06 14:25:18.000000', 1, '0', 'FOCO');
INSERT INTO `detallecompras` VALUES (10, 4, 18, 30.00, 540.00, '2024-01-06 15:10:38.000000', 1, '0', 'FOCO');
INSERT INTO `detallecompras` VALUES (11, 4, 19, 30.00, 570.00, '2024-01-06 15:44:29.000000', 1, '0', 'FOCO');
INSERT INTO `detallecompras` VALUES (12, 8, 20, 500.00, 10000.00, '2024-01-06 16:10:12.000000', 1, '0', 'KG DE CABLE DE COBRE 220VLTS');
INSERT INTO `detallecompras` VALUES (13, 4, 279, 30.00, 8370.00, '2024-01-09 10:03:50.000000', 1, '0', 'FOCO');
INSERT INTO `detallecompras` VALUES (14, 4, 10, 30.00, 300.00, '2024-01-09 10:25:56.000000', 1, '0', 'FOCO');
INSERT INTO `detallecompras` VALUES (15, 4, 26, 30.00, 780.00, '2024-01-09 10:26:33.000000', 1, '0', 'FOCO');
INSERT INTO `detallecompras` VALUES (16, 4, 90, 30.00, 2700.00, '2024-01-09 10:29:59.000000', 1, '0', 'FOCO');
INSERT INTO `detallecompras` VALUES (17, 4, 40, 30.00, 1200.00, '2024-01-09 10:30:07.000000', 1, '0', 'FOCO');
INSERT INTO `detallecompras` VALUES (18, 4, 40, 30.00, 1200.00, '2024-01-09 10:31:09.000000', 1, '0', 'FOCO');
INSERT INTO `detallecompras` VALUES (19, 8, 30, 500.00, 15000.00, '2024-01-09 10:31:16.000000', 1, '0', 'KG DE CABLE DE COBRE 220VLTS');
INSERT INTO `detallecompras` VALUES (20, 8, 200, 500.00, 100000.00, '2024-01-09 10:31:22.000000', 1, '0', 'KG DE CABLE DE COBRE 220VLTS');
INSERT INTO `detallecompras` VALUES (21, 4, 30, 30.00, 900.00, '2024-01-09 10:31:31.000000', 1, '0', 'FOCO');
INSERT INTO `detallecompras` VALUES (22, 4, 230, 30.00, 6900.00, '2024-01-09 12:48:50.000000', 1, '0', 'FOCO');
INSERT INTO `detallecompras` VALUES (23, 4, 40, 30.00, 1200.00, '2024-01-09 12:48:56.000000', 1, '0', 'FOCO');
INSERT INTO `detallecompras` VALUES (24, 4, 30, 30.00, 900.00, '2024-01-09 12:49:55.000000', 1, '0', 'FOCO');
INSERT INTO `detallecompras` VALUES (25, 4, 20, 30.00, 600.00, '2024-01-09 12:50:02.000000', 1, '0', 'FOCO');
INSERT INTO `detallecompras` VALUES (26, 4, 20, 30.00, 600.00, '2024-01-09 12:50:52.000000', 1, '0', 'FOCO');
INSERT INTO `detallecompras` VALUES (27, 4, 20, 30.00, 600.00, '2024-01-09 12:51:14.000000', 1, '0', 'FOCO');
INSERT INTO `detallecompras` VALUES (28, 4, 20, 30.00, 600.00, '2024-01-09 12:51:20.000000', 1, '0', 'FOCO');
INSERT INTO `detallecompras` VALUES (29, 4, 20, 30.00, 600.00, '2024-01-09 12:51:28.000000', 1, '0', 'FOCO');
INSERT INTO `detallecompras` VALUES (30, 4, 20, 30.00, 600.00, '2024-01-09 12:51:37.000000', 1, '0', 'FOCO');
INSERT INTO `detallecompras` VALUES (31, 4, 30, 30.00, 900.00, '2024-01-09 13:02:22.000000', 1, '0', 'FOCO');
INSERT INTO `detallecompras` VALUES (32, 4, 30, 30.00, 900.00, '2024-01-09 13:02:58.000000', 1, '0', 'FOCO');
INSERT INTO `detallecompras` VALUES (33, 4, 30, 30.00, 900.00, '2024-01-09 13:03:02.000000', 1, '0', 'FOCO');
INSERT INTO `detallecompras` VALUES (34, 4, 20, 30.00, 600.00, '2024-01-09 13:03:27.000000', 1, '0', 'FOCO');
INSERT INTO `detallecompras` VALUES (35, 8, 20, 500.00, 10000.00, '2024-01-09 13:04:56.000000', 1, '1', 'KG DE CABLE DE COBRE 220VLTS');
INSERT INTO `detallecompras` VALUES (36, 4, 50, 30.00, 1500.00, '2024-01-09 13:05:38.000000', 1, '0', 'FOCO');
INSERT INTO `detallecompras` VALUES (37, 4, 30, 30.00, 900.00, '2024-01-09 13:07:32.000000', 1, '0', 'FOCO');
INSERT INTO `detallecompras` VALUES (38, 4, 30, 30.00, 900.00, '2024-01-09 13:16:42.000000', 2, '0', 'FOCO');
INSERT INTO `detallecompras` VALUES (39, 4, 10, 30.00, 300.00, '2024-01-09 13:22:56.000000', 1, '0', 'FOCO');
INSERT INTO `detallecompras` VALUES (40, 4, 10, 30.00, 300.00, '2024-01-09 13:24:22.000000', 1, '1', 'FOCO');
INSERT INTO `detallecompras` VALUES (41, 44, 70, 130.00, 9100.00, '2024-01-11 14:40:53.000000', 1, '1', 'PORTAHERRAMIENTAS DE CUERO 4 COMPARTIMIENTOS');
INSERT INTO `detallecompras` VALUES (42, 44, 20, 130.00, 2600.00, '2024-01-11 14:42:48.000000', 1, '1', 'PORTAHERRAMIENTAS DE CUERO 4 COMPARTIMIENTOS');
INSERT INTO `detallecompras` VALUES (43, 41, 50, 30.00, 1500.00, '2024-01-11 14:43:23.000000', 1, '1', 'ARCO DE SEGUETA');
INSERT INTO `detallecompras` VALUES (44, 44, 20, 130.00, 2600.00, '2024-01-11 14:52:17.000000', 1, '0', 'PORTAHERRAMIENTAS DE CUERO 4 COMPARTIMIENTOS');
INSERT INTO `detallecompras` VALUES (45, 44, 20, 130.00, 2600.00, '2024-01-12 10:15:34.000000', 1, '1', 'PORTAHERRAMIENTAS DE CUERO 4 COMPARTIMIENTOS');
INSERT INTO `detallecompras` VALUES (46, 44, 30, 130.00, 3900.00, '2024-01-12 10:16:18.000000', 1, '1', 'PORTAHERRAMIENTAS DE CUERO 4 COMPARTIMIENTOS');

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
  `pago` double(255, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`id_detalleventa`) USING BTREE,
  INDEX `id_producto`(`descripcion_producto`) USING BTREE,
  INDEX `id_producto_fk`(`id_producto`) USING BTREE,
  CONSTRAINT `id_producto_fk` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 161 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of detalleventas
-- ----------------------------
INSERT INTO `detalleventas` VALUES (21, 'FOCO', 15, 60.00, 300.00, '2023-12-23 13:40:56.000000', '0', 4, 1700);
INSERT INTO `detalleventas` VALUES (22, 'KG DE CABLE DE COBRE 220VLTS', 15, 700.00, 10500.00, '2023-12-23 13:51:26.000000', '0', 8, 1700);
INSERT INTO `detalleventas` VALUES (23, 'PROBADOR DE CORRIENTE DE 120VTS', 13, 70.00, 910.00, '2023-12-23 13:52:22.000000', '0', 11, 1700);
INSERT INTO `detalleventas` VALUES (27, 'FOCO', 3, 60.00, 180.00, '2023-12-23 14:05:15.000000', '0', 4, 1700);
INSERT INTO `detalleventas` VALUES (28, 'PROBADOR DE CORRIENTE DE 120VTS', 5, 70.00, 350.00, '2023-12-23 14:05:38.000000', '0', 11, 1700);
INSERT INTO `detalleventas` VALUES (29, 'KG DE CABLE DE COBRE 220VLTS', 3, 700.00, 2100.00, '2023-12-23 14:06:54.000000', '0', 8, 1700);
INSERT INTO `detalleventas` VALUES (30, 'FOCO', 3, 45.00, 135.00, '2023-12-23 15:16:13.000000', '0', 4, 1700);
INSERT INTO `detalleventas` VALUES (31, 'FOCO', 5, 60.00, 300.00, '2023-12-23 15:16:13.000000', '0', 4, 1700);
INSERT INTO `detalleventas` VALUES (32, 'FOCO', 5, 60.00, 300.00, '2023-12-23 15:16:13.000000', '0', 4, 1700);
INSERT INTO `detalleventas` VALUES (33, 'MANGO DE PICO', 3, 120.00, 360.00, '2023-12-23 17:48:13.000000', '0', 15, 1700);
INSERT INTO `detalleventas` VALUES (34, 'FOCO', 18, 60.00, 900.00, '2023-12-23 17:48:32.000000', '0', 4, 1700);
INSERT INTO `detalleventas` VALUES (35, 'CINTA DE AISLAR', 35, 70.00, 2450.00, '2023-12-24 08:35:26.000000', '0', 12, 1700);
INSERT INTO `detalleventas` VALUES (36, 'CINTA DE AISLAR', 4, 70.00, 280.00, '2023-12-24 08:35:59.000000', '0', 12, 1700);
INSERT INTO `detalleventas` VALUES (37, 'CINTA DE AISLAR', 5, 70.00, 350.00, '2023-12-24 08:36:05.000000', '0', 12, 1700);
INSERT INTO `detalleventas` VALUES (38, 'KG DE CABLE DE COBRE 220VLTS', 3, 700.00, 2100.00, '2023-12-24 08:36:32.000000', '0', 8, 1700);
INSERT INTO `detalleventas` VALUES (39, 'PROBADOR DE CORRIENTE DE 120VTS', 3, 70.00, 210.00, '2023-12-24 08:54:59.000000', '0', 11, 1700);
INSERT INTO `detalleventas` VALUES (40, 'MANGO DE PICO', 2, 120.00, 240.00, '2023-12-24 08:55:18.000000', '0', 15, 1700);
INSERT INTO `detalleventas` VALUES (41, 'CINTA DE AISLAR', 4, 70.00, 280.00, '2023-12-24 09:47:37.000000', '0', 12, 1700);
INSERT INTO `detalleventas` VALUES (42, 'KG DE CABLE DE COBRE 220VLTS', 3, 700.00, 2100.00, '2023-12-24 09:50:32.000000', '0', 8, 1700);
INSERT INTO `detalleventas` VALUES (43, 'KG DE CABLE DE COBRE 220VLTS', 2, 700.00, 1400.00, '2023-12-24 09:53:13.000000', '0', 8, 1700);
INSERT INTO `detalleventas` VALUES (44, 'KG DE CABLE DE COBRE 220VLTS', 3, 700.00, 2100.00, '2023-12-24 18:04:51.000000', '0', 8, 1700);
INSERT INTO `detalleventas` VALUES (45, 'FOCO', 1, 60.00, 60.00, '2023-12-26 11:18:30.000000', '0', 4, 1700);
INSERT INTO `detalleventas` VALUES (46, 'PROBADOR DE CORRIENTE DE 120VTS', 3, 70.00, 210.00, '2023-12-26 13:48:52.000000', '0', 11, 1700);
INSERT INTO `detalleventas` VALUES (47, 'FOCO', 1, 60.00, 60.00, '2023-12-26 13:51:25.000000', '0', 4, 1700);
INSERT INTO `detalleventas` VALUES (48, 'CINTA DE AISLAR', 3, 70.00, 140.00, '2023-12-26 13:55:10.000000', '0', 12, 1700);
INSERT INTO `detalleventas` VALUES (49, 'CINTA DE AISLAR', 2, 70.00, 140.00, '2023-12-26 14:02:09.000000', '0', 12, 1700);
INSERT INTO `detalleventas` VALUES (50, 'KG DE CABLE DE COBRE 220VLTS', 3, 700.00, 2100.00, '2023-12-26 14:02:15.000000', '0', 8, 1700);
INSERT INTO `detalleventas` VALUES (51, 'CABLE DE COBRE DE 220V', 2, 300.00, 600.00, '2023-12-26 14:02:21.000000', '0', 21, 1700);
INSERT INTO `detalleventas` VALUES (52, 'KG DE CABLE DE COBRE 220VLTS', 1, 700.00, 700.00, '2023-12-26 14:04:07.000000', '0', 8, 1700);
INSERT INTO `detalleventas` VALUES (53, 'PROBADOR DE CORRIENTE DE 120VTS', 1, 70.00, 70.00, '2023-12-26 14:04:12.000000', '0', 11, 1700);
INSERT INTO `detalleventas` VALUES (54, 'FOCO DE LUZ INTENSA', 5, 50.00, 50.00, '2023-12-26 14:04:14.000000', '0', 14, 1700);
INSERT INTO `detalleventas` VALUES (55, 'KG DE CABLE DE COBRE 220VLTS', 1, 700.00, 700.00, '2023-12-26 14:54:47.000000', '0', 8, 1700);
INSERT INTO `detalleventas` VALUES (56, 'FOCO', 3, 60.00, 180.00, '2023-12-26 14:56:02.000000', '0', 4, 1700);
INSERT INTO `detalleventas` VALUES (57, 'MANGO DE PICO', 2, 120.00, 240.00, '2023-12-26 14:56:09.000000', '0', 15, 1700);
INSERT INTO `detalleventas` VALUES (58, 'FOCO AHORRADOR', 1, 60.00, 60.00, '2023-12-26 14:57:52.000000', '0', 17, 1700);
INSERT INTO `detalleventas` VALUES (59, 'KG DE CABLE DE COBRE 220VLTS', 1, 700.00, 700.00, '2023-12-26 14:58:35.000000', '0', 8, 1700);
INSERT INTO `detalleventas` VALUES (60, 'PROBADOR DE CORRIENTE DE 120VTS', 1, 70.00, 70.00, '2023-12-26 15:01:07.000000', '0', 11, 1700);
INSERT INTO `detalleventas` VALUES (61, 'FOCO', 1, 60.00, 60.00, '2023-12-26 15:22:24.000000', '0', 4, 1700);
INSERT INTO `detalleventas` VALUES (62, 'FOCO AHORRADOR', 2, 60.00, 120.00, '2023-12-26 16:05:54.000000', '0', 17, 1700);
INSERT INTO `detalleventas` VALUES (63, 'CINTA DE AISLAR', 2, 70.00, 140.00, '2023-12-26 19:41:14.000000', '0', 12, 1700);
INSERT INTO `detalleventas` VALUES (64, 'FOCO', 1, 60.00, 60.00, '2023-12-28 12:26:46.000000', '0', 4, 1700);
INSERT INTO `detalleventas` VALUES (65, 'CINTA DE AISLAR', 35, 70.00, 2450.00, '2023-12-28 12:33:52.000000', '0', 12, 1700);
INSERT INTO `detalleventas` VALUES (66, 'FOCO', 5, 60.00, 300.00, '2023-12-28 13:16:11.000000', '0', 4, 1700);
INSERT INTO `detalleventas` VALUES (67, 'FOCO', 5, 60.00, 300.00, '2023-12-28 14:19:30.000000', '0', 4, 1700);
INSERT INTO `detalleventas` VALUES (68, 'FOCO', 25, 60.00, 1500.00, '2023-12-28 14:52:56.000000', '0', 4, 1700);
INSERT INTO `detalleventas` VALUES (69, 'FOCO', 30, 60.00, 1800.00, '2023-12-28 14:55:59.000000', '0', 4, 1700);
INSERT INTO `detalleventas` VALUES (70, 'PINZAS PEQUEÑAS', 5, 50.00, 250.00, '2023-12-31 12:52:08.000000', '0', 22, 1700);
INSERT INTO `detalleventas` VALUES (71, 'PINZAS PEQUEÑAS', 5, 50.00, 250.00, '2023-12-31 12:53:21.000000', '0', 22, 1700);
INSERT INTO `detalleventas` VALUES (72, 'PINZAS PEQUEÑAS', 5, 50.00, 250.00, '2023-12-31 12:54:02.000000', '0', 22, 1700);
INSERT INTO `detalleventas` VALUES (73, 'PINZAS PEQUEÑAS', 5, 50.00, 250.00, '2024-01-01 20:00:49.000000', '0', 22, 1700);
INSERT INTO `detalleventas` VALUES (74, 'FOCO', 5, 60.00, 300.00, '2024-01-01 20:16:47.000000', '0', 4, 1700);
INSERT INTO `detalleventas` VALUES (75, 'CINTA DE AISLAR(PANDOQUIT)', 5, 70.00, 350.00, '2024-01-02 10:24:30.000000', '0', 13, 1700);
INSERT INTO `detalleventas` VALUES (76, 'FOCO', 3, 60.00, 180.00, '2024-01-02 10:24:49.000000', '0', 4, 1700);
INSERT INTO `detalleventas` VALUES (77, 'KG DE CABLE DE COBRE 220VLTS', 1, 700.00, 700.00, '2024-01-02 10:49:10.000000', '0', 8, 1700);
INSERT INTO `detalleventas` VALUES (78, 'FOCO', 2, 60.00, 120.00, '2024-01-02 10:49:36.000000', '0', 4, 1700);
INSERT INTO `detalleventas` VALUES (79, 'PINZAS PEQUEÑAS', 1, 50.00, 50.00, '2024-01-02 10:58:21.000000', '0', 22, 1700);
INSERT INTO `detalleventas` VALUES (80, 'CABLE DE COBRE DE 220V', 2, 300.00, 600.00, '2024-01-02 11:32:20.000000', '0', 21, 1700);
INSERT INTO `detalleventas` VALUES (81, 'FOCO', 2, 60.00, 120.00, '2024-01-02 11:57:15.000000', '0', 4, 1700);
INSERT INTO `detalleventas` VALUES (82, 'CABLE DE COBRE DE 220V', 3, 300.00, 900.00, '2024-01-02 11:57:21.000000', '0', 21, 1700);
INSERT INTO `detalleventas` VALUES (83, 'FOCO', 3, 60.00, 180.00, '2024-01-02 11:59:53.000000', '0', 4, 1700);
INSERT INTO `detalleventas` VALUES (84, 'FOCO DE LZ VERDE', 7, 90.00, 630.00, '2024-01-02 13:50:05.000000', '0', 18, 1700);
INSERT INTO `detalleventas` VALUES (85, 'CABLE DE COBRE DE 220V', 22, 300.00, 6600.00, '2024-01-02 13:54:53.000000', '0', 21, 1700);
INSERT INTO `detalleventas` VALUES (86, 'CABLE DE COBRE DE 220V', 2, 300.00, 600.00, '2024-01-02 17:12:20.000000', '0', 21, 1700);
INSERT INTO `detalleventas` VALUES (87, 'CABLE DE COBRE DE 220V', 50, 300.00, 15000.00, '2024-01-02 17:16:00.000000', '0', 21, 1700);
INSERT INTO `detalleventas` VALUES (88, 'CABLE DE COBRE DE 220V', 15, 300.00, 4500.00, '2024-01-02 18:41:21.000000', '0', 21, 1700);
INSERT INTO `detalleventas` VALUES (89, 'FOCO', 4, 60.00, 240.00, '2024-01-02 18:52:55.000000', '0', 4, 1700);
INSERT INTO `detalleventas` VALUES (90, 'FOCO', 18, 60.00, 1080.00, '2024-01-02 18:53:00.000000', '0', 4, 1700);
INSERT INTO `detalleventas` VALUES (91, 'FOCO', 2, 60.00, 120.00, '2024-01-02 18:53:32.000000', '0', 4, 1700);
INSERT INTO `detalleventas` VALUES (92, 'FOCO', 1, 60.00, 60.00, '2024-01-02 19:21:31.000000', '0', 4, 1700);
INSERT INTO `detalleventas` VALUES (93, 'FOCO', 1, 60.00, 60.00, '2024-01-02 21:13:18.000000', '0', 4, 1700);
INSERT INTO `detalleventas` VALUES (94, 'PROBADOR DE CORRIENTE DE 120VTS', 3, 70.00, 210.00, '2024-01-03 17:12:23.000000', '0', 11, 1700);
INSERT INTO `detalleventas` VALUES (95, 'FOCO AHORRADOR', 3, 60.00, 180.00, '2024-01-04 19:20:02.000000', '0', 17, 1700);
INSERT INTO `detalleventas` VALUES (96, 'PINZA DE ELECTRICIDAD 3 PIEZAS', 2, 250.00, 500.00, '2024-01-04 19:20:15.000000', '0', 27, 1700);
INSERT INTO `detalleventas` VALUES (97, 'DISCO 50 PULGADAS', 1, 60.00, 60.00, '2024-01-04 19:20:48.000000', '0', 20, 1700);
INSERT INTO `detalleventas` VALUES (98, 'FOCO', 25, 60.00, 1500.00, '2024-01-05 09:32:38.000000', '0', 4, 1700);
INSERT INTO `detalleventas` VALUES (99, 'FOCO', 5, 60.00, 300.00, '2024-01-05 12:39:32.000000', '0', 4, 1700);
INSERT INTO `detalleventas` VALUES (100, 'KG DE CABLE DE COBRE 220VLTS', 5, 700.00, 3500.00, '2024-01-05 18:32:44.000000', '0', 8, 1700);
INSERT INTO `detalleventas` VALUES (101, 'FOCO', 3, 60.00, 180.00, '2024-01-05 18:33:18.000000', '0', 4, 1700);
INSERT INTO `detalleventas` VALUES (102, 'FOCO', 5, 60.00, 300.00, '2024-01-05 18:42:06.000000', '0', 4, 1700);
INSERT INTO `detalleventas` VALUES (103, 'FOCO', 30, 60.00, 1800.00, '2024-01-05 18:45:25.000000', '0', 4, 1700);
INSERT INTO `detalleventas` VALUES (104, 'FOCO', 10, 60.00, 600.00, '2024-01-05 19:55:39.000000', '0', 4, 1700);
INSERT INTO `detalleventas` VALUES (105, 'FOCO', 3, 60.00, 180.00, '2024-01-05 20:10:50.000000', '0', 4, 1700);
INSERT INTO `detalleventas` VALUES (106, 'FOCO', 5, 60.00, 300.00, '2024-01-05 20:15:31.000000', '0', 4, 1700);
INSERT INTO `detalleventas` VALUES (108, 'KG DE CABLE DE COBRE 220VLTS', 1, 700.00, 700.00, '2024-01-05 20:39:32.000000', '0', 8, 1700);
INSERT INTO `detalleventas` VALUES (109, 'CINTA DE AISLAR(TRUPPER)', 10, 70.00, 700.00, '2024-01-05 23:19:15.000000', '0', 12, 1700);
INSERT INTO `detalleventas` VALUES (110, 'CINTA DE AISLAR(TRUPPER)', 5, 70.00, 350.00, '2024-01-05 23:19:23.000000', '0', 12, 1700);
INSERT INTO `detalleventas` VALUES (111, 'FOCO', 1550, 60.00, 93000.00, '2024-01-07 19:39:23.000000', '0', 4, 1700);
INSERT INTO `detalleventas` VALUES (112, 'KG DE CABLE DE COBRE 220VLTS', 5, 700.00, 3500.00, '2024-01-07 19:40:43.000000', '0', 8, 1700);
INSERT INTO `detalleventas` VALUES (113, 'FOCO', 250, 60.00, 15000.00, '2024-01-08 14:44:18.000000', '0', 4, 1700);
INSERT INTO `detalleventas` VALUES (114, 'KG DE CABLE DE COBRE 220VLTS', 130, 700.00, 91000.00, '2024-01-08 14:44:27.000000', '0', 8, 1700);
INSERT INTO `detalleventas` VALUES (115, 'FOCO', 5, 60.00, 300.00, '2024-01-09 10:04:43.000000', '0', 4, 1700);
INSERT INTO `detalleventas` VALUES (116, 'FOCO', 3, 60.00, 180.00, '2024-01-09 10:04:51.000000', '0', 4, 1700);
INSERT INTO `detalleventas` VALUES (117, 'PROBADOR DE CORRIENTE DE 120VTS', 2, 70.00, 140.00, '2024-01-09 10:04:54.000000', '0', 11, 1700);
INSERT INTO `detalleventas` VALUES (118, 'DISCO 50 PULGADAS', 3, 60.00, 180.00, '2024-01-09 10:04:57.000000', '0', 20, 1700);
INSERT INTO `detalleventas` VALUES (119, 'JUEGO DE HERRAMIENTA DE 6 PIEZAS', 2, 450.00, 900.00, '2024-01-09 10:05:01.000000', '0', 25, 1700);
INSERT INTO `detalleventas` VALUES (120, 'FOCO', 15, 60.00, 900.00, '2024-01-09 10:15:13.000000', '0', 4, 1700);
INSERT INTO `detalleventas` VALUES (121, 'FOCO', 251, 60.00, 15000.00, '2024-01-09 10:15:19.000000', '0', 4, 1700);
INSERT INTO `detalleventas` VALUES (122, 'FOCO', 55, 60.00, 3300.00, '2024-01-09 10:28:58.000000', '0', 4, 1700);
INSERT INTO `detalleventas` VALUES (123, 'FOCO', 255, 60.00, 15060.00, '2024-01-09 12:48:10.000000', '0', 4, 1700);
INSERT INTO `detalleventas` VALUES (124, 'FOCO', 10, 60.00, 600.00, '2024-01-09 13:00:07.000000', '0', 4, 1700);
INSERT INTO `detalleventas` VALUES (125, 'LLAVE AJUSTABLE PERICO DE 8 PULGADAS', 10, 60.00, 600.00, '2024-01-11 14:49:09.000000', '0', 33, 1700);
INSERT INTO `detalleventas` VALUES (126, 'PORTAHERRAMIENTAS DE CUERO 4 COMPARTIMIENTOS', 10, 180.00, 1800.00, '2024-01-11 20:36:39.000000', '0', 44, 1700);
INSERT INTO `detalleventas` VALUES (127, 'PORTAHERRAMIENTAS DE CUERO 4 COMPARTIMIENTOS', 33, 180.00, 5940.00, '2024-01-11 20:36:49.000000', '0', 44, 1700);
INSERT INTO `detalleventas` VALUES (128, 'PORTAHERRAMIENTAS DE CUERO 4 COMPARTIMIENTOS', 2, 180.00, 360.00, '2024-01-11 20:37:09.000000', '0', 44, 1700);
INSERT INTO `detalleventas` VALUES (129, 'FOCO', 5, 70.00, 350.00, '2024-01-12 08:34:56.000000', '0', 4, 1700);
INSERT INTO `detalleventas` VALUES (130, 'FOCO', 5, 70.00, 350.00, '2024-01-12 08:36:47.000000', '0', 4, 1700);
INSERT INTO `detalleventas` VALUES (131, 'FOCO', 5, 70.00, 350.00, '2024-01-12 08:37:19.000000', '0', 4, 1700);
INSERT INTO `detalleventas` VALUES (132, 'FOCO', 5, 70.00, 350.00, '2024-01-12 08:37:41.000000', '0', 4, 1700);
INSERT INTO `detalleventas` VALUES (133, 'FOCO', 5, 70.00, 350.00, '2024-01-12 08:44:53.000000', '0', 4, 1700);
INSERT INTO `detalleventas` VALUES (134, 'FOCO', 3, 70.00, 210.00, '2024-01-12 08:45:08.000000', '0', 4, 1700);
INSERT INTO `detalleventas` VALUES (135, 'FOCO', 3, 70.00, 210.00, '2024-01-12 08:52:24.000000', '0', 4, 1700);
INSERT INTO `detalleventas` VALUES (136, 'FOCO', 3, 70.00, 210.00, '2024-01-12 08:52:42.000000', '0', 4, 1700);
INSERT INTO `detalleventas` VALUES (137, 'FOCO', 3, 70.00, 210.00, '2024-01-12 08:53:19.000000', '0', 4, 1700);
INSERT INTO `detalleventas` VALUES (138, 'FOCO', 3, 70.00, 210.00, '2024-01-12 08:54:26.000000', '0', 4, 1700);
INSERT INTO `detalleventas` VALUES (139, 'FOCO', 2, 70.00, 140.00, '2024-01-12 08:59:59.000000', '0', 4, 1700);
INSERT INTO `detalleventas` VALUES (140, 'FOCO', 3, 70.00, 210.00, '2024-01-12 09:01:40.000000', '0', 4, 1700);
INSERT INTO `detalleventas` VALUES (141, 'FOCO', 5, 70.00, 350.00, '2024-01-12 09:11:30.000000', '0', 4, 1700);
INSERT INTO `detalleventas` VALUES (142, 'FOCO', 5, 70.00, 350.00, '2024-01-12 09:12:14.000000', '0', 4, 1700);
INSERT INTO `detalleventas` VALUES (143, 'FOCO', 2, 70.00, 140.00, '2024-01-12 11:15:11.000000', '0', 4, 1700);
INSERT INTO `detalleventas` VALUES (144, 'FOCO', 2, 70.00, 140.00, '2024-01-12 11:32:34.000000', '0', 4, 1700);
INSERT INTO `detalleventas` VALUES (145, 'FOCO', 2, 70.00, 140.00, '2024-01-12 12:13:43.000000', '0', 4, 1700);
INSERT INTO `detalleventas` VALUES (146, 'FOCO', 4, 70.00, 280.00, '2024-01-12 12:15:11.000000', '0', 4, 1700);
INSERT INTO `detalleventas` VALUES (147, 'KG DE CABLE DE COBRE 220VLTS', 5, 700.00, 3500.00, '2024-01-12 12:15:49.000000', '0', 8, 1700);
INSERT INTO `detalleventas` VALUES (148, 'KG DE CABLE DE COBRE 220VLTS', 3, 700.00, 2100.00, '2024-01-12 12:17:06.000000', '0', 8, 1700);
INSERT INTO `detalleventas` VALUES (149, 'KG DE CABLE DE COBRE 220VLTS', 4, 700.00, 2800.00, '2024-01-12 12:32:14.000000', '0', 8, 1700);
INSERT INTO `detalleventas` VALUES (150, 'KG DE CABLE DE COBRE 220VLTS', 2, 700.00, 1400.00, '2024-01-12 12:32:44.000000', '0', 8, 1700);
INSERT INTO `detalleventas` VALUES (151, 'ARCO DE SEGUETA', 5, 60.00, 300.00, '2024-01-12 12:38:58.000000', '0', 41, 1700);
INSERT INTO `detalleventas` VALUES (152, 'JUEGO DE DESARMADORES 2 PIEZAS', 5, 60.00, 300.00, '2024-01-12 12:39:10.000000', '0', 36, 1700);
INSERT INTO `detalleventas` VALUES (153, 'PAÑO DE MICROFIBRA AMARRILLO DE 40X40CM', 20, 25.00, 500.00, '2024-01-12 12:43:27.000000', '0', 42, 1700);
INSERT INTO `detalleventas` VALUES (154, 'JUEGO DE LLAVES ESTRIADAS Y ESPAÑOLAS DE 5 PIEZAS', 1, 400.00, 400.00, '2024-01-12 12:43:50.000000', '1', 34, 1700);
INSERT INTO `detalleventas` VALUES (155, 'ARCO DE SEGUETA', 1, 60.00, 60.00, '2024-01-12 12:44:28.000000', '1', 41, 1700);
INSERT INTO `detalleventas` VALUES (156, 'JUEGO DE 95 HERRAMIENTAS COMBINADAS', 1, 700.00, 700.00, '2024-01-12 12:44:39.000000', '1', 35, 1700);
INSERT INTO `detalleventas` VALUES (157, 'CINTA ELECTRICA DE AISLAR DE USO MULTIPLE', 1, 70.00, 70.00, '2024-01-12 12:44:46.000000', '1', 13, 1700);
INSERT INTO `detalleventas` VALUES (158, 'FOCO DE LUZ INTENSA', 1, 50.00, 50.00, '2024-01-12 12:44:49.000000', '1', 14, 1700);
INSERT INTO `detalleventas` VALUES (159, 'FOCO AHORRADOR', 1, 60.00, 60.00, '2024-01-12 12:44:56.000000', '0', 17, 1700);
INSERT INTO `detalleventas` VALUES (160, 'PORTAHERRAMIENTAS DE CUERO 4 COMPARTIMIENTOS', 50, 180.00, 9000.00, '2024-01-18 13:29:58.000000', '1', 44, NULL);

-- ----------------------------
-- Table structure for marcas
-- ----------------------------
DROP TABLE IF EXISTS `marcas`;
CREATE TABLE `marcas`  (
  `id_marca` int(0) NOT NULL AUTO_INCREMENT,
  `nombre_marca` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `estado` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_marca`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `marcas` VALUES (9, 'SURTEK', '1');

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
) ENGINE = InnoDB AUTO_INCREMENT = 59 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of productos
-- ----------------------------
INSERT INTO `productos` VALUES (4, 'FOCO', 3, 1, 2, 30.00, 70.00, 'BDEUBU3H734', 35.00, '1');
INSERT INTO `productos` VALUES (8, 'KG DE CABLE DE COBRE 220VLTS', 3, 1, 1, 500.00, 700.00, 'E3J94KRKMFEN', 66.00, '1');
INSERT INTO `productos` VALUES (11, 'PROBADOR DE CORRIENTE DE 120VTS', 3, 1, 1, 50.00, 70.00, 'E339FR94K0R40', 18.00, '1');
INSERT INTO `productos` VALUES (12, 'CINTA DE AISLAR(TRUPPER)', 1, 2, 2, 50.00, 70.00, 'EI3JR849DJ3J9JR', 39.00, '0');
INSERT INTO `productos` VALUES (13, 'CINTA ELECTRICA DE AISLAR DE USO MULTIPLE', 1, 1, 1, 50.00, 70.00, 'EW38JIR49EK03', 17.00, '1');
INSERT INTO `productos` VALUES (14, 'FOCO DE LUZ INTENSA', 3, 1, 1, 25.00, 50.00, 'E388ER949JR49', 55.00, '1');
INSERT INTO `productos` VALUES (15, 'MANGO DE PICO', 4, 3, 5, 70.00, 120.00, 'NE3IJEI94RJ495', 25.00, '1');
INSERT INTO `productos` VALUES (16, 'PALA DE PUNTA CURVA', 4, 2, 5, 50.00, 70.00, 'DENID3NI4NIN', 65.00, '1');
INSERT INTO `productos` VALUES (17, 'FOCO AHORRADOR', 1, 1, 1, 30.00, 60.00, 'BDEUBU3H734', 19.00, '1');
INSERT INTO `productos` VALUES (18, 'FOCO DE LUZ INTENSA', 1, 1, 1, 70.00, 90.00, 'DNEIDNEIDMEIDME', 49.00, '0');
INSERT INTO `productos` VALUES (19, 'PINSAS DE PRESION', 1, 1, 1, 45.00, 50.00, 'NIDIEMIFMRIFMRI', 23.00, '1');
INSERT INTO `productos` VALUES (20, 'DISCO 50 PULGADAS', 1, 1, 1, 30.00, 60.00, 'BDEUBU3H734', 46.00, '1');
INSERT INTO `productos` VALUES (21, 'CABLE DE COBRE DE 220V', 1, 1, 1, 250.00, 300.00, 'ND3UHNE3HN8', 16.00, '1');
INSERT INTO `productos` VALUES (22, 'PINZAS PEQUEÑAS', 1, 1, 1, 35.00, 50.00, 'BEYE2Y45', 44.00, '1');
INSERT INTO `productos` VALUES (23, 'THERMOFIT', 1, 1, 1, 35.00, 50.00, 'HSTT5048Q', 20.00, '1');
INSERT INTO `productos` VALUES (24, 'MINI PINZA DE CORTE DIAGONAL', 6, 1, 1, 30.00, 50.00, '142222', 30.00, '1');
INSERT INTO `productos` VALUES (25, 'JUEGO DE HERRAMIENTA DE 6 PIEZAS', 8, 1, 1, 300.00, 450.00, '144043', 28.00, '1');
INSERT INTO `productos` VALUES (26, 'PINZA MULTIFUNCIONAL PELACABLES', 6, 1, 1, 35.00, 50.00, '142003', 50.00, '1');
INSERT INTO `productos` VALUES (27, 'PINZA DE ELECTRICIDAD 3 PIEZAS', 3, 1, 1, 200.00, 250.00, '142020', 38.00, '1');
INSERT INTO `productos` VALUES (28, 'HERRAMIENTA DE MECANICO 5 PIEZAS', 6, 1, 1, 200.00, 250.00, '142044', 30.00, '1');
INSERT INTO `productos` VALUES (33, 'LLAVE AJUSTABLE PERICO DE 8 PULGADAS', 10, 9, 1, 50.00, 60.00, '140408', 20.00, '1');
INSERT INTO `productos` VALUES (34, 'JUEGO DE LLAVES ESTRIADAS Y ESPAÑOLAS DE 5 PIEZAS', 10, 9, 1, 300.00, 400.00, '140450', 59.00, '1');
INSERT INTO `productos` VALUES (35, 'JUEGO DE 95 HERRAMIENTAS COMBINADAS', 11, 9, 1, 500.00, 700.00, '144036', 49.00, '1');
INSERT INTO `productos` VALUES (36, 'JUEGO DE DESARMADORES 2 PIEZAS', 9, 1, 1, 30.00, 60.00, 'FGD02', 50.00, '1');
INSERT INTO `productos` VALUES (41, 'ARCO DE SEGUETA', 13, 3, 3, 30.00, 60.00, '17E', 84.00, '1');
INSERT INTO `productos` VALUES (42, 'PAÑO DE MICROFIBRA AMARRILLO DE 40X40CM', 14, 9, 1, 15.00, 25.00, 'ALLFTL7', 15.00, '1');
INSERT INTO `productos` VALUES (44, 'PORTAHERRAMIENTAS DE CUERO 4 COMPARTIMIENTOS', 15, 9, 3, 130.00, 180.00, 'ALLF30', 15.00, '1');

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
    IN p_descripcion_producto VARCHAR(100),
    IN p_nombre_categoria VARCHAR(50),
    IN p_nombre_marca VARCHAR(50),
    IN p_nombre_proveedor VARCHAR(100),
    IN p_precio_compra DECIMAL(10, 2),
    IN p_precio_venta DECIMAL(10, 2),
		IN p_numero_serie VARCHAR(50),
		IN p_existencia DECIMAL(10,2)
)
BEGIN

INSERT INTO productos (id_producto, descripcion, id_categoria, id_marca, id_proveedor, precio_compra, precio_venta, numero_serie, existencia, estado) VALUES (DEFAULT,p_descripcion_producto,(SELECT id_categoria FROM categorias WHERE nombre_categoria = p_nombre_categoria COLLATE utf8mb4_general_ci), (SELECT id_marca FROM marcas WHERE nombre_marca = p_nombre_marca COLLATE utf8mb4_general_ci), (SELECT id_proveedor FROM proveedores WHERE nombre_proveedor =p_nombre_proveedor COLLATE utf8mb4_general_ci), p_precio_compra, p_precio_venta, p_numero_serie, p_existencia, DEFAULT);

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
