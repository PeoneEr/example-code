<template lang="pug">
  .root-wrapper(v-if="!isLoading")
    nav.navbar.navbar-expand-lg.navbar-light.bg-light
      router-link(:to="{ name: 'feeds_index' }").navbar-brand Агрегатор вакансий
      button.navbar-toggler(type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation")
        span.navbar-toggler-icon

      .collapse.navbar-collapse(id="navbarSupportedContent")
        ul.navbar-nav.mr-auto
          li.nav-item.active
            router-link.nav-link(:to="{ name: 'feeds_index' }") Главная
          li.nav-item(v-if="!currentUser")
            a.nav-link(href="/users/sign_in") Войти
          li.nav-item(v-if="currentUser")
            a.nav-link.text-danger(href="#") Выйти

    nav(v-if="currentUser")
      ol.breadcrumb
        li.breadcrumb-item(:class="{ 'active': $route.name === 'feeds_index' }") 
          router-link(:to="{ name: 'feeds_index' }") Главная
        li.breadcrumb-item.active(v-if="$route.name === 'feeds_show'") Просмотр поискового запроса

    .row(v-if="$route.name !== 'feeds_show'")
      .col
        h1(v-if="!currentUser") Авторизуйтесь для работы
        new-feed(v-if="currentUser")

    router-view(v-if="currentUser")
</template>

<script>
  import { mapActions, mapGetters } from 'vuex'
  import newFeed from 'components/feeds/new'

  export default {
    mounted () {
      this.getCurrentUser()
    },
    components: { newFeed },
    computed: {
      ...mapGetters({
        currentUser: 'getCurrentUser',
        isLoading: 'isLoading'
      })
    },
    methods: {
      ...mapActions({
        getCurrentUser: 'getCurrentUser'
      })
    }
  }
</script>
