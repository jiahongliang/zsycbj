<template>
 <Row class="main-row">
    <Col span="6" style="height:100%">
    <Card class="tree-card-body">
      <p slot="title">
        <Icon type="ios-cube-outline" />
        栏目树
      </p>
      <Tree :data="tableData" :load-data="loadTreeChildren" @on-select-change="handleClickNode"></Tree>
    </Card>
    </Col>
    <Col span="18" class="rightCol">
    <Card class="tree-card-body">
      <p slot="title">
        <Icon type="ios-document-outline" />
        栏目详情
      </p>
      <Form ref="dataForm" :model="dataForm" :rules="dataFormRules" label-position="right" :label-width="80">
        <FormItem label="栏目图片">
          <Upload
              ref="upload"
              :show-upload-list="false"
              type="drag"
              :on-success="handleSuccess"
              :format="['jpg','jpeg','png']"
              :max-size="2048"
              :on-format-error="handleFormatError"
              :on-exceeded-size="handleMaxSize"
              :before-upload="handleBeforeUpload"
              action="/api/attachment/upload"
              style="width: 198px;height: 198px;"
              >
              <div style="width: 198px;height:198px;line-height: 198px;">
                  <Icon type="ios-camera" size="60" v-show="dataForm.imgUrl.length == 0"></Icon>
                  <img :src="dataForm.imgUrl" style="max-width:100%;max-height:100%">
              </div>
          </Upload>
        </FormItem>
        <FormItem label="编码" prop="code">
          <Input v-model="dataForm.code" placeholder="请输入编码..." style="width: 300px" />
        </FormItem>
        <FormItem label="名称" prop="name">
          <Input v-model="dataForm.name" placeholder="请输入名称..." style="width: 600px" />
        </FormItem>
         <FormItem label="英语名称" prop="enName">
          <Input v-model="dataForm.enName" placeholder="请输入英语名称..." style="width: 600px" />
        </FormItem>
        <FormItem label="父节点" prop="parentName">
          <Input v-model="dataForm.parentName" placeholder="请选择父节点..." readonly style="width: 600px" @click.native="showParentDialog"/>
        </FormItem>
        <FormItem label="排序值" prop="orderValue">
          <Input v-model="dataForm.orderValue" placeholder="请输入排序值..." style="width: 300px" />
        </FormItem>
        <FormItem label="显示">
          <i-switch :value="dataForm.displayFlag" />
        </FormItem>
        <FormItem label="备注">
          <Input v-model="dataForm.memo" type="textarea" placeholder="请输入备注..." :rows="6" style="width:600px" />
        </FormItem>
        <div class="buttonBorder">
          <Button type="info" @click="handleClearForm">新 建</Button>
          <Button type="primary" @click="saveData">保 存</Button>
          <Button type="warning" @click="handleRemove">删 除</Button>
        </div>
      </Form>
    </Card>
    </Col>
    <div class="infoDialog" v-if="infoDialogVisible">
        <Card class="dialogCard">
            <p slot="title">
                <Icon type="ios-cube-outline" />
                请选择父节点
            </p>
            <a href="#" slot="extra" @click.prevent="closeParentDialog">
            <Icon type="ios-close"></Icon>
            关闭
            </a>
            <Tree :data="tableData" :load-data="loadTreeChildren" @on-select-change="handleSelectParentNode"></Tree>
        </Card>
    </div>
 </Row>
