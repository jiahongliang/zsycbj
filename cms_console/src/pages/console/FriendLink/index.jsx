import { useEffect } from "react";

const FriendLink = () => {
    useEffect(() => {
        console.log('Friend Link page mounted.');
    },[]);

    return (
        <div>
            Friend Link.
        </div>
    );
}

export default FriendLink;