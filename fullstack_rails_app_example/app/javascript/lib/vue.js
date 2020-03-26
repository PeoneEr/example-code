import Vue from 'vue/dist/vue.js'

if (process.env.NODE_ENV === 'production') {
  Vue.config.devtools = false
  Vue.config.debug = false
  Vue.config.silent = true
  Vue.config.productionTip = false
}

export default Vue