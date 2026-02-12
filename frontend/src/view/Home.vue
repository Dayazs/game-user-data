<template>
  <!-- 角色列表 -->
  <div class="roles">
    <div class="role-card" v-for="role in roles" :key="role.id">
      <!-- 左上角 定位 + 属性 -->
      <div class="role-icons" v-if="role.rankInfo">
        <img :src="getRankImg(role.rankInfo[0].role_type)" />
        <img :src="getDamageImg(role.rankInfo[0].damage_type)" />
      </div>

      <!-- 角色背景图 -->
      <img class="role-bg" :src="getCharacterImg(role.spell)" />

      <!-- 角色名字 -->
      <div class="role-name">
        {{ role.name }}
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue';
import { getAllcharacters, getCharacterRanks } from '@/api/character';

const roles = ref([]);
onMounted(async () => {
  const res = await getAllcharacters();
  roles.value = res.data;

  // 请求每个角色的属性定位
  await Promise.all(
    roles.value.map(async (role) => {
      const rankRes = await getCharacterRanks(role.id);
      // console.log(rankRes.data[0].damage_type);

      role.rankInfo = rankRes.data;
    })
  )
})

const getCharacterImg = (spell) => {
  // console.log(spell);

  return `http://localhost:3000/images/characters/${spell}/${spell}.png`
}

const getRankImg = (name) => {
  console.log(name);
  return `http://localhost:3000/images/general/definition/${name}`
}

const getDamageImg = (name) => {
  console.log(name);
  return `http://localhost:3000/images/general/type/${name}`
}
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
