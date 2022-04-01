import axios from '@/libs/api.request'

export const saveArticle = article => {
  return axios.request({
    url: '/api/data/article',
    data: article,
    method: 'post'
  })
}

export const loadArticlesByColumnProperty = cp => {
  return axios.request({
    url: '/api/data/article/search/column-property?value=' + cp,
    method: 'get'
  })
}

export const loadArticlesByTitleAndColumnProperty = data => {
  let url = ''
  if (data.title && data.title.length > 0) {
    url = '/api/data/article/search/title_column-property_page?title=%25' + data.title + '%25&columnProperty=' + data.columnProperty + '&page=' + data.page + '&size=' + data.size + '&sort=' + data.sort
  } else {
    url = '/api/data/article/search/column-property_page?columnProperty=' + data.columnProperty + '&page=' + data.page + '&size=' + data.size + '&sort=' + data.sort
  }
  return axios.request({
    url: url,
    method: 'get'
  })
}

export const loadArticlesByTitleAndColumnId = data => {
  let url = ''
  if (data.title && data.title.length > 0) {
    url = '/api/data/article/search/column-id_title_page?title=%25' + data.title + '%25&columnId=' + data.columnId + '&page=' + data.page + '&size=' + data.size + '&sort=' + data.sort
  } else {
    url = '/api/data/article/search/column-id_page?columnId=' + data.columnId + '&page=' + data.page + '&size=' + data.size + '&sort=' + data.sort
  }
  return axios.request({
    url: url,
    method: 'get'
  })
}

export const deleteArticle = articleId => {
  return axios.request({
    url: '/api/data/article/' + articleId,
    method: 'delete'
  })
}

export const loadTopColumn = columnProperty => {
  return axios.request({
    url: '/api/data/column/search/top-column?property=' + columnProperty,
    method: 'get'
  })
}

export const loadColumnChildren = id => {
  return axios.request({
    url: '/api/data/column/' + id + '/children',
    method: 'get'
  })
}

export const saveColumn = column => {
  return axios.request({
    url: '/api/data/column',
    data: column,
    method: 'post'
  })
}

export const deleteColumn = id => {
  return axios.request({
    url: '/api/data/column/' + id,
    method: 'delete'
  })
}
