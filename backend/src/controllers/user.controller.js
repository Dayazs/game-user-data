import jwt from 'jsonwebtoken'
import { register, login, getUser } from '../services/user.service.js'
import secretData from '../config/jwt.json' assert { type: 'json' }

const SECRET = secretData.SECRET

// 注册
async function userRegister(req, res) {
  try {
    const { account_number, password, username } = req.body

    // 对前端传来的参数进行校验
    if (!/^[a-zA-Z0-9]+$/.test(account_number)) {
      return res.json({ message: '账号只能是字母和数字' })
    }
    if (/\s/.test(password) || /\s/.test(username)) {
      return res.json({ message: '用户名或密码不能有空格' })
    }

    await register(account_number, password, username)

    // 注册成功后直接登录
    const token = jwt.sign({ account_number }, SECRET, { expiresIn: '1d' })

    res.json({
      message: '注册成功',
      token,
    })
  } catch (err) {
    res.json({ message: err.message, code: 401 })
  }
}

// 登录
async function userLogin(req, res) {
  try {
    const { account_number, password } = req.body
    let user = await login(account_number, password)
    const token = jwt.sign(
      { id: user.id, account_number: user.account_number },
      SECRET,
      { expiresIn: '1d' },
    )

    res.json({ message: '登录成功', token })
  } catch (err) {
    res.json({ message: err.message, code: 403 })
  }
}

// 获取用户数据
async function userData(req, res) {
  try {
    const user_id = req.user.id
    const user = await getUser(user_id)
    res.json({ message: '获取用户数据成功', user })
  } catch (err) {
    res.json({ message: err.message })
  }
}
export { userRegister, userLogin, userData }
