## 创建数据库和表

#### 1.创建（game_user_data）库

```sql
CREATE DATABASE game_user_data
 DEFAULT CHARACTER SET utf8mb4
 COLLATE utf8mb4_unicode_ci;

USE game_user_data;
```



#### 1.1创建角色基础信息表（characters）

```sql
CREATE TABLE characters (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL COMMENT '角色名称',
  faction VARCHAR(50) COMMENT '阵营',
  race VARCHAR(50) COMMENT '种族',
  star_level INT COMMENT '星级',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

#### 1.2创建角色能力值表（character_stats）

```sql
CREATE TABLE character_stats (
  id INT PRIMARY KEY AUTO_INCREMENT,
  character_id INT NOT NULL,
  strength INT COMMENT '力量',
  agility INT COMMENT '敏捷',
  intelligence INT COMMENT '智识',
  willpower INT COMMENT '意志',
  hp INT COMMENT '生命值',
  attack INT COMMENT '攻击力',
  defense INT COMMENT '防御力',
  FOREIGN KEY (character_id) REFERENCES characters(id)
);
```

#### 1.3创建角色技能表（character_skills）

```sql
CREATE TABLE character_skills (
  id INT PRIMARY KEY AUTO_INCREMENT,
  character_id INT NOT NULL,
  skill_name VARCHAR(100) NOT NULL,
  skill_type ENUM('普通攻击', '战技', '连携技', '终结技') NOT NULL,
  description TEXT,
  FOREIGN KEY (character_id) REFERENCES characters(id)
);
```

已录入信息
别礼



## 目录结构

```text
backend
├─ node_modules
├─ src
│  ├─ app.js              // 入口（express 初始化）
│  ├─ config
│  │  └─ db.js            // 数据库连接
│  ├─ routes
│  │  ├─ character.routes.js
│  ├─ controllers
│  │  └─ character.controller.js
│  ├─ services
│  │  └─ character.service.js
│  ├─ models
│  │  └─ character.model.js
├─ server.js              // 启动服务
├─ package.json
```

```text
route：定义接口 URL

controller：接收请求 / 返回响应

service：业务逻辑

model：数据库 SQL

config：配置（MySQL）
```

