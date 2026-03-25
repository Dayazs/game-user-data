import jwt from 'jsonwebtoken'
import secretData from '../../config/jwt.json' assert { type: 'json' }

const SECRET = secretData.SECRET

function auth(req, res, next) {
  const token = req.headers.authorization?.split(' ')[1]
  if (!token) {
    return res.json({ message: '未登录' })
  }

  try {
    const decoded = jwt.verify(token, SECRET)
    req.user = decoded
    next()
  } catch (err) {
    res.json({ message: 'token无效' })
  }
}

export { auth }
