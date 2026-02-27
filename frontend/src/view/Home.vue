<template>
  <!-- 外部最大盒子 -->
  <div class="outer-box">
    <SideNav />

    <!-- 右侧内容区 -->
    <div class="right-content">
      <!-- 筛选区 -->
      <div class="filters">
        <!-- 星级 -->
        <div class="filter-box">
          <div class="filter-label">星级</div>
          <div class="star-options">
            <div class="star-item" @click="toggleCharacterFilter('star_level', 6)"
              :class="{ 'star-active': selectedFilters.star_level === 6 }">6星</div>
            <div class="star-item" @click="toggleCharacterFilter('star_level', 5)"
              :class="{ 'star-active': selectedFilters.star_level === 5 }">5星</div>
            <div class="star-item" @click="toggleCharacterFilter('star_level', 4)"
              :class="{ 'star-active': selectedFilters.star_level === 4 }">4星</div>
          </div>
        </div>
        <!-- 属性 -->
        <div class="filter-box">
          <div class="filter-label">属性</div>
          <div class="icon-items">
            <div class="icon-item" title="寒冷" @click="toggleCharacterFilter('damage_type', 'property_4.png')" :class="{
              'icon-active': selectedFilters.damage_type === 'property_4.png',
              'icon-faded': selectedFilters.damage_type && selectedFilters.damage_type !== 'property_4.png'
            }" style="background-image: url('images/general/type/property_4.png');">
            </div>
            <div class="icon-item" title="灼热" @click="toggleCharacterFilter('damage_type', 'property_3.png')" :class="{
              'icon-active': selectedFilters.damage_type === 'property_3.png',
              'icon-faded': selectedFilters.damage_type && selectedFilters.damage_type !== 'property_3.png'
            }" style="background-image: url('images/general/type/property_3.png');">
            </div>
            <div class="icon-item" title="物理" @click="toggleCharacterFilter('damage_type', 'property_1.png')" :class="{
              'icon-active': selectedFilters.damage_type === 'property_1.png',
              'icon-faded': selectedFilters.damage_type && selectedFilters.damage_type !== 'property_1.png'
            }" style="background-image: url('images/general/type/property_1.png');">
            </div>
            <div class="icon-item" title="自然" @click="toggleCharacterFilter('damage_type', 'property_2.png')" :class="{
              'icon-active': selectedFilters.damage_type === 'property_2.png',
              'icon-faded': selectedFilters.damage_type && selectedFilters.damage_type !== 'property_2.png'
            }" style="background-image: url('images/general/type/property_2.png');">
            </div>
            <div class="icon-item" title="电磁" @click="toggleCharacterFilter('damage_type', 'property_5.png')" :class="{
              'icon-active': selectedFilters.damage_type === 'property_5.png',
              'icon-faded': selectedFilters.damage_type && selectedFilters.damage_type !== 'property_5.png'
            }" style="background-image: url('images/general/type/property_5.png');">
            </div>
          </div>
        </div>
        <!-- 类型 -->
        <div class="filter-box">
          <div class="filter-label">类型</div>
          <div class="icon-items">
            <div class="icon-item" title="术士" @click="toggleCharacterFilter('role_type', 'profession_5.png')" :class="{
              'icon-active': selectedFilters.role_type === 'profession_5.png',
              'icon-faded': selectedFilters.role_type && selectedFilters.role_type !== 'profession_5.png'
            }" style="background-image: url('images/general/definition/profession_5.png');"></div>
            <div class="icon-item" title="突击" @click="toggleCharacterFilter('role_type', 'profession_4.png')" :class="{
              'icon-active': selectedFilters.role_type === 'profession_4.png',
              'icon-faded': selectedFilters.role_type && selectedFilters.role_type !== 'profession_4.png'
            }" style="background-image: url('images/general/definition/profession_4.png');"></div>
            <div class="icon-item" title="先锋" @click="toggleCharacterFilter('role_type', 'profession_3.png')" :class="{
              'icon-active': selectedFilters.role_type === 'profession_3.png',
              'icon-faded': selectedFilters.role_type && selectedFilters.role_type !== 'profession_3.png'
            }" style="background-image: url('images/general/definition/profession_3.png');"></div>
            <div class="icon-item" title="近卫" @click="toggleCharacterFilter('role_type', 'profession_1.png')" :class="{
              'icon-active': selectedFilters.role_type === 'profession_1.png',
              'icon-faded': selectedFilters.role_type && selectedFilters.role_type !== 'profession_1.png'
            }" style="background-image: url('images/general/definition/profession_1.png');"></div>
            <div class="icon-item" title="辅助" @click="toggleCharacterFilter('role_type', 'profession_6.png')" :class="{
              'icon-active': selectedFilters.role_type === 'profession_6.png',
              'icon-faded': selectedFilters.role_type && selectedFilters.role_type !== 'profession_6.png'
            }" style="background-image: url('images/general/definition/profession_6.png');"></div>
            <div class="icon-item" title="重装" @click="toggleCharacterFilter('role_type', 'profession_2.png')" :class="{
              'icon-active': selectedFilters.role_type === 'profession_2.png',
              'icon-faded': selectedFilters.role_type && selectedFilters.role_type !== 'profession_2.png'
            }" style="background-image: url('images/general/definition/profession_2.png');"></div>
          </div>
        </div>
      </div>
      <!-- 列表区 -->
      <div class="list-area">
        <div class="grid" v-if="characters.length > 0">
          <!-- 使用v-for来遍历，根据星级的不同设置底部颜色 -->
          <router-link class="card" v-for="character in characters" :key="character.id"
            :to="{
              path: '/character/characterDetail',
              query: {id: character.id}
            }">
            <img :src="`/images/characters/${character.spell}/${character.spell}_small.jpg`" alt="" class="card-img">
            <!-- 属性/职位 -->
            <div class="card-icons">
              <div class="mini-icon" :style="{ backgroundImage: `url(/images/general/type/${character.damage_type})` }">
              </div>
              <div class="mini-icon"
                :style="{ backgroundImage: `url(/images/general/definition/${character.role_type})` }"></div>
            </div>
            <!-- 角色名称 -->
            <div class="card-name">{{ character.name }}</div>
            <!-- 底部颜色 -->
            <div class="card-bottom-color" :class="`star-color-${character.star_level}`"></div>
          </router-link>
        </div>
        <div v-else class="no-data">暂无数据</div>
      </div>
    </div>
  </div>

