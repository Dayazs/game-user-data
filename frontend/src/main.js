import { createApp } from 'vue'
import App from './App.vue'

// 引入全局样式
import '@/css/global.css'
import router from './router'
import { createPinia } from 'pinia'

// 创建pinia实例
const pinia = createPinia()

createApp(App)
  .use(router)
  .use(pinia)
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
