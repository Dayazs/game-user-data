<template>
  <div class="out-box">
    <!-- 左侧导航栏 -->
    <div class="side-menu-inner">


      <!-- 标题 -->
      <div class="menu-title">
        <span>目录</span>
      </div>


      <!-- 列表区 -->
      <div class="menu-tree">
        <div class="menu-tree-item-wraper">
          <div class="has-children"></div>
        </div>
      </div>
    </div>
  </div>
</template>


<script setup>

</script>


<style scoped>
.out-box {
  display: flex;
  justify-content: center;
}

.side-menu-inner {
  width: 13rem;
  height: 100vh;
  background-color: aquamarine;
}
</style>