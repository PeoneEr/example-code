import axios from 'lib/axios'

export default {
  getCurrentUser: () => axios.get('/users/me')
}