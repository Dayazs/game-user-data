<template>
  <div id="home">
    <!-- 左侧导航栏 -->
    <div class="sidebar">
      <ul>
        <li :class="{ active: selectedTab === '角色' }" @click="selectTab('角色')">角色</li>
        <li :class="{ active: selectedTab === '武器' }" @click="selectTab('武器')">武器</li>
        <li :class="{ active: selectedTab === '材料' }" @click="selectTab('材料')">材料</li>
      </ul>
    </div>

    <!-- 主内容区 -->
    <div class="content">
      <!-- 二级导航栏 -->
      <div class="secondary-nav">
        <ul>
          <li v-for="(item, index) in secondaryNavItems" :key="index">{{ item }}</li>
        </ul>
      </div>

      <!-- 角色展示区域 -->
      <div v-if="selectedTab === '角色'" class="role-display">
        <h2>所有角色</h2>
        <!-- 角色列表 -->
        <div class="roles">
          <!-- 用 v-for 遍历角色数据进行展示 -->
          <div class="role" v-for="role in roles" :key="role.id">
            <p>{{ role.name }}</p>
          </div>
        </div>
      </div>

      <!-- 其他内容展示区域可以类似 -->
      <div v-if="selectedTab === '武器'" class="weapon-display">
        <h2>所有武器</h2>
        <!-- 这里是武器内容 -->
      </div>
      <div v-if="selectedTab === '材料'" class="material-display">
        <h2>所有材料</h2>
        <!-- 这里是材料内容 -->
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      selectedTab: '角色',  // 默认选中 '角色'
      secondaryNavItems: ['选项1', '选项2', '选项3'], // 二级导航栏的内容
      roles: [  // 示例角色数据
        { id: 1, name: '角色1' },
        { id: 2, name: '角色2' },
        { id: 3, name: '角色3' },
      ],
    };
  },
  methods: {
    selectTab(tab) {
      this.selectedTab = tab;
    },
  },
};
</script>

<style scoped>
#home {
  display: flex;
  min-height: 100vh;
}

/* 左侧导航栏 */
.sidebar {
  width: 200px;
  background-color: #f4f4f4;
  padding: 20px;
}

.sidebar ul {
  list-style: none;
  padding: 0;
}

.sidebar li {
  padding: 10px;
  cursor: pointer;
}

.sidebar li.active {
  background-color: #ddd;
}

/* 主内容区 */
.content {
  flex: 1;
  padding: 20px;
  display: flex;
  flex-direction: column;
}

.secondary-nav {
  background-color: #f0f0f0;
  padding: 10px;
}

.secondary-nav ul {
  list-style: none;
  padding: 0;
  display: flex;
}

.secondary-nav li {
  margin-right: 20px;
  cursor: pointer;
}

/* 角色展示区域 */
.role-display {
  margin-top: 20px;
}

.roles {
  display: flex;
  flex-wrap: wrap;
}

.role {
  width: 150px;
  padding: 10px;
  background-color: #f9f9f9;
  margin-right: 10px;
  margin-bottom: 10px;
  text-align: center;
}

.role p {
  margin: 0;
}
</style>
