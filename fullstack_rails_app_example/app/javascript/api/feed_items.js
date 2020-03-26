import axios from 'lib/axios'

export default {
  getFeedItems: (params) => axios.get(`/feeds/${params.feed_id}/feed_items`, { params }),
  hideFeedItem: (params) => axios.put(`/feeds/${params.feed_id}/feed_items/${params.feed_item_id}/hide`)
}