# 前后端分离登录示例项目

## 项目结构
- `backend`：Spring Boot + Spring Security + MyBatis + MySQL
- `frontend`：React + Vite
- `IMPLEMENTATION_LOG.md`：实现步骤与脚本执行记录

## 账号信息
- 用户名：`admin`
- 密码：`123456`

## 启动顺序
1. 准备 MySQL 并执行初始化脚本：
   ```sql
   SOURCE /Users/youniverse/Documents/ai-02/backend/src/main/resources/sql/init.sql;
   ```
2. 修改后端配置（如有需要）：
   - 文件：`/Users/youniverse/Documents/ai-02/backend/src/main/resources/application.yml`
   - 默认数据库账号密码：`root / 123456`
3. 启动后端：
   ```bash
   cd /Users/youniverse/Documents/ai-02/backend
   mvn spring-boot:run
   ```
4. 启动前端：
   ```bash
   cd /Users/youniverse/Documents/ai-02/frontend
   npm install
   npm run dev
   ```
5. 打开浏览器访问：
   - `http://localhost:5173/login`

## 接口说明
- `POST /api/auth/login`：登录
- `POST /api/auth/logout`：退出登录
- `GET /api/home`：登录后首页数据

## 说明
- 登录状态使用 `Session + Cookie`。
- 前端请求包含 `credentials: 'include'`，后端已配置跨域允许 `localhost:5173`。
- 演示数据使用 `{noop}` 密码格式，仅用于快速跑通流程。
