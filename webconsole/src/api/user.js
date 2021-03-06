import axios from '@/libs/api.request'

export const login = (loginToken) => {
  const data = {
    loginToken
  }
  return axios.request({
    url: '/api/login',
    data,
    method: 'post',
    transformRequest: [
      function (data) {
        let ret = ''
        for (let it in data) {
          ret += encodeURIComponent(it) + '=' + encodeURIComponent(data[it]) + '&'
        }
        ret = ret.substring(0, ret.lastIndexOf('&'))
        return ret
      }
    ],
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded'
    }
  })
}

export const getUserInfo = (token) => {
  return axios.request({
    url: '/api/user/get/' + token,
    params: {
      token
    },
    method: 'get'
  })
}

export const logout = (token) => {
  return axios.request({
    url: '/api/logout',
    method: 'post'
  })
}

export const updateUserPassword = (username, data) => {
  return axios.request({
    url: '/api/user/updpwd/' + username,
    data: data,
    method: 'post'
  })
}

export const getUnreadCount = () => {
  /**
  return axios.request({
    url: 'message/count',
    method: 'get'
  })
   */
}

export const getMessage = () => {
  /*
  return axios.request({
    url: 'message/init',
    method: 'get'
  })
  */
}

export const getContentByMsgId = msg_id => {
  /*
  return axios.request({
    url: 'message/content',
    method: 'get',
    params: {
      msg_id
    }
  })
  */
}

export const hasRead = msg_id => {
  /*
  return axios.request({
    url: 'message/has_read',
    method: 'post',
    data: {
      msg_id
    }
  })
  */
}

export const removeReaded = msg_id => {
  /*
  return axios.request({
    url: 'message/remove_readed',
    method: 'post',
    data: {
      msg_id
    }
  })
  */
}

export const restoreTrash = msg_id => {
  /*
  return axios.request({
    url: 'message/restore',
    method: 'post',
    data: {
      msg_id
    }
  })
  */
}
