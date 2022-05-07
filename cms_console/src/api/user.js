import { service } from "./axios";

export const login = (loginToken) => {
    const data = { loginToken };
    return service({
        url: '/login',
        data,
        method: 'post',
    });
}

export const fetchValidateCodeImage = () => {
    return service({
        url: '/verify_code/generate',
        method: 'get',
        responseType: "blob"
    })
}