</template>

<script setup>
import { ref, onMounted } from 'vue';
import axios from 'axios'
import SideNav from '@/components/SideNav.vue'

// 用于存储所有角色基本信息
let allCharacters = null
// 用于存储筛选的角色信息
const characters = ref([])

onMounted(async () => {
  // 获取所有角色的基本信息
  const res = await axios.get('api/characters')
  characters.value = res.data
  allCharacters = res.data
  // console.log(res.data);
})


// 筛选功能
// 根据一个或多个条件筛选
const selectedFilters = {
  star_level: null,
  damage_type: null,
  role_type: null
}   // 用于存储筛选的条件
const toggleCharacterFilter = (filterType, value) => {
  // 三个筛选条件的切换
  switch (filterType) {
    case 'star_level': selectedFilters.star_level === value ? selectedFilters.star_level = null : selectedFilters.star_level = value
      break
    case 'damage_type': selectedFilters.damage_type === value ? selectedFilters.damage_type = null : selectedFilters.damage_type = value
      break
    case 'role_type': selectedFilters.role_type === value ? selectedFilters.role_type = null : selectedFilters.role_type = value
      break
  }
  // 每次点击执行过滤函数
  filterCharacters()
}
// 过滤函数
const filterCharacters = () => {
  characters.value = allCharacters.filter(character => {
    return (
      (!selectedFilters.star_level || character.star_level === selectedFilters.star_level) &&
      (!selectedFilters.damage_type || character.damage_type === selectedFilters.damage_type) &&
      (!selectedFilters.role_type || character.role_type === selectedFilters.role_type)
    )
  })
}

