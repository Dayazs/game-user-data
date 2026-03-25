import { findUserByAccount, registerUser } from '../models/user.model.js'
import bcrypt from 'bcryptjs'

// 注册
async function register(account_number, password, username) {
  const user = await findUserByAccount(account_number)
  if (user) {
    throw new Error('账号已被注册')
  }

  const hash = await bcrypt.hash(password, 10)
  let result = await registerUser(account_number, hash, username)
  let rows = await findUserByAccount(account_number)
  return { result, rows }
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

export { register, login }
