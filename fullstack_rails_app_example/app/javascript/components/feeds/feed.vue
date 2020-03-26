<template lang="pug">
  .col-sm-6.mb-5
    .card
      .card-body
        h5.card-title
          router-link(:to="{ name: 'feeds_show', params: { id: feed.id }}") {{ feed.title }}
          span.ml-2.badge.badge-info(v-if="!feed.parsed") В процессе обработки 
          span.ml-2.badge.badge-success(v-if="feed.parsed") Обработано

        p.card-text Поисковый запрос: {{ feed.search_query }}, регион поиска: {{ feed.search_region }}
</template>

<script>
  export default {
    props: { 
      feed: { 
        required: true,
        type: Object
      }
    }
  }
</script>