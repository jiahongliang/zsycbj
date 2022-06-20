import { useEffect } from "react";

const Column = () => {

    useEffect(() => {
        console.log('Column page mounted.')
    },[]);

    return (
        <div>
            Column Page.
        </div>
    );
}

export default Column;