import { useRoutes } from "react-router-dom";
import Console from "../pages/console/Console";
import Dashboard from "../pages/console/dashboard/Dashboard";
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
                }
            ]
        }
    ]);
    return routes;
}

export default GetRoutes;