<template>
  <div class="comment-card-item" v-for="(item, index) in comment" :key="item.comment_id"
    :class="{ 'new-comment': item.isNew }">
    <!-- 评论主体 -->
    <div class="comment-card-item-body">
      <!-- 头像 -->
      <div class="comment-card-item-body-head">
        <img
          :src="item.user_avatar ? `/api/images/users/${item.account_number}/headImg/${item.user_avatar}` : '/api/images/users/default/headImg/default.jpg'"
          alt="" class="comment-card-item-body-head-img">
      </div>
      <!-- 评论 -->
      <div class="comment-card-item-body-content">
        <!-- 用户名称 -->
        <div class="comment-card-item-body-username">{{ item.username }} <div class="comment-index"></div>
        </div>
        <!-- 评论内容 -->
        <div class="comment-card-item-body-text" :class="{ expand: item.isExpand }">{{ item.comment_text }}</div>
      </div>

    </div>

    <!-- 下拉框 -->
    <div class="comment-card-item-buttom">
      <!-- 点赞 -->
      <div class="comment-card-item-buttom-like">
        <div class="comment-card-item-buttom-like-btn" @click="likeComment(item.comment_id)">
          <img :src="item.isLike ? likeOn : likeOff" class="comment-card-item-buttom-like-btn-like" alt="">
          {{ item.like_number }}
        </div>
        <div class="comment-card-item-buttom-like-number"></div>
      </div>
      <!-- 下拉框和时间 -->
      <div class="comment-card-item-buttom-pulldown">
        <!-- 时间 -->
        <div class="comment-card-item-buttom-pulldown-time">{{ formDate(item.comment_time) }}</div>
        <!-- 下拉按钮 -->
        <div class="comment-card-item-buttom-pulldown-btn" @click="item.isExpand = !item.isExpand"
          v-show="item.showBtn">
          <img src="../../assets/img/endland/down.svg" alt="" class="comment-card-item-buttom-pulldown-btn-img"
            :class="{ overturn: item.isExpand }">
        </div>
      </div>
    </div>
    <div class="cut-off-rule"></div>
  </div>
</template>

<script setup>
import likeOn from '@/assets/img/endland/like_on.svg'
import likeOff from '@/assets/img/endland/like_off.svg'

import axios from 'axios'
import { ref, nextTick, onBeforeMount, watch, onMounted } from 'vue'
import { useUserStore } from '@/stores/user'

let comment = ref([])

// 登录状态
const isLogin = ref(false)

// 接收父组件传来的角色id
const props = defineProps({
  character_id: String
})

// 获取用户数据
let user = JSON.parse(localStorage.getItem('user'))

// 是否有评论
let emit = defineEmits(['has-comment'])

const userStore = useUserStore()

// 在挂载前执行
onBeforeMount(async () => {
  const result = await axios.get('/api/comment/getComment', {
    params: {
      user_id: user?.id,
      character_id: props.character_id
    }
  })

  const list = result.data.commentArr.sort((a, b) => b.like_number - a.like_number)

  comment.value = list
  // console.log(result.data.commentArr)
  emit('has-comment', list.length > 0)
})

onMounted(() => {
  isLogin.value = userStore.isLogin
})

// 监听数据变化
watch(comment, async () => {
  await nextTick()
  const elements = document.querySelectorAll('.comment-card-item-body-text')
  elements.forEach((el, index) => {
    if (el.scrollHeight > el.clientHeight) {
      comment.value[index].showBtn = true
    }
  })
})

// 时间转换
const formDate = (time) => {
  const date = new Date(time)
  const y = date.getFullYear()
  const m = date.getMonth() + 1
  const d = date.getDate()
  const h = String(date.getHours()).padStart(2, '0')
  const min = String(date.getMinutes()).padStart(2, '0')
  return `${y}年${m}月${d}日 ${h}:${min}`
}


// 登录后刷新评论区
watch(
  () => userStore.needRefreshComment,
  () => {
    getComment()
  })

const getComment = async () => {
  user = JSON.parse(localStorage.getItem('user'))
  let newResult = await axios.get('/api/comment/getComment', {
    params: {
      user_id: user?.id,
      character_id: props.character_id
    }
  })
  let newList = newResult.data.commentArr.sort((a, b) => b.like_number - a.like_number)
  comment.value = newList
  emit('has-comment', newList.length > 0)
}

