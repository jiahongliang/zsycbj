import React from "react";
import { Card, Form, Input, Button, Image} from "antd";
import {LockOutlined, UserOutlined, HolderOutlined } from '@ant-design/icons';
import Base64 from 'base-64';
import './Login.css';

class Login extends React.Component {
    form = React.createRef();

    constructor(props) {
        super(props);
        this.state = {
            validateCodeImageUrl: '/api/verify_code/generate',
            loginActionError: '',
        }
    }

    reloadValidateCode = () => {
        this.setState({
            validateCodeImageUrl: '/api/verify_code/generate?' + (new Date()).getTime(),
        });
    }

    handleLogin = () => {
        this.form.current.validateFields().then(data => {
            let loginToken = Base64.encode(JSON.stringify(data));
            console.log('loginToken', loginToken);
        });
    }

    render() {
        return (
            <div className="login-container">
                <div className="login-box">
                    <Card size="small" 
                        bordered={true} 
                        hoverable 
                        title="欢迎登录" 
                        headStyle={{'fontWeight': '600'}}>
                        <Form ref={this.form} className="login-form" onFinish={this.onFinish}>
                                <Form.Item name="username" rules={[{required: true, message: '请输入用户名'}]}>
                                    <Input addonBefore={<UserOutlined />} maxLength={20} placeholder="请输入用户名"/>
                                </Form.Item>
                                <Form.Item name="password" rules={[{required: true, message: '请输入密码'}]}>
                                    <Input.Password addonBefore={<LockOutlined/>} maxLength={20} placeholder="请输入密码"/>
                                </Form.Item>
                                <Form.Item name="verifyCode" rules={[{required: true, message: '请输入验证码'}]}>
                                    <Input addonBefore={<HolderOutlined />} maxLength={4} 
                                        addonAfter={<Image width={80} src={this.state.validateCodeImageUrl} onClick={this.reloadValidateCode} preview={false}/>} 
                                        placeholder="请输入验证码"/>
                                </Form.Item>
                                <Button type="primary" block onClick={this.handleLogin}> 登录 </Button>
                                <div className="ant-form-item-explain-error">{this.state.loginActionError}</div>
                        </Form>
                    </Card>
                </div>
            </div>
        );
    }
}
export default Login;
