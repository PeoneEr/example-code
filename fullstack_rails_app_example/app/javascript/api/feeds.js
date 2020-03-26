import axios from 'lib/axios'

export default {
  getFeeds: (params) => axios.get('/feeds', { params }),
  getFeed: (params) => axios.get(`/feeds/${params.id}`),
  createFeed: (params) => axios.post('/feeds', params),
  deleteFeed: (params) => axios.delete(`/feeds/${params.feed_id}`),
  refreshFeed: (params) => axios.put(`/feeds/${params.feed_id}/refresh`)
}