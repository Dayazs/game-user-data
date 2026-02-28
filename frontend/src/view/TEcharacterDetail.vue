<template>
  <div class="outer-box" v-if="!loading">
    <!-- 左侧导航 -->
    <SideNav />
    <!-- 右侧内容区 -->
    <div class="right-content">
      <!-- 当前位置 -->
      <div class="breadcrumb" id="breadcrumb">
        <a href="/" class="crumb">首页</a>
        <span class="slash">/</span>
        <a href="/the_endland" class="crumb">角色列表</a>
        <span class="slash">/</span>
        <span class="crumb">{{ thisCharacter.name }}</span>
      </div>
      <!-- 角色介绍 -->
      <div class="panel" id="introPanel">
        <div class="intro-left">
          <!-- 角色定位，属性，名称，星级 -->
          <div class="intro-rowl">
            <!-- 定位 -->
            <div class="big-icon" v-if="thisCharacter"
              :style="{ backgroundImage: `url(/images/general/definition/${thisCharacter.role_type})` }"></div>
            <!-- 属性 -->
            <div class="big-icon" v-if="thisCharacter"
              :style="{ backgroundImage: `url(/images/general/type/${thisCharacter.damage_type})` }">
            </div>
            <!-- 角色名称 -->
            <div class="name-box">
              <div class="name-box-bracket-left">[</div>
              <div class="name-box-text">{{ thisCharacter.name }}</div>
              <div class="name-box-bracket-right">]</div>
            </div>
            <!-- 星级 -->
            <div class="stars">
              <!-- 使用v-for来生成对应的星级 -->
              <div class="star" v-for="star in thisCharacter.star_level"></div>
            </div>
          </div>
          <!-- 分割线 -->
          <div class="gard-bar">
            <!-- 粉 -->
            <div class="p1"></div>
            <!-- 黄 -->
            <div class="p2"></div>
            <!-- 绿 -->
            <div class="p3"></div>
          </div>
          <!-- 阵营，种族 -->
          <div class="intro-row2">
            <div class="chip-k">阵营</div>
            <div class="chip-v" id="faction">{{ thisCharacter.faction }}</div>
            <div class="chip-k">种族</div>
            <div class="chip-v" id="race">{{ thisCharacter.race }}</div>
          </div>
          <!-- 小白话 -->
          <div class="intro-row3">{{ thisCharacterDialogues.catchphrase }}</div>
          <!-- 角色描述 -->
          <div class="intro-row4">{{ thisCharacterDialogues.introduction }}</div>
        </div>
        <!-- 角色图片 -->
        <div class="intro-img-container">
          <img v-if="thisCharacter.spell" :src="`/images/characters/${thisCharacter.spell}/${thisCharacter.spell}.png`"
            alt="" class="intro-img">
        </div>
      </div>
      <!-- 属性技能 -->
      <div class="panel2">
        <div class="two-col">
          <!-- 属性 -->
          <div class="attr">
            <!-- 属性标题 -->
            <div class="bar-title">能力值</div>
            <!-- 各个属性 -->
            <div class="attr-list">
              <!-- 力量 -->
              <div class="tanlent-item">
                <!-- 属性图片 -->
                <div class="talent-icon" :style="{ backgroundImage: `url(/images/general/property/strength.png)` }"
                  :class="{
                    'main-ability': thisCharacterStats.main_ability === 'strength.png',
                    'secondary_ability': thisCharacterStats.secondary_ability === 'strength.png'
                  }">
                </div>
                <div class="tanlent-value">{{ thisCharacterStats.strength }}</div>
                <div class="tanlent-name">力量</div>
              </div>

              <!-- 敏捷 -->
              <div class="tanlent-item">
                <!-- 属性图片 -->
                <div class="talent-icon" :style="{ backgroundImage: `url(/images/general/property/agility.png)` }"
                  :class="{
                    'main-ability': thisCharacterStats.main_ability === 'agility.png',
                    'secondary_ability': thisCharacterStats.secondary_ability === 'agility.png'
                  }">
                </div>
                <div class="tanlent-value">{{ thisCharacterStats.agility }}</div>
                <div class="tanlent-name">敏捷</div>
              </div>

              <!-- 智识 -->
              <div class="tanlent-item">
                <!-- 属性图片 -->
                <div class="talent-icon" :style="{ backgroundImage: `url(/images/general/property/intelligence.png)` }"
                  :class="{
                    'main-ability': thisCharacterStats.main_ability === 'intelligence.png',
                    'secondary_ability': thisCharacterStats.secondary_ability === 'intelligence.png'
                  }">
                </div>
                <div class="tanlent-value">{{ thisCharacterStats.intelligence }}</div>
                <div class="tanlent-name">智识</div>
              </div>

              <!-- 意志 -->
              <div class="tanlent-item">
                <!-- 属性图片 -->
                <div class="talent-icon" :style="{ backgroundImage: `url(/images/general/property/will.png)` }" :class="{
                  'main-ability': thisCharacterStats.main_ability === 'will.png',
                  'secondary_ability': thisCharacterStats.secondary_ability === 'will.png'
                }">
                </div>
                <div class="tanlent-value">{{ thisCharacterStats.willpower }}</div>
                <div class="tanlent-name">意志</div>
              </div>

              <!-- 生命 -->
              <div class="tanlent-item">
                <!-- 属性图片 -->
                <div class="talent-icon" :style="{ backgroundImage: `url(/images/general/property/hp.png)` }">
                </div>
                <div class="tanlent-value">{{ thisCharacterStats.hp }}</div>
                <div class="tanlent-name">生命值</div>
              </div>

              <!-- 攻击力 -->
              <div class="tanlent-item">
                <!-- 属性图片 -->
                <div class="talent-icon" :style="{ backgroundImage: `url(/images/general/property/attack.png)` }">
                </div>
                <div class="tanlent-value">{{ thisCharacterStats.attack }}</div>
                <div class="tanlent-name">攻击力</div>
              </div>

              <!-- 防御力 -->
              <div class="tanlent-item">
                <!-- 属性图片 -->
                <div class="talent-icon" :style="{ backgroundImage: `url(/images/general/property/defense.png)` }">
                </div>
                <div class="tanlent-value">{{ thisCharacterStats.defense }}</div>
                <div class="tanlent-name">防御力</div>
              </div>
            </div>
          </div>
          <!-- 技能 -->
          <div class="skills">
            <!-- 技能标题 -->
            <div class="bar-title">技能</div>
            <div class="skills-grid">
              <div class="skill-item" v-for="(skill, index) in thisCharacterSkills" :key="index">
                <div class="skill-icon" :style="{ backgroundColor: getSkillBgColor(skill.damage_type) }">
                  <img v-if="thisCharacter.spell"
                    :src="`/images/characters/${thisCharacter.spell}/skills/${thisCharacter.spell}_skill_${index + 1}.png`"
                    alt="">
                </div>
                <div class="skill-meta">
                  <div class="skill-name">{{ skill.skill_name }}</div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- 评论模块 -->
      <div class="commentWarpper">
        <div class="comment-card">
          <!-- 头部 -->
          <div class="comment-card-header">
            <div class="comment-card-header-title">评论区</div>
          </div>
          <!-- 身体 -->
          <div class="comment-card-body">
            <div class="comment-card-body-list"></div>
            <div class="comment-card-body-load-more-empty">暂无更多评论</div>
          </div>
          <!-- 输入框 -->
          <div class="comment-card-footer">
            <div class="comment-card-reply">
              <textarea name="" id="" class="coment-card-reply-textarea" placeholder="请输入评论" maxlength="1024"
                rows="4"></textarea>
              <div class="comment-card-reply-textarea-count">0/1024</div>
            </div>
            <div class="comment-card-reply-potions"></div>
            <div class="comment-card-emoji"></div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script setup>
