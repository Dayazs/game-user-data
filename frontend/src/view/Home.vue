<template>
  <div class="home">

    <!-- 左侧图片 -->
    <div class="bg left-bg" :class="{ clear: hover === 'left' }"></div>

    <!-- 右侧图片 -->
    <div class="bg right-bg" :class="{ clear: hover === 'right' }"></div>

    <!-- 中间圆 -->
    <div class="circle">

      <!-- 左半圆 -->
      <router-link class="half left" @mouseenter="hover = 'left'" @mouseleave="hover = ''"
        :class="{ active: hover === 'left' }" :to="{ path: '/wuwa' }"></router-link>

      <!-- 右半圆 -->
      <router-link class="half right" @mouseenter="hover = 'right'" @mouseleave="hover = ''"
        :class="{ active: hover === 'right' }" :to="{ path: '/the_endland' }"></router-link>

    </div>

  </div>
</template>

<script setup>
import { ref } from 'vue'
const hover = ref('')
</script>

<style scoped>
.home {
  position: relative;
  width: 100vw;
  height: 100vh;
  overflow: hidden;

  display: flex;
  justify-content: center;
  align-items: center;
}

/* 公共背景层 */
.bg {
  position: absolute;
  inset: 0;
  background-size: cover;
  background-position: center;
  background-color: #555;
}

/* 左图 */
.left-bg {
  background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.4)), url('../assets/img/wuwa/wuwa.jpg');
  clip-path: polygon(0% 0%, 60% 0%, 40% 100%, 0% 100%);
}

.left-bg.clear {
  background-image:
    linear-gradient(rgba(0, 0, 0, 0.3), rgba(0, 0, 0, 0.1)),
    url('../assets/img/wuwa/wuwa.jpg');
}

.right-bg.clear {
  background-image:
    linear-gradient(rgba(0, 0, 0, 0.3), rgba(0, 0, 0, 0.1)),
    url('../assets/img/endland/endland.png');
}

/* 右图 */
.right-bg {
  transform: rotateY(180deg);
  background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.4)), url('../assets/img/endland/endland.png');
  clip-path: polygon(0% 0%, 40% 0%, 60% 100%, 0% 100%);
}

/* 圆容器 */
.circle {
  position: relative;
  width: 220px;
  height: 220px;
  z-index: 2;
}

/* 半圆基础 */
.half {
  position: absolute;
  width: 110px;
  height: 220px;
  top: 0;
  transition: transform 0.3s ease;
}

/* 左半圆 */
.left {
  cursor: pointer;
  left: 0;
  background: rgba(0, 0, 255, 0.6);
  border-top-left-radius: 110px;
  border-bottom-left-radius: 110px;
  transform-origin: right center;
  transform: rotate(22.5deg);
}

/* 右半圆 */
.right {
  cursor: pointer;
  right: 0;
  background: rgba(255, 255, 0, 0.6);
  border-top-right-radius: 110px;
  border-bottom-right-radius: 110px;
  transform-origin: left center;
  transform: rotate(22.5deg);
}

/* hover 放大 */
.left.active {
  transform: rotate(22.5deg) scale(1.15);
}

.right.active {
  transform: rotate(22.5deg) scale(1.15);
}
</style>