import { service, serviceJson } from "./axios";

export const login = (loginToken) => {
    const data = {loginToken};
    return service({
        url: '/login',
        data,
        method: 'post',
    });
}