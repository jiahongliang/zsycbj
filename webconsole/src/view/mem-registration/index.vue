<template>
    <Card class="cardbody">
        <div class="search-con search-con-top">
            <Row>
                <Col span="16">
                    <Radio-group v-model="completeLabel" type="button" @on-change="handleCompleteFlagChange">
                      <Radio label="未确认"></Radio>
                      <Radio label="已确认"></Radio>
                  </Radio-group>
                </Col>
                <Col span="8" class="right-col">
                    &nbsp;
                </Col>
            </Row>
        </div>
        <div class="mainDiv">
            <Table border ref="tables" editable searchable search-place="top" :columns="tableColumns" :data="tableData" class="mainTable"></Table>
            <Page :total="totalElements" :current="page" :page-size="size" @on-change="handlePageChange" @on-page-size-change="handlePageSizeChange" show-elevator show-sizer show-total/>
        </div>
        <div class="infoDialog" v-if="infoDialogVisible">
            <Card class="dialogCard">
                <p slot="title">
                    <Icon type="ios-document-outline" />
                    详细信息
                </p>
                <Form ref="dataForm" :model="dataForm" label-position="right" :label-width="80">
                    <FormItem label="单位名称">
                        <Input v-model="dataForm.orgname" placeholder="" readonly="true" style="width: 300px" />
                    </FormItem>
                    <FormItem label="联系人">
                        <Input v-model="dataForm.linkman" placeholder="" readonly="true" style="width: 300px" />
                    </FormItem>
                    <FormItem label="联系电话">
                        <Input v-model="dataForm.phone" placeholder="" readonly="true" style="width: 300px" />
                    </FormItem>
                    <FormItem label="注册时间">
                        <Input v-model="dataForm.createTime" placeholder="" readonly="true" style="width: 300px" />
                    </FormItem>
                    <FormItem label="ip地址">
                        <Input v-model="dataForm.ip" placeholder="" readonly="true" style="width: 300px" />
                    </FormItem>
                    <div class="buttonBorder">
                        <Button type="primary" class="dialogButton" @click="saveData" v-if="!viewFlag">  确 认 </Button> <Button class="dialogButton" @click="closeDialog"> 关 闭 </Button>
                    </div>
                </Form>
            </Card>
        </div>
    </Card>
