<template>
  <!-- 登录模块 -->
  <div class="login-module">
    <!-- 用户头像 -->
    <div class="user-avatar">
      <img v-if="resData.user_avatar"
        :src="`/api/images/users/${resData.account_number}/headImg/${resData.user_avatar}`" alt="">
      <img v-else :src="'/api/images/users/default/headImg/default.jpg'" alt="">
    </div>

    <!-- 已登录 -->
    <div class="already-ligin" v-if="isAuth">
      <!-- 用户主页 -->
      <div class="user-profile">
        主页
      </div>
      <!-- 退出 -->
      <div class="log-out" @click="logout">
        退出
      </div>
    </div>

    <!-- 未登录 -->
    <div class="not-login" v-else>
      <!-- 登录 -->
      <div class="user-login" @click="open">
        登录
      </div>
      <!-- 注册 -->
      <div class="user-register" @click="register">
        注册
      </div>
    </div>
    <div class="active-login">
      <img v-if="isAuth" src="../../../public/acvtiveLogin.png" alt="" class="active-login-img">
    </div>
  </div>

  <teleport to='body'>
    <!-- 弹窗 -->
    <div v-if="showModal" class="modal">
      <div class="box">
        <!-- <button @click="close" class="close">关闭</button> -->
        <h3>{{ isLogin ? '登录' : '注册' }}</h3>


        <!-- 账号 -->
        <div>
          账号
          <input v-model="form.account_number" placeholder="请输入账号" class="text-input" />
          <p class="error" v-if="errors.account_number">{{ errors.account_number }}</p>
        </div>


        <!-- 密码 -->
        <div>
          密码
          <input v-model="form.password" type="password" placeholder="请输入密码" class="text-input" />
          <p class="error" v-if="errors.password">{{ errors.password }}</p>
        </div>



        <!-- 注册才显示 -->
        <template v-if="!isLogin">
          <div>
            确认密码
            <input v-model="form.confirmPassword" type="password" placeholder="请确认密码" class="text-input" />
            <p class="error" v-if="errors.confirmPassword">{{ errors.confirmPassword }}</p>
          </div>


          <div>
            用户名
            <input v-model="form.username" placeholder="请输入用户名" class="text-input" />
            <p class="error" v-if="errors.username">{{ errors.username }}</p>
          </div>

        </template>

        <!-- 条款 -->
        <div class="clause">
          <input type="checkbox" v-model="form.agree" class="check-input" />
          <span class="clause-text">请勿输入敏感信息</span>
        </div>

        <button @click="submit" :disabled="!form.agree" class="lr-btn" :class="{ 'active-btn': form.agree }">
          {{ isLogin ? '登录' : '注册' }}
        </button>

        <!-- 切换 -->
        <p class="switch">
          <span v-if="isLogin">
            没有账号？
            <a @click="toggle">去注册</a>
          </span>
          <span v-else>
            已有账号？
            <a @click="toggle">返回登录</a>
          </span>
        </p>

        <button class="close" @click="close">×</button>
      </div>
    </div>
  </teleport>
</template>

<script setup>
import { onMounted, ref } from 'vue'
import { jwtDecode } from 'jwt-decode'
import axios from 'axios'

axios.interceptors.request.use(config => {
  const token = localStorage.getItem('token')
  if(token){
    config.headers.Authorization = `Bearer ${token}`
  }
  return config
})



// 显示/关闭登录小窗
const showModal = ref(false)
// 切换登录注册
const isLogin = ref(true)

// 表单数据
const form = ref({
  account_number: '',
  password: '',
  confirmPassword: '',
  username: '',
  agree: false
})

// 错误状态
const errors = ref({
  account_number: '',
  password: '',
  confirmPassword: '',
  username: ''
})

// 响应数据
const resData = ref({
  account_number: '',
  username: '',
  is_admin: '',
  user_avatar: ''
})

// 登录状态
const isAuth = ref(false)


// 登录
function open() {
  showModal.value = true
  isLogin.value = true
  // 清空状态
  form.value = {
    account_number: '',
    password: '',
    confirmPassword: '',
    username: '',
  }
}

