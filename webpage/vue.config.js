const path = require('path');
const resolve = dir => path.join(__dirname, dir);
const webpack = require('webpack')
const CompressionPlugin = require('compression-webpack-plugin')
const zlib = require('zlib')
const isProduction = process.env.NODE_ENV === 'production'

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
    },
    configureWebpack: {
        resolve: {
            alias: {
                '@': path.resolve(__dirname, './src'),
                '@i': path.resolve(__dirname, './src/assets'),
            }
        },
        plugins: [
            new webpack.IgnorePlugin(/^\.\/locale$/, /moment$/),
            // 下面两项配置才是 compression-webpack-plugin 压缩配置
            // 压缩成 .gz 文件
            new CompressionPlugin({
                filename: '[path][base].gz',
                algorithm: 'gzip',
                test: /\.js$|\.css$|\.html$/,
                threshold: 10240,
                minRatio: 0.8
            }),
            // 压缩成 .br 文件，如果 zlib 报错无法解决，可以注释这段使用代码，一般本地没问题，需要注意线上服务器会可能发生找不到 zlib 的情况。
            new CompressionPlugin({
                filename: '[path][base].br',
                algorithm: 'brotliCompress',
                test: /\.(js|css|html|svg)$/,
                compressionOptions: {
                    params: {
                        [zlib.constants.BROTLI_PARAM_QUALITY]: 11
                    }
                },
                threshold: 10240,
                minRatio: 0.8
            })
        ]
    },
    productionSourceMap: false
}