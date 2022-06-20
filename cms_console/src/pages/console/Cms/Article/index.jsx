import { useEffect } from "react";

const Article = () => {
    useEffect(() => {
        console.log('Article Page mounted.');
    },[]);

    return (
        <div>
            Article Page.
        </div>
    );
}

export default Article;