</template>
<script>
import { loadMemRegistrationByCompleteFlag, saveMemRegistration, deleteMemRegistration } from '@/api/biz.js'
import { Modal } from 'iview'
export default {
  data () {
    return {
      tableColumns: [
        {
          title: '单位',
          key: 'orgname'
        },
        {
          title: '联系人',
          key: 'linkman'
        },
        {
          title: '联系电话',
          key: 'phone'
        },
        {
          title: '操作',
          key: 'action',
          width: 150,
          align: 'center',
          render: (h, params) => {
            if (!params.row.completeFlag) {
              return h('div', [
                h('Button', {
                  props: {
                    type: 'primary',
                    size: 'small'
                  },
                  style: {
                    marginRight: '5px'
                  },
                  on: {
                    click: () => {
                      this.handleEdit(params.row)
                    }
                  }
                }, '确认'),
                h('Button', {
                  props: {
                    type: 'error',
                    size: 'small'
                  },
                  on: {
                    click: () => {
                      this.handleRemove(params.row)
                    }
                  }
                }, '删除')
              ])
            } else {
              return h('div', [
                h('Button', {
                  props: {
                    type: 'info',
                    size: 'small'
                  },
                  style: {
                    marginRight: '5px'
                  },
                  on: {
                    click: () => {
                      this.handleView(params.row)
                    }
                  }
                }, '查看')
              ])
            }
          }
        }
      ],
      infoDialogVisible: false,
      dataForm: {
        id: null,
        orgname: '',
        linkman: '',
        phone: '',
        ip: '',
        createTime: ''
      },
      viewFlag: false,
      tableData: [],
      completeLabel: '未确认',
      completeFlag: '0',
      searchValue: '',
      size: 10,
      totalElements: 0,
      totalPages: 0,
      page: 1
    }
  },
  mounted () {
    this.loadData()
  },
  methods: {
    loadData () {
      let searchData = {
        completeFlag: this.completeFlag,
        page: this.page - 1,
        size: this.size,
        sort: 'id,desc'
      }
      loadMemRegistrationByCompleteFlag(searchData).then(res => {
        this.tableData = res.data._embedded.memRegistrations
        this.size = res.data.page.size
        this.totalElements = res.data.page.totalElements
        this.totalPages = res.data.page.totalPages
        this.page = res.data.page.number + 1
      })
    },
    handlePageChange (page) {
      this.page = page
      this.loadData()
    },
    handlePageSizeChange (pageSize) {
      this.size = pageSize
      this.loadData()
    },
    handleEdit (item) {
      this.viewFlag = false
      this.dataForm.id = item.id
      this.dataForm.orgname = item.orgname
      this.dataForm.linkman = item.linkman
      this.dataForm.phone = item.phone
      this.dataForm.ip = item.ip
      this.dataForm.createTime = item.createTime
      this.dataForm.completeFlag = item.completeFlag
      this.infoDialogVisible = true
    },
    handleView (item) {
      this.viewFlag = true
      this.dataForm.id = item.id
      this.dataForm.orgname = item.orgname
      this.dataForm.linkman = item.linkman
      this.dataForm.phone = item.phone
      this.dataForm.ip = item.ip
      this.dataForm.createTime = item.createTime
      this.dataForm.completeFlag = item.completeFlag
      this.infoDialogVisible = true
    },
    handleRemove (item) {
      Modal.confirm({
        title: '确认删除吗？',
        onOk: () => {
          deleteMemRegistration(item.id).then(res => {
            this.handleClearForm()
            this.loadData()
            this.$Message.info('删除成功')
          })
        },
        onCancel: () => {
        }
      })
    },
    handleNewLink () {
      this.handleClearForm()
      this.infoDialogVisible = true
    },
    closeDialog () {
      this.handleClearForm()
      this.infoDialogVisible = false
    },
    handleClearForm () {
      this.dataForm.id = null
      this.dataForm.orgname = ''
      this.dataForm.linkman = ''
      this.dataForm.phone = ''
      this.dataForm.ip = ''
      this.dataForm.createTime = ''
      this.dataForm.completeFlag = ''
    },
    saveData () {
      Modal.confirm({
        title: '确认该操作吗？',
        onOk: () => {
          this.dataForm.completeFlag = 'true'
          saveMemRegistration(this.dataForm).then(res => {
            this.handleClearForm()
            this.loadData()
            this.$Message.info('确认成功')
            this.infoDialogVisible = false
          })
        },
        onCancel: () => {
          this.handleClearForm()
          this.infoDialogVisible = false
        }
      })

      this.$refs['dataForm'].validate((valid) => {
        if (valid) {
          this.dataForm.completeFlag = '1'
          saveArticle(this.dataForm).then(res => {
            this.handleClearForm()
            this.loadData()
            this.infoDialogVisible = false
            this.$Message.info('保存成功')
          })
        }
      })
    },
    handleCompleteFlagChange (v) {
      switch (v) {
        case '未确认':
          this.completeFlag = '0'
          this.loadData()
          break
        case '已确认':
          this.completeFlag = '1'
          this.loadData()
          break
        default:
          this.completeFlag = ''
          this.loadData()
      }
    }
  }
}
</script>
<style lang="less" scoped>
.cardbody {
    height: 100%;
}
/deep/ .ivu-card-body {
    height: 100%;
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
.right-col {
    text-align: right;
    padding-right: 5px;
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
    height: calc(~"100% - 90px")
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
    height: 430px;
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
}
</style>
