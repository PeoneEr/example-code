import axios from 'axios'

let token = document.getElementsByName('csrf-token')[0]
if (token !== undefined) {
    axios.defaults.headers.common['X-CSRF-Token'] = token.getAttribute('content')
}

let webapi_token = document.getElementsByName('webapi-token')[0]
if (webapi_token !== undefined) {
    axios.defaults.headers.common['Authorization'] = webapi_token.getAttribute('content')
}

axios.defaults.baseURL = '/api/v1/'

export default axios