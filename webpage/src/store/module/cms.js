import {globalConstants} from '@/lib/global'
import {fetchColumnList,fetchFriendLink} from '@/api/index.js'

export default {
    state: {
        columnData: [],
        linkData: [],
        columnDataLoading: false, 
        linkDataLoading: false
    },
    mutations: {
        setColumnData(state, data) {
            state.columnData = data;
        },
        setLinkData(state, data) {
            state.linkData = data;
        },
        setColumnDataLoading(state, data) {
            state.columnDataLoading = data;
        },
        setLinkDataLoading(state, data) {
            state.linkDataLoading = data;
        }
    },
    actions: {
        fetchColumnData({state, commit}) {
            let columnData = window.sessionStorage.getItem(globalConstants.COLUMN_DATA_SESSION_STORAGE_KEY)
            if (!columnData || columnData.length === 0) {
                if(!state.columnDataLoading) {
                    commit('setColumnDataLoading', true);
                    fetchColumnList().then( (res) => {
                        if(res.data && res.data.length > 0) {
                            columnData = res.data;
                            window.sessionStorage.setItem(globalConstants.COLUMN_DATA_SESSION_STORAGE_KEY,JSON.stringify(columnData));
                            commit('setColumnData',columnData)
                        }
                        commit('setColumnDataLoading', false);
                    },
                    (err) => {
                        commit('setColumnDataLoading', false);
                        throw err;
                    });
                }
            } else {
                columnData = JSON.parse(columnData);
                commit('setColumnData',columnData)
            }
        },
        fetchLinkData({state, commit}) {
            let linkData = window.sessionStorage.getItem(globalConstants.LINK_DATA_SESSION_STORAGE_KEY)
            if (!linkData || linkData.length === 0) {
                if(!state.linkDataLoading) {
                    commit('setLinkDataLoading', true);
                    fetchFriendLink().then( (res) => {
                        if(res.data && res.data.length > 0) {
                            linkData = res.data;
                            window.sessionStorage.setItem(globalConstants.LINK_DATA_SESSION_STORAGE_KEY,JSON.stringify(linkData));
                            commit('setLinkData', linkData);
                        }
                        commit('setLinkDataLoading', false);
                    }, (err) => {
                        commit('setLinkDataLoading', false);
                        throw err;
                    });
                }
            } else {
                linkData = JSON.parse(linkData);
                commit('setLinkData', linkData);
            }
        }
    }
}