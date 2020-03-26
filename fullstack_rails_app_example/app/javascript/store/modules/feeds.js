import feeds from '../../api/feeds'
import feedItems from '../../api/feed_items'

const state = {
  feeds: [],
  feedsPage: 1
}

const getters = {
  getFeeds: state => state.feeds,
  getFeedsPage: state => state.feedsPage
}

const actions = {
  async getFeeds ({ commit }, payload) {
    let response = await feeds.getFeeds(payload)

    commit('pushFeeds', response.data.feeds)
    commit('incrementFeedsPage')

    return response.data.feeds
  },
  async getFeed ({ commit }, payload) {
    let response = await feeds.getFeed(payload)

    commit('setFeed', response.data)
  },
  async createFeed ({ commit }, payload) {
    let response = await feeds.createFeed(payload)

    commit('unshiftFeed', response.data)
  },
  async getFeedItems ({ commit }, payload) {
    let response = await feedItems.getFeedItems(payload)

    commit('setFeedItems', { feedId: payload.feed_id, items: response.data.feed_items })

    return response.data
  },
  async refreshFeed ({ commit }, payload) {
    await feeds.refreshFeed(payload)

    commit('setFeedParsed', { feedId: payload.feed_id, parsed: false })
  },
  async hideFeedItem ({ commit }, payload) {
    await feedItems.hideFeedItem(payload)

    commit('hidenFeedItem', { feedId: payload.feed_id, feedItemId: payload.feed_item_id })
  }
}

const mutations = {
  hidenFeedItem (state, { feedId, feedItemId }) {
    let feed = state.feeds.find(e => e.id === feedId)
    let item = feed.items.find(e => e.id === feedItemId)

    item.visible = false
  },
  setFeedParsed (state, { feedId, parsed }) {
    let item = state.feeds.find(e => e.id === feedId)

    item.parsed = parsed
  },
  setFeedItems (state, { feedId, items }) {
    let item = state.feeds.find(e => e.id === feedId)

    item.items = items
  },
  setFeed (state, feed) {
    console.log(feed)
    let item = state.feeds.find(e => e.id === feed.id)

    Object.assign(item, feed)
  },
  unshiftFeed (state, feed) {
    console.log(feed)

    state.feeds.unshift(feed)
  },
  incrementFeedsPage (state) {
    state.feedsPage += 1
  },
  pushFeeds (state, feeds) {
    feeds.forEach((feed) => {
      let index = state.feeds.map(f => f.id).indexOf(feed.id)

      if (index === -1) {
        state.feeds.push(feed)
      }
    })
  }
}

export default {
  state,
  getters,
  actions,
  mutations
}
