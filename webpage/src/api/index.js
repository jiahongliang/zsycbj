import { serviceJson } from './axios.js'

export const fetchColumnList = () => {
    return serviceJson({
        url: '/api/column/list',
        method: 'get'
    })
}

export const fetchSlideImages = () => {
    return serviceJson({
        url: '/api/article/slide_images',
        method: 'get'
    })
}

export const fetchFriendLink = () => {
    return serviceJson({
        url: '/api/article/friend_link',
        method: 'get'
    })
}

export const fetchArticleList = (data) => {
    return serviceJson({
        url: '/api/article/all_list',
        method: 'POST',
        data
    })
}

export const loadArticle = id => {
    return serviceJson({
        url: '/api/article/info/' + id,
        method: 'GET'
    })
}

export const memberRegister = (data) => {
    return serviceJson({
        url: '/api/member/register',
        method: 'POST',
        data
    })
}