</template>
<script>
import { loadTopColumn, saveColumn, loadColumnChildren, deleteColumn } from '@/api/biz.js'
import { Modal } from 'iview'
export default {
  data () {
    return {
      infoDialogVisible: false,
      dataForm: {
        id: null,
        code: '',
        name: '',
        enName: '',
        pid: null,
        parentName: '',
        iconId: null,
        imgUrl: '',
        orderValue: '50',
        property: this.$config.columnProperty.OTHER,
        displayFlag: true,
        memo: ''
      },
      dataFormRules: {
        name: [
          {
            required: true,
            message: '名称必须输入',
            trigger: 'blur'
          }
        ],
        orderValue: [
          {
            required: true,
            message: '请输入排序值',
            trigger: 'blur'
          }
        ]
      },
      tableData: [],
      size: 10,
      totalElements: 0,
      totalPages: 0,
      page: 1
    }
  },
  mounted () {
    this.dataForm.columnProperty = this.$config.columnProperty.OTHER
    // this.dataForm.columnId = this.$config.columnProperty.OTHER
    this.loadData()
  },
  methods: {
    loadData () {
      this.tableData = []
      loadTopColumn(this.dataForm.columnProperty).then(res => {
        res.data._embedded.cmsColumns.forEach(element => {
          this.tableData.push(this.convertToTreeNode(element))
        })
      })
    },
    loadTreeChildren (item, callback) {
      loadColumnChildren(item.id).then(res => {
        let data = []
        res.data._embedded.cmsColumns.forEach(element => {
          data.push(this.convertToTreeNode(element))
        })
        callback(data)
        // console.log(data)
      })
    },
    convertToTreeNode (column) {
      // console.log('column', column)
      let node = {
        id: column.id,
        code: column.code,
        name: column.name,
        enName: column.enName,
        pid: column.pid,
        parentName: column.parentName,
        iconId: column.iconId,
        orderValue: column.orderValue,
        property: column.property,
        displayFlag: column.displayFlag,
        memo: column.memo,
        title: column.name,
        expand: false,
        children: [],
        loading: false
      }
      if (column.children && column.children.length > 0) {
        column.children.forEach(element => {
          node.children.push(this.convertToTreeNode(element))
        })
      }
      return node
    },
    handleClickNode (items) {
      // console.log(items)
      if (items && items.length > 0) {
        let item = items[0]
        this.dataForm.id = item.id
        this.dataForm.code = item.code
        this.dataForm.name = item.name
        this.dataForm.enName = item.enName
        this.dataForm.pid = item.pid
        this.dataForm.parentName = item.parentName
        this.dataForm.iconId = item.iconId
        this.dataForm.imgUrl = item.iconId ? '/api/attachment/get/' + item.iconId : ''
        this.dataForm.orderValue = item.orderValue + ''
        this.dataForm.displayFlag = item.displayFlag
        this.dataForm.memo = item.memo
      }
    },
    handleEdit (item) {
      this.dataForm.id = item.id
      this.dataForm.title = item.title
      this.dataForm.url = item.url
      this.infoDialogVisible = true
    },
    handleRemove () {
      if (this.dataForm.id) {
        Modal.confirm({
          title: '确认删除吗？',
          onOk: () => {
            deleteColumn(this.dataForm.id).then(res => {
              this.handleClearForm()
              this.loadData()
              this.$Message.info('删除成功')
            })
          },
          onCancel: () => {
          }
        })
      }
    },
    showParentDialog () {
      this.infoDialogVisible = true
    },
    closeParentDialog () {
      this.infoDialogVisible = false
    },
    handleSelectParentNode (items) {
      // console.log('items', items)
      if (items && items.length > 0) {
        let item = items[0]
        if (this.validateParentId(item, this.dataForm.id)) {
          this.dataForm.pid = item.id
          this.dataForm.parentName = item.title
          this.closeParentDialog()
          return
        }
        // console.log(item)
      }
      this.dataForm.pid = null
      this.dataForm.parentName = ''
      this.closeParentDialog()
    },
    validateParentId (item, id) {
      // console.log('-------', item.id, id)
      if (item.id === id) {
        return false
      }
      if (item.children && item.children.length > 0) {
        for (let o in item.children) {
          if (!this.validateParentId(o, id)) {
            return false
          }
        }
      }
      return true
    },
    handleClearForm () {
      this.dataForm.id = null
      this.dataForm.code = ''
      this.dataForm.name = ''
      this.dataForm.enName = ''
      this.dataForm.pid = null
      this.dataForm.parentName = ''
      this.dataForm.iconId = null
      this.dataForm.imgUrl = ''
      this.dataForm.orderValue = '50'
      this.dataForm.property = this.$config.columnProperty.OTHER
      this.dataForm.displayFlag = true
      this.dataForm.memo = ''
    },
    saveData () {
      this.$refs['dataForm'].validate((valid) => {
        if (valid) {
          saveColumn(this.dataForm).then(res => {
            this.handleClearForm()
            this.loadData()
            this.$Message.info('保存成功')
          })
        }
      })
    },
    handleSuccess (res, file) {
      if (res && res.rows && res.rows.length > 0) {
        this.dataForm.imgUrl = '/api/attachment/get/' + res.rows[0].id
        this.dataForm.iconId = res.rows[0].id
      }
    },
    handleFormatError (file) {
      this.$Notice.warning({
        title: '文件格式不正确',
        desc: '选中文件 ' + file.name + ' 的格式错误, 请选择 jpg 或 png 文件.'
      })
    },
    handleMaxSize (file) {
      this.$Notice.warning({
        title: '超出文件大小限制',
        desc: '选中文件  ' + file.name + ' 太大, 不应该超过 2M.'
      })
    },
    handleBeforeUpload () {
      const check = true
      return check
    }
  }
}
</script>
<style lang="less" scoped>
.main-row {
  height: calc(~"100% - 10px");
}
.tree-card-body {
    height: calc(~"100% ");
}
/deep/ .ivu-card-body {
    height: calc(~"100% - 60px");
    overflow: auto;
}
.ivu-page {
    margin-top: 5px;
    margin-left: 5px;
}
.search-con{
  padding: 10px 0;
  .search{
    &-col{
      display: inline-block;
      width: 200px;
    }
    &-input{
      display: inline-block;
      width: 200px;
      margin-left: 2px;
    }
    &-btn{
      margin-left: 2px;
    }
  }
}
.rightCol {
    height: 100%;
}
.mainTable {
    height: 100%;
}
/deep/ .ivu-table-body {
    height: calc(~"100% - 40px");
    overflow: auto;
}
/deep/ .ivu-table th {
    text-align: center;
}
.mainDiv {
    height: calc(~"100% - 60px")
}
.infoDialog {
    background-color: rgba(169,169,169,0.5);
    position: absolute;
    left: 0px;
    top: 0px;
    width: 100%;
    height: 100%;
}
.dialogCard {
    position: absolute;
    width: 410px;
    height: 250px;
    left: 0;
    top: 0;
    right: 0;
    bottom: 0;
    margin: auto;
}
.dialogButton {
    margin: 10px;
}
.buttonBorder {
    text-align: center;
    width: 600px;
}
.ivu-btn {
  margin: 0 10px;
}
</style>
