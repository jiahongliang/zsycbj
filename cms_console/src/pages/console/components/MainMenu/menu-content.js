import {
    FileImageOutlined, 
    ContainerOutlined, 
    MenuOutlined, 
    FileOutlined, 
    LinkOutlined, 
    SolutionOutlined, 
} from '@ant-design/icons';

export const menuContent = [
    {
        key: '/console/slide_image',
        label: '轮播图',
        icon: <FileImageOutlined />,
        url: '/console/slide_image'
    },
    {
        key: '/console/cms',
        label: '信息发布',
        icon: <ContainerOutlined />,
        children: [
            {
                key: '/console/cms/column',
                label: '栏目管理',
                icon: <MenuOutlined />,
                url: '/console/cms/column'
            },
            {
                key: '/console/cms/article',
                label: '文章管理',
                icon: <FileOutlined />,
                url: '/console/cms/article'
            }
        ]
    },
    {
        key: '/console/friend_link',
        label: '友情链接',
        icon: <LinkOutlined />,
        url: '/console/friend_link'
    },
    {
        key: '/console/mem_registration',
        label: '注册信息',
        icon: <SolutionOutlined />,
        url: '/console/mem_registration'
    },
];