<template lang="pug">
  .feeds-index.mt-5
    .row(v-if="$route.name === 'feeds_index'")
      feed(v-for="feed of feeds" 
          :key="feed.id"
          :feed="feed"
          v-if="feeds.length")

      .col-sm-12(v-if="!feeds.length")
        .shadow-lg.p-3.mb-5.bg-white.rounded 
          p.text-center Вы пока не добавили ни одного поискового запроса

    infinite-loading(@infinite="infiniteHandler" :identifier="infiniteLoaderIdentifier")
      div(slot="no-more")
      div(slot="no-results")

    router-view
</template>

<script>
  import { mapGetters, mapActions } from 'vuex'
  import feed from './feed'

  export default {
    components: { feed },
    channels: {
      FeedChannel: {
        received(data) {
          if (this.currentUser.id === parseInt(data.user_id)) {
            this.getFeed({ id: data.feed_id })
          }
        }
      }
    },
    mounted () {
      this.$cable.subscribe({ channel: 'FeedChannel' })
    },
    computed: { 
      ...mapGetters({ 
        feeds: 'getFeeds',
        page: 'getFeedsPage',
        currentUser: 'getCurrentUser'
      }),
      infiniteLoaderIdentifier () {
        return 'infiniteLoader'
      }
    },
    methods: { 
      ...mapActions({
        getFeeds: 'getFeeds',
        getFeed: 'getFeed'
      }),
      infiniteHandler ($state) {
        this.getFeeds({ page: this.page }).then((response) => {
          if (response.length) {
            $state.loaded()
          } else {
            $state.complete()
          }
        })
      }
    }
  }
</script>