// 关闭
function close() {
  showModal.value = false
  form.value.agree = false
  // 清空状态
  errors.value = {
    account_number: '',
    password: '',
    confirmPassword: '',
    username: ''
  }
}

// 注册
function register() {
  isLogin.value = false
  showModal.value = true
  // 清空状态
  form.value = {
    account_number: '',
    password: '',
    confirmPassword: '',
    username: '',
  }
}
// 切换
function toggle() {
  isLogin.value = !isLogin.value
  // 清空状态
  errors.value = {
    account_number: '',
    password: '',
    confirmPassword: '',
    username: ''
  }
}

// 校验
function validate() {
  const { account_number, password, confirmPassword, username } = form.value

  // 清空
  errors.value = {
    account_number: '',
    password: '',
    confirmPassword: '',
    username: ''
  }

  let valid = true

  // 账号
  if (!account_number) {
    errors.value.account_number = '请输入账号'
    valid = false
  } else if (!/^[a-zA-Z0-9]+$/.test(account_number)) {
    errors.value.account_number = '账号只能是字母和数字'
    valid = false
  }

  // 密码
  if (!password) {
    errors.value.password = '请输入密码'
    valid = false
  } else if (/\s/.test(password)) {
    errors.value.password = '密码不能有空格'
    valid = false
  }

  // 注册才校验
  if (!isLogin.value) {
    if (!confirmPassword) {
      errors.value.confirmPassword = '请确认密码'
      valid = false
    } else if (password !== confirmPassword) {
      errors.value.confirmPassword = '密码不一致'
      valid = false
    }

    if (!username) {
      errors.value.username = '请输入用户名'
      valid = false
    } else if (/\s/.test(username)) {
      errors.value.username = '用户名不能有空格'
      valid = false
    }
  }

  return valid
}

onMounted(() => {
  const token = localStorage.getItem('token')
  const userInfo = JSON.parse(localStorage.getItem('userInfo'))
  resData.value = {
    ...resData.value,
    ...userInfo
  }
  if (!token) {
    return
  }

  try {
    const decoded = jwtDecode(token)

    // 判断是否过期
    if (decoded.exp * 1000 > Date.now()) {
      isAuth.value = true
    } else {
      localStorage.removeItem('token')
    }
  } catch {
    localStorage.removeItem('token')
  }
})


// 提交
async function submit() {
  if (!form.value.agree) return alert('请先同意条款')
  if (!validate()) return

  // 向后端发送请求进行验证
  let res
  if (isLogin.value) {
    res = await axios.post('/api/user/login', form.value)
    // 根据后端的状态码判断
    if (res.data.code === 403) {
      return alert('账号或密码错误')
    }
    alert('登录成功!')
  } else {
    res = await axios.post('/api/user/register', form.value)
    if (res.data.code === 401) {
      return alert('该用户已被注册')
    }
    alert('注册成功!')
  }

  localStorage.setItem('token', res.data.token)
  localStorage.setItem('userInfo',JSON.stringify(res.data.user))

  // 写入用户信息
  // resData.value.account_number = res.data.user.account_number
  // resData.value.username = res.data.user.username
  // resData.value.is_admin = res.data.user.is_admin
  // resData.value.user_avatar = res.data.user.user_avatar
  // 对象展开
  resData.value = {
    ...resData.value,
    ...res.data.user
  }

  isAuth.value = true
  close()
}

// 退出登录
function logout() {
  if (!confirm('确定要登出吗?')) return

  localStorage.removeItem('token')
  localStorage.removeItem('userInfo')
  resData.value = {
    account_number: '',
    username: '',
    is_admin: '',
    user_avatar: ''
  }
  isAuth.value = false
}
</script>

<style scoped>
.modal {
  position: fixed;
  inset: 0;
  background: rgba(0, 0, 0, .5);
  display: flex;
  justify-content: center;
  align-items: center;
}

