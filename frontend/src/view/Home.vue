<template>
  <!-- 外部最大盒子 -->
  <div class="outer-box">
    <!-- 左侧导航区 -->
    <div class="left-nav">
      <!-- 返回首页 -->
      <div class="logo"></div>
      <!-- 主导航 -->
      <div class="nav">
        <div class="nav-item"><a href="">角色</a></div>
        <div class="nav-item"><a href="">武器</a></div>
        <div class="nav-item"><a href="">装备</a></div>
      </div>
    </div>

    <!-- 右侧内容区 -->
    <div class="right-content">
      <!-- 筛选区 -->
      <div class="filters">
        <!-- 星级 -->
        <div class="filter-box">
          <div class="filter-label">星级</div>
          <div class="star-options">
            <div class="star-item">6星</div>
            <div class="star-item">5星</div>
            <div class="star-item">4星</div>
          </div>
        </div>
        <!-- 属性 -->
        <div class="filter-box">
          <div class="filter-label">属性</div>
          <div class="icon-items">
            <div class="icon-item" title="寒冷"></div>
            <div class="icon-item" title="灼热"></div>
            <div class="icon-item" title="物理"></div>
            <div class="icon-item" title="自然"></div>
            <div class="icon-item" title="电磁"></div>
          </div>
        </div>
        <!-- 类型 -->
        <div class="filter-box">
          <div class="filter-label"></div>
          <div class="icon-items">
            <div class="icon-item" title="术士"></div>
            <div class="icon-item" title="突击"></div>
            <div class="icon-item" title="先锋"></div>
            <div class="icon-item" title="近卫"></div>
            <div class="icon-item" title="辅助"></div>
            <div class="icon-item" title="重装"></div>
          </div>
        </div>
      </div>
      <!-- 列表区 -->
      <div class="list-area">
        <div class="grid">
          <!-- 使用v-for来遍历，根据星级的不同设置底部颜色 -->
          <a class="card">
            <img src="" alt="">
            <!-- 角色名称 -->
            <div class="card-name"></div>
            <!-- 底部颜色 -->
            <div class="card-bottom-color"></div>
          </a>
        </div>
      </div>
    </div>
  </div>

</template>

<script setup>

</script>

<style scoped>
/* 外层盒子 */
.outer-box{
  display: flex;
}


/* 左侧导航区 */
.left-nav {
  width: 8rem;
  height: 100vh;
  background-color: aqua;
}

.logo {
  height: 6rem;
  width: 8rem;
  background-color: antiquewhite;
  margin-bottom: 2rem;
}

.nav {
  width: 8rem;
  background-color: aquamarine;
}

.nav-item {
  height: 4rem;
  /* 文字居中 */
  text-align: center;
  line-height: 4rem;
  font-size: 1.6rem;
}


/* 右侧内容区 */
.right-content{
  height: 100%;
}
</style>