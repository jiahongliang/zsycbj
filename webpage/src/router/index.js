import Vue from 'vue';
import VueRouter from 'vue-router';

Vue.use(VueRouter);

const routes = [
    {
        path: '/',
        name: 'Home',
        component: () => import('@/views/Home.vue'),
        redirect: '/index',
        children: [
            {
                path: '/index',
                name: 'index',
                component: () => import('@/views/home/index.vue')
            },
            {
                path: '/column',
                name: 'column',
                component: () => import('@/views/cms/index.vue'),
                redirect: '/article_list',
                children: [
                    {
                        path: '/article_list',
                        name: 'article_list',
                        component: () => import('@/views/cms/column/index.vue')
                    },
                    {
                        path: '/article_info',
                        name: 'article_info',
                        component: () => import('@/views/cms/article/index.vue')
                    }
            ]
            }
        ]
    },
    
];

const router = new VueRouter({
    base: process.env.BASE_URL,
    routes
});

const VueRouterPush = VueRouter.prototype.push;
VueRouterPush.prototype.push = function push(to) {
    return VueRouterPush.call(this,to).catch((err) => err);
}

export default router;