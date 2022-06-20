import { useEffect } from "react";

const SlideImage = () => {
    useEffect(() => {
        console.log('Slide Image Page mounted.');
    }, []);

    return (
        <div>
            Slide Image Page.
        </div>
    );
}

export default SlideImage;