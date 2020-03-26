<template lang="pug">
  .new-feed.mt-3
    form(@submit.prevent="create")
      .form-group
        label(for="title") Название поиска
        input.form-control(type="text" v-model="feed.title"
                           :class="{ 'is-invalid': $v.feed.title.$invalid && $v.feed.title.$error }")

        .invalid-feedback Обязательное поле

      .form-group
        label(for="search_query") Поисковый запрос
        input.form-control(type="text" v-model="feed.search_query"
                           :class="{ 'is-invalid': $v.feed.search_query.$invalid && $v.feed.search_query.$error }")

        .invalid-feedback Обязательное поле

      .form-group
        label(for="search_query") Регион поиска
        input.form-control(type="text" v-model="feed.search_region"
                           :class="{ 'is-invalid': $v.feed.search_region.$invalid && $v.feed.search_region.$error }")

        .invalid-feedback Обязательное поле

      button.btn.btn-primary(type="submit") Сохранить
</template>

<script>
  import { required } from 'vuelidate/lib/validators'
  import { mapActions } from 'vuex'

  function defaultObject() {
    return { 
      feed: {
        title: '',
        search_query: '',
        search_region: ''
      }
    }
  }

  export default {
    data () {
      return defaultObject()
    },
    methods: {
      ...mapActions({
        createFeed: 'createFeed'
      }),
      create () {
        this.$v.$touch()

        if (this.$v.$invalid) { return false }
        this.createFeed(this.feed).then(() => {
          this.feed = Object.assign(this.feed, defaultObject().feed)
          this.$v.$reset()
        })
      }
    },
    validations () {
      return { 
        feed: { 
          title: { required },
          search_query: { required },
          search_region: { required }
        }
      }
    }
  }
</script>