import SideNav from '@/components/SideNav.vue'
import axios from 'axios'
import { computed, onMounted, ref } from 'vue'
import { useRoute } from 'vue-router'

// 接收传递过来的角色id
const route = useRoute()
const characterId = route.query.id
console.log(characterId);


// 角色基本信息
const thisCharacter = ref(null)
// 角色台词和介绍
const thisCharacterDialogues = ref(null)
// 角色属性信息
const thisCharacterStats = ref(null)
// 角色技能信息
const thisCharacterSkills = ref([])

const loading = ref(true)
// 并行
onMounted(async () => {
  try {
    const [res, dialogues, stats, skills] = await Promise.all([
      // 获取指定id的角色
      axios.get('/api/characters/characterDetail', { params: { id: characterId } }),
      // 获取指定角色台词和介绍
      axios.get('/api/characters/characterDialogues', { params: { id: characterId } }),
      // 获取指定角色属性信息
      axios.get('/api/characters/stats', { params: { id: characterId } }),
      // 获取指定角色技能信息
      axios.get('/api/characters/skill', { params: { id: characterId } })
    ])

    thisCharacter.value = res.data[0]
    thisCharacterDialogues.value = dialogues.data[0]
    thisCharacterStats.value = stats.data[0]
    thisCharacterSkills.value = skills.data
  } finally {
    loading.value = false
  }
})

