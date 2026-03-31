import { defineStore } from 'pinia'

export const useUserStore = defineStore('user', {
  state: () => ({
    account_number: '',
    user_id: null,
    is_admin: '',
    username: '',
    user_avatar: '',
    needRefreshComment: false,
    isLogin: false
  }),

  actions: {
    setUser(user) {
      this.account_number = user.account_number
      this.user_id = user.id
      this.is_admin = user.is_admin
      this.username = user.username
      this.user_avatar = user.user_avatar
    },
    triggerRefresh() {
      this.needRefreshComment = !this.needRefreshComment
    },
  },
})
