require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()

import "core-js/stable"
import "regenerator-runtime/runtime"

import 'jquery/src/jquery'
//import 'jquery-ujs/src/rails'
import 'bootstrap/dist/css/bootstrap.css'
//import 'bootstrap/dist/css/bootstrap-theme'
import 'bootstrap/dist/js/bootstrap'
import '../stylesheets/application'

import Vue from 'lib/vue'
import VueRouter from 'vue-router'
import Notifications from 'vue-notification'
import Vuelidate from 'vuelidate'
import underscore from 'vue-underscore'
import store from '../store'
import InfiniteLoading from 'vue-infinite-loading'
import ActionCableVue from 'actioncable-vue'

import RootPage from 'components/root/index'
import feedsIndex from 'components/feeds/index'
import feedsShow from 'components/feeds/show'

Vue.use(VueRouter)
Vue.use(Vuelidate)
Vue.use(Notifications)
Vue.use(underscore)
Vue.use(ActionCableVue, {
  debug: true,
  debugLevel: 'all',
  connectionUrl: '/websocket'
})

Vue.component('infinite-loading', InfiniteLoading)

const routes = [
  { path: '', component: RootPage, children: [
    { path: '/', component: feedsIndex, name: 'feeds_index', children: [
      { path: '/feeds/:id', component: feedsShow, name: 'feeds_show' }
    ]},
  ]}
]

const router = new VueRouter({
    mode: 'history',
    routes: routes
})

window.addEventListener('load', () => {
  new Vue({ router, store }).$mount('#app')
})