// 计算属性来设置技能底色
const propertyColorMap = {
  'property_1.png': '#444444',
  'property_2.png': '#C3E354',
  'property_3.png': '#FF633D',
  'property_4.png': '#22C6D0',
  'property_5.png': '#FFC001'
}

const getSkillBgColor = (damageType) => {
  return propertyColorMap[damageType] || ''
}


</script>

<style scoped>
.outer-box {
  display: flex;
  height: 100vh;
}

.right-content {
  margin-left: 7rem;
  flex: 1;
  overflow-y: auto;
  overflow-x: hidden;
}

/* 当前位置 */
.breadcrumb {
  margin-top: 2rem;
  margin-left: 3rem;
  display: flex;
  font-size: 1.4rem;
  color: #bababa;
  gap: 0.5rem;
}

.breadcrumb a {
  color: #bababa;
}

.breadcrumb a:hover {
  color: #8f8f8f;
}

.crumb {
  color: #252527;
}

.panel {
  width: 80rem;
  /* height: 27.8rem; */
  display: flex;
  position: relative;
  background-color: #fff;
  box-shadow: 0 0 0.6rem rgba(0, 0, 0, 0.3);
  border-radius: 0.4rem;
  margin-left: 3rem;
  margin-top: 1.5rem;
  padding: 1.3rem 1.3rem;
}

.panel2 {
  width: 80rem;
  /* height: 25.9rem; */
  background-color: #fff;
  box-shadow: 0 0 0.6rem rgba(0, 0, 0, 0.3);
  border-radius: 0.4rem;
  margin-left: 3rem;
  margin-top: 1.5rem;
  padding: 1.3rem 1.3rem;
}

.two-col {
  display: flex;
  justify-content: space-between;
}

.attr {
  width: 40.4rem;
}

.skills {
  width: 32.85rem;
}

.bar-title {
  width: 100%;
  height: 2rem;
  background: #252525;
  color: #fff;
  line-height: 2rem;
  padding-left: 0.5rem;
}

.skills-grid {
  margin-top: 1rem;
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 2rem 2.2rem;
}

.skill-item {
  display: grid;
  grid-template-columns: 5rem 1fr;
  column-gap: 1.6rem;
}

.skill-icon {
  height: 5rem;
  width: 5rem;
  border-radius: 50%;
}

.skill-icon img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  display: block;
}

.skill-meta {
  display: flex;
  justify-content: center;
  /* 改变主轴防线于文本堆叠方向一致 */
  flex-direction: column;
  margin-left: -0.8rem;
}

.skill-name {
  font-size: 1.25rem;
  color: #252527;
  font-weight: 700;
  /* 防止文字溢出 */
  overflow: hidden;
  white-space: nowrap;
}

.attr-list {
  display: flex;
  flex-wrap: wrap;
  margin-top: 1.5rem;
}

.tanlent-item {
  width: 7.5rem;
  height: 6.25rem;
  margin-right: 2rem;
  margin-bottom: 2rem;
  position: relative;
  /* background-color: #999999; */
}

.talent-icon {
  width: 3.12rem;
  height: 3.12rem;
  background-size: cover;
  background-position: center;
  background-repeat: no-repeat;
  border-radius: 0.2rem;
}

.main-ability {
  background-color: #fdf957;
}

.secondary_ability {
  background-color: #CBCBCE;
}

.tanlent-value {
  position: absolute;
  left: 3.8rem;
  top: 0.2rem;
  font-size: 1.5rem;
  font-weight: 800;
  color: #252525;
}

.tanlent-name {
  position: absolute;
  left: 0;
  top: 3.3rem;
  color: #3d3d3d;
}

.intro-left {
  width: 39.5rem;
  /* height: 25.3rem; */
  /* background-color: antiquewhite; */
  z-index: 2;
  position: relative;
}

.intro-rowl {
  display: flex;
}

