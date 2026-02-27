import { createRouter, createWebHistory } from "vue-router"
import Home from "@/view/Home.vue"
import CharacterDetail from "@/view/CharacterDetail.vue"

const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home
  },
  {
    path: '/character/characterDetail',
    name: 'CharacterDetail',
    component: CharacterDetail,
    props: true
  }
]

const router = createRouter({
  history: createWebHistory(),
  routes
})
export default router