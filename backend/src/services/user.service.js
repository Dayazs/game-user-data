import {
  findUserByAccount,
  registerUser,
  findUser,
} from '../models/user.model.js'
import bcrypt from 'bcryptjs'

// 注册
async function register(account_number, password, username) {
  const user = await findUserByAccount(account_number)
  if (user) {
    throw new Error('账号已被注册')
  }

  const hash = await bcrypt.hash(password, 10)
  return await registerUser(account_number, hash, username)
}

// 登录
async function login(account_number, password) {
  const user = await findUserByAccount(account_number)
  if (!user) {
    throw new Error('账号不存在')
  }

  const isMatch = await bcrypt.compare(password, user.password)
  if (!isMatch) {
    throw new Error('密码错误')
  }

  return user
}

// 获取用户信息
async function getUser(user_id) {
  const userData = await findUser(user_id)
  const loginTime = Date.now()
  return { userData, loginTime }
}

export { register, login, getUser }
