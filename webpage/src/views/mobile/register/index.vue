<template>
    <div>
        <div class="block-holder"></div>
        <el-card class="box-card" shadow="never" v-if="!completeFlag">
            <div slot="header" class="clearfix">
                <span style="font-weight: 600">会员注册</span>
            </div>
            <el-form label-position="top" :rules="rules" ref="registerForm" label-width="100px" :model="registerForm">
                <el-form-item label="单位名称" prop="orgname">
                    <el-input v-model="registerForm.orgname"></el-input>
                </el-form-item>
                <el-form-item label="联系人" prop="linkman">
                    <el-input v-model="registerForm.linkman"></el-input>
                </el-form-item>
                <el-form-item label="联系电话" prop="phone">
                    <el-input v-model="registerForm.phone"></el-input>
                </el-form-item>
                <div class="submit-button">
                    <el-button type="success" round style="width: 100%" @click="submitForm('registerForm')">提交</el-button>
                </div>
            </el-form>
        </el-card>
        <el-result icon="success" title="提交成功" subTitle="您的信息已经提交，管理员会尽快与您取得练习，请耐心等待" v-if="completeFlag">
        </el-result>
    </div>
</template>
<script>
import { memberRegister } from "@/api/index.js";
export default {
  name: 'mobile_register',
  data() {
    return {
        registerForm: {
            orgname: '',
            linkman: '',
            phone: ''
        },
        rules: {
            orgname: [
                { required: true, message: '请输入单位名称', trigger: 'blur' },
                { min: 2, max: 50, message: '长度不要超过50个文字', trigger: 'blur' }
            ],
            linkman: [
                { required: true, message: '请输入联系人', trigger: 'blur' },
                { min: 2, max: 50, message: '长度不要超过50个文字', trigger: 'blur' }
            ],
            phone: [
                { required: true, message: '请输入联系电话', trigger: 'blur' },
                { min: 2, max: 50, message: '长度不要超过50个文字', trigger: 'blur' }
            ],
        },
        completeFlag: false
    }
  },
  methods: {
      submitForm(formName) {
        this.$refs[formName].validate((valid) => {
            if(valid) {
                let req = {
                    entity: this.registerForm
                }
                memberRegister(req).then((res) => {
                    if(res && res.code === 10000) {
                        this.completeFlag = true;
                    }
                });
            } 
        });
      }
  }
}
</script>
<style scoped>
    .block-holder {
        height: 58px;
    }

    .box-card {
        width: 96%;
        margin: 10px auto;
    }

    .text {
        font-size: 14px;
    }

    .item {
        margin-bottom: 18px;
    }

    .clearfix:before,
    .clearfix:after {
        display: table;
        content: "";
    }
    .clearfix:after {
        clear: both
    }
    .submit-button {
        text-align: center;
        margin: 40px auto 10px auto;
    }
</style>