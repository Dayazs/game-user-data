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

#### 1.4创建角色定位以及伤害类型表

```sql
CREATE TABLE character_role_damage (
  id INT PRIMARY KEY AUTO_INCREMENT,
  character_id INT NOT NULL,
  role_type TINYINT NOT NULL COMMENT '角色定位：1-6',
  damage_type TINYINT NOT NULL COMMENT '伤害类型：1-5',
  CONSTRAINT fk_character_role_damage
    FOREIGN KEY (character_id) REFERENCES characters(id)
);
```



已录入信息
别礼



## 目录结构

```text
backend
├─ node_modules
├─ public
│  └─ images
│  │  ├─ characters		 //	角色相关图片资源
│  │  └─ general		 //	通用图片资源
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



### 层级解释

1. **config（配置层）**
    这个文件夹用于存放项目的各种配置项。例如数据库连接配置（如MySQL的连接信息），环境变量（如开发、生产环境的配置差异），以及其他全局的配置。在这个层中，主要是与外部资源的连接配置和初始化。

2. **model（数据层）**
    这个文件夹用于存放与数据库交互的代码。通常每个表会对应一个模型文件，模型文件包含与表结构相关的SQL操作（如查询、插入、更新、删除等）。在这个层中，操作数据库的代码通常是“原始”的，直接与数据库进行交互。

3. **service（业务逻辑层）**
    service层是核心业务逻辑的实现地。在这里，你将从model层获得数据并进行一些业务处理，然后再将处理结果返回给controller层。service层通常包含一些复杂的业务逻辑，比如数据校验、数据整合、外部API调用等，controller层则不应该处理这些复杂逻辑。

4. **controller（控制层）**
    controller层负责接收来自前端的HTTP请求，调用相应的service进行处理，最后将结果返回给前端。它的主要职责是接收请求、响应数据，控制程序流程。controller和路由（router）密切相关，因为它们决定了如何响应特定的URL请求。

5. **router（路由层）**
    router负责定义URL和controller之间的关系。它将不同的URL路由到不同的controller方法上。每个接口的路径、请求方法（GET、POST等）和控制器方法都在此定义，路由决定了如何触发controller中的处理函数。

6. **app.js（应用入口文件）**
    这个文件是应用的入口，通常在这里初始化整个应用。它会加载路由配置、处理中间件（比如请求解析、日志记录、错误处理等），并启动Express服务。通过`app.listen()`启动服务，通常这个文件负责加载所有的服务和配置。

7. **server.js（启动文件）**
    这个文件负责启动Node.js服务器，通常它会引入`app.js`并调用`app.listen()`启动HTTP服务。`server.js`有时候也负责监听不同的环境设置。

## 指定API接口返回的数据

http://localhost:3000/api/characters	返回所有角色信息

http://localhost:3000/api/characters/skill?id=1	返回指定id角色的技能信息

http://localhost:3000/api/characters/stats?id=1	返回指定id角色的能力信息

http://localhost:3000/api/characters/ranks?id=1	返回指定id角色的阵营和属性信息

http://localhost:3000/images	获取图片资源

