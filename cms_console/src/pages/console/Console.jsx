import React, { useState } from "react";
import { Outlet } from "react-router-dom";
import { Layout, Menu, Row, Col, Dropdown, Breadcrumb, Divider } from "antd";
import {
    MenuUnfoldOutlined,
    MenuFoldOutlined,
    UserOutlined,
    VideoCameraOutlined,
    UploadOutlined,
    MessageOutlined,
    MenuOutlined,
    CaretDownOutlined,
    HomeOutlined,
    AppstoreOutlined,
    UnorderedListOutlined,
    CodeOutlined
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
    }/>
);

const Console = () => {
    const [collapsed, setCollapsed] = useState(false);

    const toggle = () => {
        setCollapsed(!collapsed);
    }

    return (
        <Layout className="console-container">
            <Sider trigger={null} collapsible collapsed={collapsed}>
                <div className="logo">Logo here</div>
                <Menu
                    theme="dark"
                    mode="inline"
                    defaultSelectedKeys={[1]}
                    items={[
                        {
                            key: '1',
                            icon: <UserOutlined />,
                            label: 'nav 1',
                        },
                        {
                            key: '2',
                            icon: <VideoCameraOutlined />,
                            label: 'nav 2',
                        },
                        {
                            key: '3',
                            icon: <UploadOutlined />,
                            label: 'nav 3',
                        },
                    ]}
                />
            </Sider>
            <Layout className="console-layout">
                <Header className="console-layout-background console-header" style={{ padding: 0 }}>
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
                        <Col span={1} style={{textAlign: 'center'}} >
                            <Divider type="vertical"/>
                        </Col>
                        <Col span={16} >
                            <Breadcrumb>
                                <Breadcrumb.Item><HomeOutlined /> Home</Breadcrumb.Item>
                                <Breadcrumb.Item>
                                    <AppstoreOutlined /> Application Center
                                </Breadcrumb.Item>
                                <Breadcrumb.Item>
                                    <UnorderedListOutlined /> Application List
                                </Breadcrumb.Item>
                                <Breadcrumb.Item> <CodeOutlined /> An Application</Breadcrumb.Item>
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
                <Content
                    className="console-layout-background" style={{ margin: '3px 0 0 0', padding: 0 }}>
                    <Outlet />
                </Content>
            </Layout>
        </Layout>
    );
}

export default Console;
