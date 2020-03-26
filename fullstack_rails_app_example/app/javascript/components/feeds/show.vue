<template lang="pug">
  .feed-show(v-if="!isLoading && feed")
    h1 
      | {{ feed.title }}
      span.ml-2.badge.badge-info(v-if="!feed.parsed") В процессе обработки 
      span.ml-2.badge.badge-success(v-if="feed.parsed") Обработано
      a.ml-3(href='#' @click.prevent="updateFeed" v-if="feed.parsed") Запросить свежие данные

    .feed-items(v-if="feed.items.length && feed.parsed")
      item(v-for="item of feed.items"
           :key="item.id"
           :feed-item="item"
           v-if="item.visible")
</template>

<script>
  import { mapGetters, mapActions } from 'vuex'
  import item from './items/item'

  export default {
    channels: {
      FeedChannel: {
        received(data) {
          if (this.currentUser.id === parseInt(data.user_id) && this.feed.id === parseInt(data.feed_id)) {
            this.getFeed({ id: data.feed_id }).then(() => {
              setTimeout(() => {
                this.getFeedItems({ feed_id: this.feed.id })
              }, 500)
            })
          }
        }
      }
    },
    mounted () {
      this.$cable.subscribe({ channel: 'FeedChannel' })

      setTimeout(() => {
        this.getFeedItems({ feed_id: this.feed.id })
      }, 500)
    },
    components: { item },
    computed: { 
      ...mapGetters({
        feeds: 'getFeeds',
        currentUser: 'getCurrentUser',
        isLoading: 'isLoading'
      }),
      feed () {
        return this.feeds.find(e => e.id === parseInt(this.$route.params.id))
      }
    },
    methods: {
      ...mapActions({
        getFeed: 'getFeed',
        getFeedItems: 'getFeedItems',
        refreshFeed: 'refreshFeed'
      }),
      updateFeed () {
        this.refreshFeed({ feed_id: this.feed.id })
      }
    }
  }
</script>