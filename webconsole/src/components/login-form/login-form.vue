<template>
  <Form ref="loginForm" :model="form" :rules="rules" @keydown.enter.native="handleSubmit">
    <FormItem prop="userName">
      <Input v-model="form.userName" :maxlength="20" placeholder="请输入用户名">
        <span slot="prepend">
          <Icon :size="16" type="ios-person"></Icon>
        </span>
      </Input>
    </FormItem>
    <FormItem prop="password">
      <Input type="password" v-model="form.password" :maxlength="20" placeholder="请输入密码">
        <span slot="prepend">
          <Icon :size="14" type="md-lock"></Icon>
        </span>
      </Input>
    </FormItem>
    <FormItem prop="verifyCode">
      <Input v-model="form.verifyCode" :maxlength="4" placeholder="请输入验证码">
        <span slot="prepend">
          <Icon :size="16" type="ios-keypad"></Icon>
        </span>
        <span slot="append">
          <img :src="verifyUrl" @click="fetchVerifyCode()">
        </span>
      </Input>
    </FormItem>
    <FormItem>
      <Button @click="handleSubmit" type="primary" long>登录</Button>
    </FormItem>
  </Form>
</template>
<script>
export default {
  name: 'LoginForm',
  props: {
    userNameRules: {
      type: Array,
      default: () => {
        return [
          { required: true, message: '账号不能为空', trigger: 'blur' }
        ]
      }
    },
    passwordRules: {
      type: Array,
      default: () => {
        return [
          { required: true, message: '密码不能为空', trigger: 'blur' }
        ]
      }
    },
    verifyCodeRules: {
      type: Array,
      default: () => {
        return [
          { required: true, message: '验证码不能为空', trigger: 'blur' }
        ]
      }
    }
  },
  data () {
    return {
      form: {
        userName: '',
        password: '',
        verifyCode: ''
      },
      verifyUrl: '/api/verify_code/generate'
    }
  },
  computed: {
    rules () {
      return {
        userName: this.userNameRules,
        password: this.passwordRules,
        verifyCode: this.verifyCodeRules
      }
    }
  },
  mounted () {
    this.fetchVerifyCode()
  },
  methods: {
    handleSubmit () {
      this.$store.commit('setLoginResult', '')
      this.$refs.loginForm.validate((valid) => {
        if (valid) {
          this.$emit('on-success-valid', {
            userName: this.form.userName,
            password: this.form.password,
            verifyCode: this.form.verifyCode
          })
        }
      })
    },
    fetchVerifyCode () {
      this.verifyUrl = ('/api/verify_code/generate?' + Date.now())
    }
  }
}
</script>
<style scoped>
  img {
    height: 20px;
  }
</style>