// 发送评论后先插入到本地
const addComment = (newComment) => {
  comment.value.push(newComment)
  emit('has-comment', true)
}

const scrollToBottom = async () => {
  await nextTick()

  const el = document.querySelector('.comment-card-body')
  if (el) {
    el.scrollTop = el.scrollHeight
  }
}


// 暴露添加评论方法
defineExpose({ addComment, scrollToBottom })


watch(
  () => userStore.isLogin,
  () => {
    isLogin.value = userStore.isLogin
  })

// 点赞评论功能
const likeComment = async (comment_id) => {
  // 判断登录状态
  if (!isLogin.value) return

  const result = await axios.post('/api/comment/likeComment', {
    comment_id,
    character_id: props.character_id
  })

  if (result.data.code === 20000) {
    const item = comment.value.find(item => item.comment_id === comment_id)

    if (item) {
      item.isLike = !item.isLike
      item.like_number += item.isLike ? 1 : -1
    }
    console.log(comment)
  }
}
</script>

<style scoped>
.comment-card-item {
  margin-bottom: 2rem;
  padding: 0.3rem;
}

.comment-card-item-body {
  display: flex;
}

.comment-card-item-body-head {
  width: 3.7rem;
  height: 3.7rem;
  border-radius: 50%;
  /* background-color: aqua; */
  margin-bottom: 0.2rem;
  border: 0.05rem solid #efff0d98;
}

.comment-card-item-body-head-img {
  height: 100%;
  width: 100%;
  border-radius: 50%;
}

.comment-card-item-body-content {
  /* border-left: 0.1rem solid #bfbfbf; */
  margin-left: 0.2rem;
  /* font-size: 0.95rem; */
  /* border-radius: 0.1rem; */
}

.comment-card-item-body-username {
  display: flex;
  justify-content: space-between;

  height: 1.8rem;
  width: 100%;
  padding-left: 0.3rem;
  font-weight: 450;
  /* background-color: blueviolet; */
  /* border-bottom: 0.1rem solid #bfbfbf; */
}

.comment-index {
  margin-right: 0.2rem;
  font-weight: 300;
  font-size: 0.9rem;
  color: #a8a8a8;
}

.comment-card-item-body-text {
  /* height: 4.5rem; */
  width: 18.4rem;
  /* background-color: aquamarine; */
  padding-left: 0.5rem;
  padding-right: 0.5rem;
  font-size: 0.9rem;
  color: #646464;
  /* padding-top: 0.5rem; */

  display: -webkit-box;
  -webkit-box-orient: vertical;
  -webkit-line-clamp: 3;
  overflow: hidden;
}

.comment-card-item-body-text.expand {
  -webkit-line-clamp: unset;
}

.comment-card-item-buttom {
  display: flex;
  justify-content: space-between;
  height: 2rem;
  width: 100%;
  /* background-color: brown; */
}

.comment-card-item-buttom-like {
  height: 100%;
  width: 5rem;
  /* background-color: chartreuse; */
  line-height: 1.7rem;
  color: #bfbfbf;
}

.comment-card-item-buttom-like-btn {
  display: flex;
  height: 100%;
  width: 2rem;
}

.comment-card-item-buttom-like-btn:hover {
  cursor: pointer;
}

.comment-card-item-buttom-like-btn-like {
  height: 85%;
  width: 85%;
  margin-right: 0.4rem;
}

.comment-card-item-buttom-pulldown {
  display: flex;
  justify-content: space-between;
  height: 100%;
  width: 10rem;
  /* background-color: chocolate; */
  line-height: 1.8rem;
  font-size: 0.8rem;
  color: #bfbfbf;
}

.comment-card-item-buttom-pulldown-btn {
  height: 100%;
  width: 2rem;
  /* background-color: antiquewhite; */
}

.comment-card-item-buttom-pulldown-btn:hover {
  cursor: pointer;
}

.comment-card-item-buttom-pulldown-btn-img {
  opacity: 0.5;
  width: 100%;
  height: 100%;
}

.comment-card-item-buttom-pulldown-btn-img.overturn {
  transform: rotate(180deg);
}

/* 高亮评论 */
.new-comment {
  animation: highlightFade 1.5s ease;
}

@keyframes highlightFade {
  0% {
    background-color: #e9e9e9;
  }

  100% {
    background-color: transparent;
  }
}
</style>