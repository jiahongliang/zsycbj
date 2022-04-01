import Vue from 'vue';
import VueX from 'vuex';

import cms from './module/cms';

Vue.use(VueX);

export default new VueX.Store({
    state: {},
    mutations: {},
    actions: {},
    modules: {
        cms
    }
});