</script>

<style scoped>
/* 外层盒子 */
.outer-box {
  display: flex;
}


/* 右侧内容区 */
.right-content {
  height: 100%;
  margin-left: 7rem;
}

/* 筛选区 */
.filters {
  display: flex;
  margin-top: 4rem;
}

.filter-box {
  margin-left: 2rem;
  display: flex;
  height: 2.6rem;
  width: 26rem;

  text-align: center;
  line-height: 2.6rem;
}

/* 星级 */
.filter-label {
  width: 4rem;
  font-size: 1.6rem;
  font-weight: 700;
  color: #3d3d3d;
}

.star-options {
  width: 22rem;
  display: flex;
  justify-content: space-around;
}

.star-item {
  height: 2.6rem;
  width: 5.5rem;
  font-size: 1.2rem;
  font-weight: 700;
  color: #2a2a2a;
  background-color: #ebebeb;
  border-radius: 0.4rem;
  /* 鼠标悬浮变小手 */
  cursor: pointer;
}

/* 属性&职业 */
.icon-items {
  padding-top: 0.5rem;
  width: 22rem;
  display: flex;
  /* justify-content: space-around; */
}

.icon-item {
  width: 2rem;
  height: 2rem;
  margin-left: 1.5rem;
  /* 将图片调整为盒子大小而且不重复 */
  background-size: cover;
  background-repeat: no-repeat;
  background-position: center;
  cursor: pointer;
}

/* 选中添加样式 */
.star-active {
  background-color: #252527;
  color: #efeff1;
}

.icon-active {
  transform: scale(1.1);
}

.icon-faded {
  opacity: 0.6;
}

/* 列表区 */
.list-area {
  /* margin-left: 1rem; */
  margin-top: 2.5rem;
  /* margin-right: 4.2rem; */
}

.grid {
  margin-left: 2rem;
  flex: 1;
  display: grid;
  grid-template-columns: repeat(8, 1fr);
  gap: 2.2rem;
}

.card {
  position: relative;
  display: block;
  height: 16.2rem;
  width: 11.5rem;
  color: #252527;
  /* margin-left: 2.2rem; */
  box-shadow: 0 0.5rem 1.2rem rgba(0, 0, 0, 0.2);
  border: 0.1rem solid transparent;
  background: #fff;
  border-radius: 0.3rem;
}

.card:hover{
  border-color: rgb(253, 236, 27);
  box-shadow: 0 0.5rem 1.2rem rgba(253, 236, 27, 0.2);
}

.card-img {
  width: 100%;
  height: 85%;
  border-radius: 0.2rem 0.2rem 0 0;
}

/* 底部星级颜色 */
.card-bottom-color {
  position: absolute;
  height: 0.5rem;
  /* 将星级的颜色固定到角色卡片的底部 */
  bottom: 0;
  left: 0;
  right: 0;
  border-radius: 0 0 0.2rem 0.2rem;
}

/* 6星 */
.star-color-6 {
  background-color: #f97314;
}

/* 5星 */
.star-color-5 {
  background-color: #fccc18;
}

/* 4星 */
.star-color-4 {
  background-color: #af85f7;
}

.card-icons {
  position: absolute;
  left: 0.5rem;
  top: 0.5rem;
}

/* 职业和属性 */
.mini-icon {
  width: 2.1rem;
  height: 2.1rem;
  margin-bottom: 0.4rem;
  background-size: cover;
  background-repeat: no-repeat;
  background-position: center;
  /* 圆滑边框 */
  border-radius: 0.3rem;
}

/* 暂无数据样式 */
.no-data {
  font-size: 2rem;
  color: #9b9b9b;
  text-align: center;
  padding-top: 9rem;
  padding-left: 27rem;
}
</style>