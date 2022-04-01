const path = require('path');
const resolve = dir => path.join(__dirname, dir);

module.exports = {
    publicPath: './',
    devServer: {
        proxy: {
            '/api': {
                target: `http://localhost:8081`,
                changeOrigin: true,
            },
        }
    },
    chainWebpack: (config) => {
        config.plugin('html').tap((args) => {
            args[0].title = '正盛医创（北京）科技发展中心'
            return args
        });
        config.resolve.alias.set('@', resolve('src'));
    }
}