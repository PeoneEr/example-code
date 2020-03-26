import Vue from 'lib/vue'
import Vuex from 'vuex'
import common from './modules/common'
import feeds from './modules/feeds'
import createLogger from 'vuex/dist/logger'

Vue.use(Vuex)

const debug = process.env.NODE_ENV !== 'production'

export default new Vuex.Store({
  modules: {
    common,
    feeds
  },
  strict: process.env.NODE_ENV == 'development',
  plugins: debug ? [createLogger()] : []
})
