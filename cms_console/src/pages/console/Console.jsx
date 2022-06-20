import React, { useEffect, useState } from "react";
import { Outlet } from "react-router-dom";
import { useNavigate, useLocation } from 'react-router';
import { Layout, Menu, Row, Col, Dropdown, Breadcrumb, Divider, Tag } from "antd";
import { menus } from "./menu";
import { CONSOLE_NAVIGATE_TABS } from '../../util/Constants'
import {
    MenuUnfoldOutlined,
    MenuFoldOutlined,
    UserOutlined,
    MessageOutlined,
    MenuOutlined,
    CaretDownOutlined,
    HomeOutlined,
    CaretRightOutlined
} from '@ant-design/icons';
import './Console.css'

const { Header, Sider, Content } = Layout;

const userMenu = (
    <Menu items={
        [
            {
                label: '个人中心',
                key: '0'
            },
            {
                type: 'divider',
            },
            {
                label: '修改密码',
                key: '1'
            },
            {
                label: '退出登录',
                key: '2'
            }
        ]
    } />
);

const Console = () => {
    const [collapsed, setCollapsed] = useState(false);
    const [pathNode, setPathNode] = useState([]);
    const [selectedMenuKey, setSelectedMenuKey] = useState(null);
    const [navigateTabs, setNavigateTabs] = useState([{
        key: '/console',
        label: '首 页',
        url: '/console',
        actived: true,
        keyPath: [],
    }]);
    const [loadTab, setLoadTab] = useState(true);
    let navigate = useNavigate();
    let location = useLocation();

    /**
     * navigateTabs变化时调用
     */
    useEffect(() => {
        if (navigateTabs.length > 1) {
            if (!loadTab) {
                let tabs = JSON.stringify(navigateTabs);
                sessionStorage.setItem(CONSOLE_NAVIGATE_TABS, tabs);
            } else {
                navigateTabs.forEach(item => {
                    if (item.url === location.pathname) {
                        item.actived = true;

                        let pathArr = [];
                        item.keyPath.slice().reverse().forEach(item => {
                            pathArr.push(getMenuItem(item));
                        });
                        setPathNode(pathArr);
                    } else {
                        item.actived = false;
                    }
                });
                setLoadTab(false);
            }
        }
    }, [navigateTabs]);

    /**
     * 组件加载时调用
     */
    useEffect(() => {
        let tabs = sessionStorage.getItem(CONSOLE_NAVIGATE_TABS);
        if (tabs && tabs.length > 0) {
            setLoadTab(true);
            setNavigateTabs(JSON.parse(tabs));
        } else {
            setLoadTab(false);
        }
    }, []);

    const toggle = () => {
        setCollapsed(!collapsed);
    }

    const menuClick = (e) => {
        let keyNode = getMenuItem(e.key);
        let pathArr = [];
        e.keyPath.slice().reverse().forEach(item => {
            pathArr.push(getMenuItem(item));
        });
        setPathNode(pathArr);
        setSelectedMenuKey(e.key);
        gotoPage({ ...keyNode, keyPath: e.keyPath });
    }

    const clickTab = (e) => {
        e.preventDefault();
        let key = e.target.pathname;
        let tab = navigateTabs.find((item) => {
            return item.key === key;
        });
        if (key !== '/console') {
            menuClick(tab);
        } else {
            setPathNode([]);
            setSelectedMenuKey(null);
            gotoPage(tab);
        }
    }

    const gotoPage = (node) => {
        activeNavigateTab(node);
        navigate(node.url);
    }

    const activeNavigateTab = (tab) => {
        let existFlag = false;
        navigateTabs.forEach(item => {
            if (item.url === tab.url) {
                item.actived = true;
                existFlag = true;
            } else {
                item.actived = false;
            }
        });
        if (!existFlag) {
            let newNavigateTabs = navigateTabs.slice();
            if (tab.actived === null || tab.actived === undefined) {
                newNavigateTabs.push({ ...tab, actived: true });
            } else {
                tab.actived = true;
                newNavigateTabs.push({ ...tab });
            }
            setNavigateTabs(newNavigateTabs);
        }

    }

    const closeTab = (e,url) => {
        let newNavigateTabs = navigateTabs.filter(item => item.url !== url)
        setNavigateTabs(newNavigateTabs);
        if(location.pathname === url) {
            menuClick(newNavigateTabs[newNavigateTabs.length - 1]);
        }
    }

    const getMenuItem = (k) => {
        let result = null;
        menus.find((item) => {
            if (item.key === k) {
                result = item;
                return true;
            }
            if (item.children) {
                if (item.children.find(i => {
                    if (i.key === k) {
                        result = i;
                        return true;
                    }
                    return false;
                })) {
                    return true;
                }
            }
            return false;
        });
        return result;
    }

    return (
        <Layout className="console-container">
            <Sider trigger={null} collapsible collapsed={collapsed}>
                <div className="logo">{collapsed ? 'Logo' : 'Logo here'}</div>
                <Menu
                    theme="dark"
                    mode="inline"
                    defaultSelectedKeys={[]}
                    selectedKeys={[selectedMenuKey]}
                    items={menus}
                    onClick={menuClick}
                />
            </Sider>
            <Layout className="console-layout">
                <Header className="console-header" style={{ padding: 0 }}>
                    <Row justify="center" align="middle">
                        <Col span={1}>
                            {
                                React.createElement(
                                    collapsed ? MenuUnfoldOutlined : MenuFoldOutlined, {
                                    className: 'trigger',
                                    onClick: toggle,
                                }
                                )
                            }
                        </Col>
                        <Col span={1} style={{ textAlign: 'center' }} >
                            <Divider type="vertical" />
                        </Col>
                        <Col span={16} >
                            <Breadcrumb separator={<CaretRightOutlined />}>
                                <Breadcrumb.Item><HomeOutlined /> 首页</Breadcrumb.Item>
                                {
                                    pathNode.map(item => {
                                        return (
                                            <Breadcrumb.Item key={item.key}>
                                                {item.icon} {item.label}
                                            </Breadcrumb.Item>
                                        );
                                    })
                                }
                            </Breadcrumb>
                        </Col>
                        <Col span={6} className="user-center">
                            <MessageOutlined className="user-icon" />
                            <MenuOutlined className="user-icon" />
                            <Dropdown overlay={userMenu}>
                                <span>
                                    <UserOutlined className="user-icon" />
                                    <CaretDownOutlined />
                                </span>
                            </Dropdown>
                        </Col>
                    </Row>
                </Header>
                <div className="console-page-tab-container">
                    {
                        navigateTabs.map(item => {
                            return (
                                <Tag closable={item.url === '/console' ? false : true} className={item.actived ? 'actived' : ''} key={item.key} onClose={(e) => {closeTab(e,item.url)}}>
                                    <a href={item.url} onClick={clickTab}>{
                                        item.label
                                    }</a>
                                </Tag>
                            );
                        })
                    }
                </div>
                <Content className="console-content">
                    <Outlet />
                </Content>
            </Layout>
        </Layout>
    );
}

export default Console;
