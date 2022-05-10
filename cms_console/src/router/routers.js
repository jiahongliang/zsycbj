import { useRoutes } from "react-router-dom";
import Console from "../pages/console/Console";
import Dashboard from "../pages/console/Dashboard";
import SlideImage from '../pages/console/SlideImage';
import Column from "../pages/console/Cms/Column";
import Article from "../pages/console/Cms/Article";
import FriendLink from "../pages/console/FriendLink";
import MemRegistration from "../pages/console/MemRegistration";
import Login from "../pages/Login";

const GetRoutes = () => {
    const routes = useRoutes([
        {
            path: '/',
            element: <Login />
        },
        {
            path: '/console',
            element: <Console />,
            children: [
                {
                    index:true,
                    element: <Dashboard />
                },
                {
                    path: '/console/slide_image',
                    element: <SlideImage />
                },
                {
                    path: '/console/cms/column',
                    element: <Column />
                },
                {
                    path: '/console/cms/article',
                    element: <Article />
                },
                {
                    path: '/console/friend_link',
                    element: <FriendLink />
                },
                {
                    path: '/console/mem_registration',
                    element: <MemRegistration />
                }
            ]
        }
    ]);
    return routes;
}

export default GetRoutes;