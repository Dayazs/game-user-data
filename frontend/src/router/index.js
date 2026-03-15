import { createRouter, createWebHistory } from "vue-router"
import TheEndland from "@/view/endland/TheEndland.vue"
import TEcharacterDetail from "@/view/endland/TEcharacterDetail.vue"
import Home from "@/view/Home.vue"
import Wuwa from "@/view/wuwa/Wuwa.vue"
import WuwaDetail from "@/view/wuwa/WuwaDetail.vue"

const routes = [
  {
    path: '/',
    name: 'home',
    component: Home
  },

  // 鸣潮页面
  {
    path: '/wuwa',
    name: 'Wuwa',
    component: Wuwa
  },
  // 鸣潮角色详细页面
  {
    path: '/wuwa/wuwa_detail',
    name: 'WuwaDetail',
    component: WuwaDetail
  },


  // 终末地页面
  {
    path: '/the_endland',
    name: 'TheEndland',
    component: TheEndland
  },
  // 终末地角色详细页面
  {
    path: '/the_endland/te_character_detail',
    name: 'TEcharacterDetail',
    component: TEcharacterDetail,
    // props: true
  }
]

const router = createRouter({
  history: createWebHistory(),
  routes
})
export default router