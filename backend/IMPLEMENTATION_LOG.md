# 前后端分离登录项目实现记录

## 1. 实现步骤
1. 创建项目目录：`backend`（Spring Boot）与 `frontend`（React + Vite）。
2. 后端接入：
   - Spring Boot 2.7.18（JDK 1.8 兼容）
   - MyBatis + MySQL
   - Spring Security（基于 Session 的登录态）
3. 设计登录接口：
   - `POST /api/auth/login`：校验用户名密码，写入 SecurityContext 到 Session。
   - `POST /api/auth/logout`：清理 Session。
   - `GET /api/home`：鉴权通过后返回首页欢迎信息。
4. 前端实现页面：
   - `/login` 登录页，调用后端登录接口。
   - 登录成功跳转 `/home`。
   - `/home` 页面请求受保护接口，展示用户信息，可退出登录。
5. 增加跨域配置：允许 `http://localhost:5173` 与后端 `http://localhost:8080` 携带 Cookie 通信。
6. 编写 SQL 脚本：初始化数据库、表结构、测试账号。

## 2. MySQL 脚本执行记录
脚本位置：`backend/src/main/resources/sql/init.sql`

建议执行命令：
```sql
SOURCE /Users/youniverse/Documents/ai-02/backend/src/main/resources/sql/init.sql;
```

脚本内容执行顺序：
1. `CREATE DATABASE IF NOT EXISTS login_demo ...;`
2. `USE login_demo;`
3. `DROP TABLE IF EXISTS sys_user;`
4. `CREATE TABLE sys_user (...);`
5. `INSERT INTO sys_user(username, password, enabled) VALUES ('admin', '{noop}123456', 1);`

## 3. 运行记录（手工）
1. 启动 MySQL 后执行 `init.sql`。
2. 进入后端目录运行：`mvn spring-boot:run`。
3. 进入前端目录运行：`npm install && npm run dev`。
4. 浏览器访问：`http://localhost:5173/login`。
5. 使用账号登录：`admin / 123456`，成功后跳转到 `/home`。

## 4. 当前终端验证记录（2026-03-30）
1. 已完成：前端依赖安装 `npm install`（成功）。
2. 已完成：前端构建 `npm run build`（成功）。
3. 未完成：后端 `mvn` 构建（当前终端未安装 `mvn` 命令）。
4. 未完成：`init.sql` 实库执行（当前终端未安装 `mysql` 客户端）。
