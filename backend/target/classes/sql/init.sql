-- 1. 创建数据库
CREATE DATABASE IF NOT EXISTS login_demo DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- 2. 使用数据库
USE login_demo;

-- 3. 用户表
DROP TABLE IF EXISTS sys_user;
CREATE TABLE sys_user (
  id BIGINT NOT NULL AUTO_INCREMENT,
  username VARCHAR(64) NOT NULL,
  password VARCHAR(255) NOT NULL,
  enabled TINYINT NOT NULL DEFAULT 1,
  PRIMARY KEY (id),
  UNIQUE KEY uk_username (username)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 4. 初始化演示账号 (用户名: admin, 密码: 123456)
-- 使用 DelegatingPasswordEncoder 的 noop 前缀，便于快速演示。生产环境请改为 bcrypt。
INSERT INTO sys_user(username, password, enabled)
VALUES ('admin', '{noop}123456', 1);
