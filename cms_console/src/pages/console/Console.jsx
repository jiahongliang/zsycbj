import React from "react";
import { Outlet } from "react-router-dom";

class Welcome extends React.Component {
    render() {
        return (
            <div>
                This is the welcome page.
                <Outlet />
            </div>
        );
    }
}

export default Welcome;
