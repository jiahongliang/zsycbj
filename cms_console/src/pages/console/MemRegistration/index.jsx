import { useEffect } from "react";

const MemRegistration = () => {
    useEffect(() => {
        console.log('Member Registration page mounted.');
    },[]);

    return (
        <div>
            Member Registration page.
        </div>
    );
}

export default MemRegistration;