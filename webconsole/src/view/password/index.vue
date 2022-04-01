<template>
    <Card class="main-card">
         <p slot="title">
            修改密码
        </p>
        <Form ref="passwordForm" :model="passwordForm" :rules="formRules" label-position="right" :label-width="80">
         <FormItem label="原密码" prop="prepass">
            <Input v-model="passwordForm.prepass" type="password" placeholder="请输入原密码..." style="width: 300px" />
         </FormItem>
         <FormItem label="新密码" prop="newpass">
            <Input v-model="passwordForm.newpass" type="password" placeholder="请输入新密码..." style="width: 300px" />
         </FormItem>
         <FormItem label="确认密码" prop="repass">
            <Input v-model="passwordForm.repass" type="password" placeholder="请输入确认密码..." style="width: 300px" />
         </FormItem>
        </Form>
        <div class="button-border">
            <Button type="primary" @click="saveData"> 保 存 </Button>
            <Button @click="clearForm"> 清 空 </Button>
        </div>
    </Card>
</template>
<script>
import { updateUserPassword } from '@/api/user.js'
export default {
  data () {
    const validatePassCheck = (rule, value, callback) => {
      if (value === '') {
        callback(new Error('确认密码必须输入'))
      } else if (value !== this.passwordForm.newpass) {
        callback(new Error('确认密码和密码必须相同'))
      } else {
        callback()
      }
    }

    const validatePassNew = (rule, value, callback) => {
      if (value === '') {
        callback(new Error('新密码必须输入'))
      } else if ((value === this.passwordForm.prepass)) {
        callback(new Error('新旧密码不能相同'))
      } else {
        callback()
      }
    }

    return {
      passwordForm: {
        prepass: '',
        newpass: '',
        repass: ''
      },
      formRules: {
        prepass: [
          {
            required: true,
            message: '原密码必须输入',
            trigger: 'blur'
          }
        ],
        newpass: [
          {
            validator: validatePassNew,
            trigger: 'blur'
          }
        ],
        repass: [
          {
            validator: validatePassCheck,
            trigger: 'blur'
          }
        ]
      }
    }
  },
  methods: {
    saveData () {
      this.$refs['passwordForm'].validate((valid) => {
        if (valid) {
          updateUserPassword(this.$store.state.user.token, this.passwordForm).then(res => {
            if (res.data.code === 10000) {
              this.clearForm()
              this.$Message.info('修改成功')
            } else {
              this.$Message.error(res.data.msg)
            }
          })
          /*
          saveColumn(this.dataForm).then(res => {
            this.handleClearForm()
            this.loadData()
            this.$Message.info('保存成功')
          }) */
        }
      })
    },
    clearForm () {
      this.passwordForm.prepass = ''
      this.passwordForm.newpass = ''
      this.passwordForm.repass = ''
      this.$refs['passwordForm'].resetFields()
    }
  }
}
</script>
<style lang="less" scoped>
  .main-card {
      width:430px;
      height:320px;
      margin:0 auto
  }
  .button-border {
      text-align: center;
  }
  .ivu-btn {
      margin: 10px;
  }
</style>
