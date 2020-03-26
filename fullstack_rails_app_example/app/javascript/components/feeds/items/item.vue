<template lang="pug">
  .feed-item.mt-5
    .card 
      .card-body
        h2.card-title 
          span {{ feedItem.title }}
          span.ml-3.badge.badge-secondary {{ feedItem.label }}
          a.ml-3(:href="feedItem.link" target="_blank") Оригинал вакансии
          button.btn.btn-danger.ml-3(@click="hide") Скрыть

        p.card-text.company {{ feedItem.company }}
        p.card-text.location {{ feedItem.location }}

        blockquote {{ feedItem.description }}
        p.card-text.salary {{ feedItem.salary }}
</template>

<script>
  import { mapActions } from 'vuex'

  export default {
    props: {
      feedItem: { 
        required: true,
        type: Object
      }
    },
    methods: {
      ...mapActions({
        hideFeedItem: 'hideFeedItem'
      }),
      hide () {
        this.hideFeedItem({ feed_id: this.feedItem.feed_id, feed_item_id: this.feedItem.id })
      }
    }
  }
</script>