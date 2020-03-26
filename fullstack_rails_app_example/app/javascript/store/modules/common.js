import user from '../../api/user'

const state = {
  currentUser: undefined,
  loading: false
}

const getters = {
  getCurrentUser: state => state.currentUser,
  isLoading: state => state.loading
}

const actions = {
  async getCurrentUser ({ commit }) {
    commit('setLoading', true)

    let response = await user.getCurrentUser()
    commit('setCurrentUser', response.data.user)

    commit('setLoading', false)
  }
}

const mutations = {
  setCurrentUser (state, user) {
    state.currentUser = user
  },
  setLoading (state, loading) {
    state.loading = loading
  }
}

export default {
  state,
  getters,
  actions,
  mutations
}