.big-icon {
  height: 3.1rem;
  width: 3.1rem;
  margin-right: 0.3rem;
  background-size: cover;
  background-position: center;
  background-repeat: no-repeat;
  box-shadow: 0 0.4rem 1.2rem rgba(0, 0, 0, 0.12);
  border-radius: 0.4rem;
}

/* 角色名称 */
.name-box {
  display: flex;
  margin-left: 0.8rem;
  margin-top: 0.2rem;
}

/* 角色名称括号 */
.name-box-bracket-left {
  font-size: 1.7rem;
  font-weight: 900;
  margin-right: 3.5rem;
  color: #999999;
}

.name-box-bracket-right {
  font-size: 1.7rem;
  font-weight: 900;
  margin-left: 3.5rem;
  color: #999999;
}

.name-box-text {
  font-size: 1.8rem;
  font-weight: 800;
}

/* 星级样式 */
.stars {
  display: flex;
  gap: 0.2rem;
  margin-top: 0.6rem;
  position: absolute;
  right: 0;
}

.star {
  width: 1.5rem;
  height: 1.6rem;

  background-image: url(/images/general/star.png);
  background-size: contain;
  background-repeat: no-repeat;
  background-position: center;
}

/* 分割线 */
.gard-bar {
  background-color: aqua;
  display: flex;
  height: 0.1rem;
  margin-top: 0.6rem;
  width: 100%;
}

.p1 {
  width: 9rem;
  background: #eb45e7;
}

.p2 {
  width: 9rem;
  background: #fdf957;
}

.p3 {
  flex: 1;
  background: #73f9ac;
}

/* 阵营/种族 */
.intro-row2 {
  margin-top: 0.8rem;
  display: flex;
  align-items: center;
  gap: 0;
}

.chip-k {
  padding: 0.15rem 0.5rem;
  background: #252525;
  color: #fff;
}

.chip-v {
  padding: 0.15rem 0.5rem;
  width: 8rem;
  background: #e6e6e6;
  margin-right: 0.8rem;
}

.intro-row3,
.intro-row4 {
  margin-top: 1rem;
  white-space: pre-line;
  color: #3d3d3d;
  font-size: 1.25rem;
}

.intro-row4 {
  font-size: 1rem;
}

.intro-img-container {
  position: absolute;
  top: 0;
  right: 1rem;
  width: 32rem;
  height: 100%;
  display: flex;
  align-items: center;
}

.intro-img {
  height: 100%;
}


/* 评论区模块 */
.commentWarpper {
  position: fixed;
  top: 5.5rem;
  bottom: 1rem;
  right: 1.2rem;
  width: 27.6rem;
  background-color: #fff;
  box-shadow: 0 0 0.8rem rgba(0, 0, 0, 0.3);
  border-radius: 0.4rem;
  box-sizing: border-box;
  padding: 1rem 0.8rem;
  z-index: 1000;
}

.comment-card {
  display: flex;
  width: 100%;
  height: 100%;
  box-sizing: border-box;
  flex-direction: column;
  position: relative;
}

.comment-card-header {
  width: 100%;
  background: #f0f0f0;
  border-radius: 0.4rem;
  display: flex;
  align-items: center;
  justify-content: center;
}

.comment-card-header-title {
  font-size: 1.3rem;
  font-weight: 700;
  color: #333;
  text-align: center;
  height: 2.6rem;
  line-height: 2.6rem;
}

.comment-card-body {
  margin-top: 1rem;
  margin-bottom: 1rem;
  width: 100%;
  height: 100%;
  overflow-y: auto;
  box-sizing: border-box;
  padding-bottom: 50px;
}

.comment-card-body-list {
  width: 100%;
  font-size: 1.8rem;
}

.comment-card-body-load-more-empty {
  margin-top: 1rem;
  font-size: 1rem;
  color: #999;
  text-align: center;
  padding: 1rem;
}

.comment-card-footer {
  position: relative;
  width: 100%;
  background-color: #f0f0f0;
  border-radius: 0.6rem;
  box-sizing: border-box;
  padding: 1rem;
}

.comment-card-reply {
  width: 100%;
  box-sizing: border-box;
}

.coment-card-reply-textarea {
  width: 100%;
  box-sizing: border-box;
  padding: 0.3rem;
  resize: none;
  font-size: 1rem;
}

.comment-card-reply-textarea-count {
  font-size: 0.9rem;
  color: #999;
  text-align: right;
}
</style>