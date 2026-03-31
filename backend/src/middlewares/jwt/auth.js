import jwt from 'jsonwebtoken'
import secretData from '../../config/jwt.json' assert { type: 'json' }

const SECRET = secretData.SECRET

function auth(req, res, next) {
  const token = req.headers.authorization?.split(' ')[1]
  if (!token) {
    console.log('token验证失败')
    return res.json({ message: '未登录', code: 401 })
  }

  try {
    const decoded = jwt.verify(token, SECRET)
    req.user = decoded
    // console.log('token验证成功')
    next()
  } catch (err) {
    res.json({ message: 'token无效', code: 401 })
  }
}

export { auth }
