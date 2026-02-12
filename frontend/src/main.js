import { createApp } from 'vue'
import App from './App.vue'

// 引入全局样式
import '@/css/global.css'
import router from './router'

createApp(App)
  .use(router)
  .mount('#app')


function setRootFontSize() {
  const baseWidth = 1920   // 设计稿宽度
  const minWidth = 1200    // 最小缩放宽度

  const width = Math.max(window.innerWidth, minWidth)
  const fontSize = (width / baseWidth) * 16

  document.documentElement.style.fontSize = fontSize + 'px'
}

setRootFontSize()
window.addEventListener('resize', setRootFontSize)
