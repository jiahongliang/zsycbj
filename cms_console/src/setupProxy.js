const {createProxyMiddleware} = require('http-proxy-middleware');

module.exports = function(app) {
    app.use(
        createProxyMiddleware('/api',{
            target: 'http://localhost:8081',
            secure: false, // 指定cookie能否被用户读取
            changeOrigin: true,
            // pathRewrite: {'^/api': ''}
        })
    );
}