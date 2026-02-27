<template>
  <!-- 左侧导航区 -->
  <div class="left-nav">
    <!-- 返回首页 -->
    <div class="logo">
      <img src="/public/logo.png" alt="logo">
    </div>
    <!-- 主导航 -->
    <div class="nav">
      <div class="nav-item" :class="{ 'nav-item-active': activeNav === '角色' }" @click="activeNav = '角色'">角色</div>
      <div class="nav-item" :class="{ 'nav-item-active': activeNav === '武器' }" @click="activeNav = '武器'">武器</div>
      <div class="nav-item" :class="{ 'nav-item-active': activeNav === '装备' }" @click="activeNav = '装备'">装备</div>
    </div>
  </div>
</template>

<script setup>
import { ref } from 'vue';
// 左侧导航栏的样式切换
const activeNav = ref('角色')
</script>

<style scoped>
/* 左侧导航区 */
.left-nav {
  position: fixed;
  top: 0;
  left: 0;
  width: 7rem;
  height: 100vh;
  background-color: #fff;
  border-right: 0.1rem solid rgba(0, 0, 0, 0.06);
}

.logo {
  height: 5rem;
  width: 7rem;
  margin-top: 2rem;
  margin-bottom: 2rem;
}

.logo img{
  width: 100%;
  height: 100%;
  object-fit: contain;
  display: block;
}

.nav {
  width: 7rem;
}

.nav-item {
  height: 2.8rem;
  /* background-color: aquamarine; */
  /* 文字居中 */
  text-align: center;
  line-height: 2.8rem;
  font-size: 1.6rem;
  font-weight: 600;
  margin-bottom: 2.5rem;
  color: #d9d9d9;
  margin-left: 0.4rem;
  margin-right: 0.4rem;
  border-radius: 0.2rem;
}

.nav-item:hover {
  cursor: pointer;
}

.nav-item-active {
  border-left: 0.5rem solid #191919;
  cursor: pointer;
  background-color: #e6e6e6;
  color: #191919;
}
</style>