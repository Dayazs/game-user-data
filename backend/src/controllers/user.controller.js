import {login} from '../services/user.service'

// 处理登录请求
async function login(req,res) {
const token = await login(req)
}