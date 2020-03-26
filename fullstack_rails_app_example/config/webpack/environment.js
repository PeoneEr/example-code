const { environment } = require('@rails/webpacker')
const { VueLoaderPlugin } = require('vue-loader')
const vue = require('./loaders/vue')

// *** 1
const pug = require('./loaders/pug')
const sass = require('./loaders/sass')
// --


environment.plugins.prepend('VueLoaderPlugin', new VueLoaderPlugin())
// *** 2
environment.loaders.prepend('sass', sass)
environment.loaders.prepend('pug', pug)
// -
environment.loaders.prepend('vue', vue)
module.exports = environment

