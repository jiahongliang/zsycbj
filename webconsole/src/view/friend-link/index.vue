<template>
    <Card class="cardbody">
        <div class="search-con search-con-top">
            <Row>
                <Col span="16">
                    <Input clearable placeholder="输入关键字搜索" class="search-input" v-model="searchValue"/>
                    <Button @click="handleSearch" class="search-btn" type="primary"><Icon type="search"/>&nbsp;&nbsp;搜索</Button>
                </Col>
                <Col span="8" class="right-col">
                    <Button size="large" icon="ios-add-circle-outline" type="success" @click="handleNewLink">新增</Button>
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
                <Form ref="dataForm" :model="dataForm" :rules="dataFormRules" label-position="right" :label-width="80">
                    <FormItem label="标题" prop="title">
                        <Input v-model="dataForm.title" placeholder="请输入标题..." style="width: 300px" />
                    </FormItem>
                    <FormItem label="连接地址" prop="url">
                        <Input v-model="dataForm.url" placeholder="请输入连接地址..." style="width: 300px" />
                    </FormItem>
                    <FormItem label="排序号">
                        <Input-number :max="10000" :min="1" v-model="dataForm.orderValue" placeholder="请输入排序号..." ></Input-number>
                    </FormItem>
                    <div class="buttonBorder">
                        <Button type="primary" class="dialogButton" @click="saveData"> 保 存 </Button> <Button class="dialogButton" @click="closeDialog"> 关 闭 </Button>
                    </div>
                </Form>
            </Card>
        </div>
    </Card>
</template>
<script>
import { loadArticlesByTitleAndColumnProperty, saveArticle, deleteArticle } from '@/api/biz.js'
import { Modal } from 'iview'
export default {
  data () {
    return {
      tableColumns: [
        {
          title: '名称',
          key: 'title'
        },
        {
          title: '连接地址',
          key: 'url'
        },
        {
          title: '操作',
          key: 'action',
          width: 150,
          align: 'center',
          render: (h, params) => {
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
              }, '修改'),
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
          }
        }
      ],
      infoDialogVisible: false,
      dataForm: {
        title: '',
        url: '',
        id: null,
        columnProperty: null,
        columnId: null,
        orderValue: '100'
      },
      dataFormRules: {
        title: [
          {
            required: true,
            message: '标题必须输入',
            trigger: 'blur'
          }
        ],
        url: [
          {
            required: true,
            message: '连接地址必须输入',
            trigger: 'blur'
          }
        ]
      },
      tableData: [],
      searchValue: '',
      size: 10,
      totalElements: 0,
      totalPages: 0,
      page: 1
    }
  },
  mounted () {
    this.dataForm.columnProperty = this.$config.columnProperty.LINK
    this.dataForm.columnId = this.$config.columnProperty.LINK
    this.loadData()
  },
  methods: {
    loadData () {
      let searchData = {
        title: this.searchValue,
        columnProperty: this.dataForm.columnProperty,
        page: this.page - 1,
        size: this.size,
        sort: 'id,asc'
      }
      loadArticlesByTitleAndColumnProperty(searchData).then(res => {
        this.tableData = res.data._embedded.cmsArticles
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
      this.dataForm.id = item.id
      this.dataForm.title = item.title
      this.dataForm.url = item.url
      this.dataForm.orderValue = item.orderValue
      this.infoDialogVisible = true
    },
    handleRemove (item) {
      Modal.confirm({
        title: '确认删除吗？',
        onOk: () => {
          deleteArticle(item.id).then(res => {
            this.handleClearForm()
            this.loadData()
            this.$Message.info('删除成功')
          })
        },
        onCancel: () => {
        }
      })
    },
    handleSearch () {
      this.searchValue = this.searchValue.trim()
      this.loadData()
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
      this.dataForm.title = ''
      this.dataForm.url = ''
      this.dataForm.id = null
      this.dataForm.orderValue = '100'
    },
    saveData () {
      this.$refs['dataForm'].validate((valid) => {
        if (valid) {
          saveArticle(this.dataForm).then(res => {
            this.handleClearForm()
            this.loadData()
            this.infoDialogVisible = false
            this.$Message.info('保存成功')
          })
        }
      })
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
    height: 300px;
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