.box {
  position: relative;
  width: 350px;
  background: #fff;
  padding: 20px;
  border-radius: 8px;
}

h3 {
  margin-bottom: 0.5rem;
}

input {
  display: block;
  width: 300px;
  margin: 10px 0;
}

.text-input {
  height: 2.5rem;
  border-radius: 1rem;
  border: solid 0.1rem #b6b6b6;
  padding: 0.8rem;
  transition: border-color 0.1s;
  outline: none;
}

.text-input:focus {
  border: solid 0.15rem #a9a9a9;
  padding: 0.75rem;
}

.clause {
  display: flex;
  justify-content: center;
  align-items: center;
  margin-top: 10px;
  margin-left: 25%;
}

.check-input {
  height: 1rem;
  width: 1rem;
}

.check-input:hover {
  cursor: pointer;
}

.clause-text {
  /* margin-left: -7rem; */
  margin-left: 0.5rem;
  width: 15rem;
  line-height: 2.5rem;
}

.lr-btn {
  display: block;
  margin: 10px auto;
  height: 2.2rem;
  width: 8rem;
  border: none;
  border-radius: 1rem;
  background: #b8b8b8;
  color: #fff;
}

.active-btn {
  background: #555;
}

.active-btn:hover {
  cursor: pointer;
}

.error {
  color: red;
  font-size: 12px;
  margin-top: -5px;
  margin-bottom: 5px;
}


.switch {
  font-size: 12px;
  margin-top: 10px;
  text-align: center;
}

a {
  color: blue;
  cursor: pointer;
}

.close {
  height: 1.5rem;
  width: 1.5rem;
  text-align: center;
  line-height: 1.4rem;

  border: 0;
  border-radius: 50%;
  background: #fff;

  position: absolute;
  right: 0.8rem;
  top: 0.8rem;

  font-size: 1.5rem;
  color: rgba(25, 25, 25, 0.7)
}

.close:hover {
  cursor: pointer;
}


.login-module {
  position: fixed;
  bottom: 7rem;

  height: 12.5rem;
  width: 5rem;
  background: #e9e9e9;
  border-radius: 2.5rem;
  margin-left: 0.9rem;
}

.user-avatar {
  /* background: #cef165; */
  height: 4rem;
  width: 4rem;
  margin-top: 0.5rem;
  margin-left: 0.5rem;
  border-radius: 50%;
}

.user-avatar img {
  width: 100%;
  height: 100%;
  border-radius: 50%;
}

.user-profile {
  background: #c9cfcf;
  height: 2rem;
  width: 4rem;
  margin-left: 0.5rem;
  margin-top: 1.5rem;
  border-radius: 0.3rem;

  text-align: center;
  line-height: 2rem;
}

.user-profile:hover {
  cursor: pointer;
  background: #696868;
  color: #fff;
}

.log-out {
  background: #c9cfcf;
  height: 2rem;
  width: 4rem;
  margin-left: 0.5rem;
  margin-top: 0.5rem;
  border-radius: 0.3rem;

  text-align: center;
  line-height: 2rem;
}

.log-out:hover {
  cursor: pointer;
  background: #696868;
  color: #fff;
}

.user-login {
  background: #c9cfcf;
  height: 2rem;
  width: 4rem;
  margin-left: 0.5rem;
  margin-top: 1.5rem;
  border-radius: 0.3rem;

  text-align: center;
  line-height: 2rem;
}

.user-login:hover {
  cursor: pointer;
  background: #696868;
  color: #fff;
}

.user-register {
  background: #c9cfcf;
  height: 2rem;
  width: 4rem;
  margin-left: 0.5rem;
  margin-top: 0.5rem;
  border-radius: 0.3rem;

  text-align: center;
  line-height: 2rem;
}

.user-register:hover {
  cursor: pointer;
  background: #696868;
  color: #fff;
}

.active-login{
  width: 1.4rem;
  height: 1.4rem;
  margin-left: 1.75rem;
  margin-top: 0.2rem;
}

.active-login-img{
  width: 100%;
  height: 100%;
}
</style>