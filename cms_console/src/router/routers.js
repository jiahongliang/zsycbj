import { useRoutes } from "react-router-dom";
import { lazy } from "react";
import { wrapper } from '../pages';

export const Console = lazy(() => import('../pages/console/Console'));
export const Dashboard = lazy(() => import('../pages/console/Dashboard'));
export const SlideImage = lazy(() => import('../pages/console/SlideImage'));
export const Column = lazy(() => import('../pages/console/Cms/Column'));
export const Article = lazy(() => import('../pages/console/Cms/Article'));
export const FriendLink = lazy(() => import('../pages/console/FriendLink'));
export const MemRegistration = lazy(() => import('../pages/console/MemRegistration'));
export const Login = lazy(() => import('../pages/Login.jsx'));


const GetRoutes = () => {
    const routes = useRoutes([
        {
            path: '/',
            element: wrapper(Login)
        },
        {
            path: '/console',
            element: wrapper(Console),
            children: [
                {
                    index: true,
                    element: wrapper(Dashboard)
                },
                {
                    path: '/console/slide_image',
                    element: wrapper(SlideImage)
                },
                {
                    path: '/console/cms/column',
                    element: wrapper(Column)
                },
                {
                    path: '/console/cms/article',
                    element: wrapper(Article)
                },
                {
                    path: '/console/friend_link',
                    element: wrapper(FriendLink)
                },
                {
                    path: '/console/mem_registration',
                    element: wrapper(MemRegistration)
                }
            ]
        }
    ]);
    return routes;
}

export default GetRoutes;