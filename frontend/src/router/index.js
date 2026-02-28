import { createRouter, createWebHistory } from "vue-router"
import TheEndland from "@/view/TheEndland.vue"
import TEcharacterDetail from "@/view/TEcharacterDetail.vue"

const routes = [
  {
    path: '/the_endland',
    name: 'the_endland_home',
    component: TheEndland
  },
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