module.exports = {
  test: /\.sass$/,
  use: [
    'vue-style-loader',
    'css-loader',
    {
      loader: 'sass-loader',
      options: {
        // indentedSyntax: true,

        /**
         * передача глобальных переменных
         *
         * sass-loader также поддерживает опцию data, которая позволяет
         * вам передавать общие переменные во все обрабатываемые файлы
         * без необходимости везде их явно импортировать
         *
         * можно указать файл, например `variables.scss`
         */
        // data: `$color: red;`
      }
    }
  ]
}
