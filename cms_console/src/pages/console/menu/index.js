import {
    FileImageOutlined, 
    ContainerOutlined, 
    MenuOutlined, 
    FileOutlined, 
    LinkOutlined, 
    SolutionOutlined, 
} from '@ant-design/icons';

export const menus = [
    /*{
        key: '/console',
        label: '首 页',
        icon: <HomeOutlined />,
        url: '/console',
        showinbreadcrumb: 'true'
    },*/
    {
        key: '/console/slide_image',
        label: '轮播图',
        icon: <FileImageOutlined />,
        url: '/console/slide_image',
        showinbreadcrumb: 'true'
    },
    {
        key: '/console/cms',
        label: '信息发布',
        icon: <ContainerOutlined />,
        showinbreadcrumb: 'true',
        children: [
            {
                key: '/console/cms/column',
                label: '栏目管理',
                icon: <MenuOutlined />,
                url: '/console/cms/column',
                showinbreadcrumb: 'true'
            },
            {
                key: '/console/cms/article',
                label: '文章管理',
                icon: <FileOutlined />,
                url: '/console/cms/article',
                showinbreadcrumb: 'true'
            }
        ]
    },
    {
        key: '/console/friend_link',
        label: '友情链接',
        icon: <LinkOutlined />,
        url: '/console/friend_link',
        showinbreadcrumb: 'true'
    },
    {
        key: '/console/mem_registration',
        label: '注册信息',
        icon: <SolutionOutlined />,
        url: '/console/mem_registration',
        showinbreadcrumb: 'true'
    },
];