module.exports = {
  test: /\.vue(\.erb)?$/,
  use: [{
    loader: 'vue-loader',
    options: {
      hotReload: true
    }
  }]
}
