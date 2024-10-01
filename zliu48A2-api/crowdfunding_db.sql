SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `CATEGORY_ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`CATEGORY_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, 'Sports');
INSERT INTO `category` VALUES (2, 'Cultural Heritage');
INSERT INTO `category` VALUES (3, 'Public Health');
INSERT INTO `category` VALUES (4, 'Renewable Energy');
INSERT INTO `category` VALUES (5, 'Social Justice');

-- ----------------------------
-- Table structure for fundraiser
-- ----------------------------
DROP TABLE IF EXISTS `fundraiser`;
CREATE TABLE `fundraiser`  (
  `FUNDRAISER_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ORGANIZER` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CAPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TARGET_FUNDING` decimal(10, 2) NOT NULL,
  `CURRENT_FUNDING` decimal(10, 2) NOT NULL,
  `CITY` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ACTIVE` tinyint(1) NOT NULL,
  `CATEGORY_ID` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`FUNDRAISER_ID`) USING BTREE,
  INDEX `CATEGORY_ID`(`CATEGORY_ID`) USING BTREE,
  CONSTRAINT `fundraiser_ibfk_1` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `category` (`CATEGORY_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fundraiser
-- ----------------------------
INSERT INTO `fundraiser` VALUES (1, 'Charity Sports Event', 'Host a Marathon for Health', 50000.00, 30000.00, 'Perth', 1, 1);
INSERT INTO `fundraiser` VALUES (2, 'Cultural Festival', 'Celebrate Local Traditions', 40000.00, 20000.00, 'Alice Springs', 1, 2);
INSERT INTO `fundraiser` VALUES (3, 'Health Screening Program', 'Provide Free Health Checkups', 60000.00, 40000.00, 'Melbourne', 1, 3);
INSERT INTO `fundraiser` VALUES (4, 'Solar Power Initiative', 'Install Solar Panels for Schools', 75000.00, 50000.00, 'Brisbane', 1, 4);
INSERT INTO `fundraiser` VALUES (5, 'Equality March', 'Support Social Justice Initiatives', 30000.00, 15000.00, 'Sydney', 1, 5);
INSERT INTO `fundraiser` VALUES (6, 'Sports Equipment Drive', 'Donate Sports Gear to Schools', 15000.00, 8000.00, 'Canberra', 1, 1);
INSERT INTO `fundraiser` VALUES (7, 'Heritage Restoration', 'Restore Historical Buildings', 90000.00, 45000.00, 'Hobart', 1, 2);
INSERT INTO `fundraiser` VALUES (8, 'Mental Health Fund', 'Raise Awareness and Support', 35000.00, 20000.00, 'Adelaide', 1, 3);
INSERT INTO `fundraiser` VALUES (9, 'Community Solar Project', 'Promote Renewable Energy', 40000.00, 25000.00, 'Gold Coast', 1, 4);
INSERT INTO `fundraiser` VALUES (10, 'Justice for All', 'Promote Social Justice Causes', 50000.00, 35000.00, 'Newcastle', 1, 5);
INSERT INTO `fundraiser` VALUES (11, 'Youth Sports League', 'Organize a Youth Sports League', 20000.00, 12000.00, 'Cairns', 1, 1);
INSERT INTO `fundraiser` VALUES (12, 'Cultural Exchange', 'Facilitate Cultural Exchanges', 30000.00, 18000.00, 'Wollongong', 1, 2);
INSERT INTO `fundraiser` VALUES (13, 'Health Awareness Campaign', 'Promote Health Education', 25000.00, 13000.00, 'Darwin', 1, 3);

SET FOREIGN_KEY_CHECKS = 1;
