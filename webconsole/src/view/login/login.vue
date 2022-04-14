<style lang="less">
  @import './login.less';
</style>

<template>
  <div class="login">
    <div class="login-con">
      <Card icon="log-in" title="欢迎登录" :bordered="false">
        <div class="form-con">
          <login-form @on-success-valid="handleSubmit" ref="loginForm"></login-form>
          <p v-if="loginResultInfo.length > 0" style="color:red;font-size:12px" v-text="loginResultInfo"></p>
        </div>
      </Card>
    </div>
  </div>
</template>

<script>
import { Base64 } from 'js-base64'
import LoginForm from '_c/login-form'
import { mapActions } from 'vuex'
export default {
  components: {
    LoginForm
  },
  methods: {
    ...mapActions([
      'handleLogin',
      'getUserInfo'
    ]),
    handleSubmit ({ userName, password, verifyCode }) {
      let loginJson = {
        userName,
        password,
        verifyCode
      }
      let loginToken = Base64.encode(JSON.stringify(loginJson))
      this.handleLogin(loginToken).then(res => {
        this.getUserInfo().then(res => {
          this.$router.push({
            name: this.$config.homeName
          })
        })
      })
      this.$refs.loginForm.fetchVerifyCode()
    }
  },
  computed: {
    loginResultInfo () {
      return this.$store.state.user.loginResult
    }
  },
  mounted () {
    // console.log(this.$store)
  }
}
</script>

<style>

</style>
