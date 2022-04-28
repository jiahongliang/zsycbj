import axios from 'axios'
import { Message } from 'element-ui'
import router from '../router'

axios.defaults.timeout = 6000
let baseURL = ''
const uploadURL = '/oss'

//1、默认JSON格式
export let serviceJson = axios.create({
    baseURL,
    timeout: 800000,
})

//2、formdata格式
export let service = axios.create({
    baseURL,
    contentType: 'application/x-www-form-urlencoded;charset=UTF-8',
    transformRequest: [
        function(data) {
        let ret = ''
        for (let it in data) {
            ret += encodeURIComponent(it) + '=' + encodeURIComponent(data[it]) + '&'
        }
        return ret
        },
    ],
})

//文件上传 formdata格式
export let upload = axios.create({
    baseURL: uploadURL,
    headers: {
        'content-Type': 'multipart/form-data', //请求头
    },
})

//拦截器
function interceptors(service) {
    // 请求拦截器
    service.interceptors.request.use(
      // 在请求发送之前做一些处理
      (config) => {
        config.headers.token = 'token'
        return config
      },
      (error) => {
        // 发送失败
        Promise.reject(error)
      }
    )
  
    // 响应拦截器
    service.interceptors.response.use(
        (response) => {
        // endLoading()
        // dataAxios 是 axios 返回数据中的 data
        const dataAxios = response
        // 这个状态码是和后端约定的
        const { code } = dataAxios.data
        // 根据 code 进行判断
        if (code === undefined) {
            // 如果没有 code 代表这不是项目后端开发的接口 比如可能是 D2Admin 请求最新版本
            return dataAxios
        } else {
            // 有 code 代表这是一个后端接口 可以进行进一步的判断
            switch (code) {
            case 'success':
                // [ 示例 ] code === 0 代表没有错误
                return dataAxios.data
            case 0:
                // [ 示例 ] code === 0 代表没有错误
                return dataAxios.data
            case 10000:
                // [ 示例 ] code ===200 代表没有错误
                return dataAxios.data
            case 20000:
                errorCreat2(`${dataAxios.data.msg}`)
                break;
            case 10008:
                errorCreat3(`${dataAxios.data.msg}`)
                break;
            case 'warnning':
                return dataAxios.data
            case 'fail':
                // [ 示例 ] 其它和后台约定的 code
                errorCreat(dataAxios.data.message)
                break
            case '10001':
                // [ 示例 ] 其它和后台约定的 code
                router.replace({
                path: '/login',
                })
                sessionStorage.clear()
                errorCreat2('登录状态失效，请重新登录')
                return dataAxios.data
            default:
                // 不是正确的 code
                errorCreat(`${dataAxios.data.msg}`)
                break
            }
        }
        },
        (error) => {
        if (error && error.response) {
            switch (error.response.status) {
            case 400:
                error.message = '请求错误'
                break
            case 401:
                error.message = '未授权，请登录'
                break
            case 403:
                error.message = '拒绝访问'
                break
            case 404:
                error.message = `请求地址出错: ${error.response.config.url}`
                break
            case 408:
                error.message = '请求超时'
                break
            case 500:
                error.message = '服务器内部错误'
                break
            case 501:
                error.message = '服务未实现'
                break
            case 502:
                error.message = '网关错误'
                break
            case 503:
                error.message = '服务不可用'
                break
            case 504:
                error.message = '网关超时'
                break
            case 505:
                error.message = 'HTTP版本不受支持'
                break
            default:
                break
            }
        }
        errorLog(error)
        return Promise.reject(error)
        }
    )
}

  // 创建一个错误
function errorCreat(msg) {
    const err = new Error(msg)
    errorLog(err)
    setTimeout(() => {
        router.replace({
        path: '/',
        })
        sessionStorage.clear()
    }, 500)
    throw err
}

// 创建一个错误,且返回结果
function errorCreat2(msg) {
const err = new Error(msg)
errorLog(err)
}

function errorCreat3(msg) {
    const err = new Error(msg)
    errorLog(err)
}

// 记录和显示错误
function errorLog(err) {
    // 显示提示
    Message({
        message: err.message,
        type: 'error',
        duration: 5 * 1000,
    })
}

interceptors(service)
interceptors(serviceJson)
interceptors(upload)