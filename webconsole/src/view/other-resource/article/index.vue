<template>
 <Row class="main-row">
    <Col span="6" style="height:100%">
    <Card class="tree-card-body">
      <p slot="title">
        <Icon type="ios-cube-outline" />
        栏目树
      </p>
      <Tree :data="treeData" :load-data="loadTreeChildren" @on-select-change="handleClickNode"></Tree>
    </Card>
    </Col>
    <Col span="18" class="rightCol">
        <Card class="tree-card-body">
        <p slot="title">
            <Icon type="ios-browsers-outline" />
            文章列表<template v-if="columnName.length > 0"> - [栏目：{{columnName}}]</template>
        </p>
        <div class="search-con search-con-top">
                <Row>
                    <Col span="16">
                        <Input clearable placeholder="输入关键字搜索" class="search-input" v-model="searchValue"/>
                        <Button @click="loadTableData" class="search-btn" type="primary"><Icon type="search"/>&nbsp;&nbsp;搜索</Button>
                    </Col>
                    <Col span="8" class="right-col">
                        <Button size="large" icon="ios-add-circle-outline" type="success" @click="handleNewArticle">新增</Button>
                    </Col>
                </Row>
            </div>
            <div class="mainDiv">
                <Table border ref="tables" editable searchable search-place="top" :columns="tableColumns" :data="tableData" :loading="tableLoading" class="mainTable"></Table>
                <Page :total="totalElements" :current="page" :page-size="size" @on-change="handlePageChange" @on-page-size-change="handlePageSizeChange" show-elevator show-sizer show-total/>
            </div>
        </Card>
    </Col>
    <div class="infoDialog" v-if="infoDialogVisible">
        <Card class="dialogCard">
            <p slot="title">
                <Icon type="ios-document-outline" />
                文章详情<template v-if="columnName.length > 0"> - [栏目：{{columnName}}]</template>
            </p>
            <a href="#" slot="extra" @click.prevent="closeDialog">
                <Icon type="ios-close"></Icon>
                关闭
            </a>
            <Form ref="dataForm" :model="dataForm" :rules="dataFormRules" label-position="right" :label-width="80">
                <FormItem label="文章图片">
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
                <FormItem label="标题" prop="title">
                    <Input v-model="dataForm.title" placeholder="请输入标题..." style="width: 600px" />
                </FormItem>
                <FormItem label="副标题" prop="subTitle">
                    <Input v-model="dataForm.subTitle" placeholder="请输入副标题..." style="width: 600px" />
                </FormItem>
                <FormItem label="作者" prop="author">
                    <Input v-model="dataForm.author" placeholder="请输入作者..." style="width: 300px" />
                </FormItem>
                <FormItem label="来源" prop="source">
                    <Input v-model="dataForm.source" placeholder="请输入来源..." style="width: 300px" />
                </FormItem>
                <FormItem label="发布日期" prop="pubDate">
                    <DatePicker v-model="dataForm.pubDate" type="date" placeholder="请选择日期..." @on-change="selectPubDate" style="width: 300px"></DatePicker>
                </FormItem>
                <FormItem label="摘要" prop="resume">
                    <Input v-model="dataForm.resume" placeholder="请输入摘要..." type="textarea" :rows="4" style="width: 600px" />
                </FormItem>
                <FormItem label="内容" prop="content">
                    <editor ref="editor" :value="dataForm.content" @on-change="handleContentChange" :cache="false"/>
                </FormItem>
                <FormItem label="连接地址" prop="url">
                    <Input v-model="dataForm.url" placeholder="请输入连接地址..." style="width: 600px" />
                </FormItem>
                <FormItem label="排序值" prop="orderValue">
                    <Input v-model="dataForm.orderValue" placeholder="请输入排序值..." style="width: 300px" />
                </FormItem>
                <div class="buttonBorder">
                    <Button type="primary" class="dialogButton" @click="saveData"> 保 存 </Button> <Button class="dialogButton" @click="closeDialog"> 关 闭 </Button>
                </div>
            </Form>
        </Card>
    </div>
 </Row>
</template>
<script>
import { loadTopColumn, loadColumnChildren, loadArticlesByTitleAndColumnId, saveArticle, deleteArticle } from '@/api/biz.js'
import { Modal } from 'iview'
import Editor from '_c/editor'
export default {
  components: {
    Editor
  },
  data () {
    return {
      tableColumns: [
        {
          title: '标题',
          key: 'title',
          tree: true
        },
        {
          title: '作者',
          key: 'author'
        },
        {
          title: '来源',
          key: 'source'
        },
        {
          title: '发布日期',
          key: 'pubDate'
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
        id: null,
        columnId: null,
        iconId: null,
        imgUrl: '',
        title: '',
        subTitle: '',
        author: '',
        source: '',
        pubDate: '',
        resume: '',
        content: '',
        url: '',
        orderValue: '50',
        columnProperty: this.$config.columnProperty.OTHER
      },
      dataFormRules: {
        title: [
          {
            required: true,
            message: '标题必须输入',
            trigger: 'blur'
          }
        ],
        content: [
          {
            required: true,
            message: '内容必须输入',
            trigger: 'change'
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
      treeData: [],
      tableData: [],
      tableLoading: false,
      columnId: null,
      columnName: '',
      searchValue: '',
      size: 10,
      totalElements: 0,
      totalPages: 0,
      page: 1
    }
  },
  mounted () {
    this.dataForm.columnProperty = this.$config.columnProperty.OTHER
    this.loadData()
  },
  methods: {
    loadData () {
      this.treeData = []
      loadTopColumn(this.dataForm.columnProperty).then(res => {
        res.data._embedded.cmsColumns.forEach(element => {
          this.treeData.push(this.convertToTreeNode(element))
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
        this.columnId = item.id
        this.columnName = item.name
        this.loadTableData()
      }
    },
    loadTableData () {
      this.tableLoading = true
      let searchData = {
        title: this.searchValue.trim(),
        columnId: this.columnId,
        page: this.page - 1,
        size: this.size,
        sort: 'id,desc'
      }
      loadArticlesByTitleAndColumnId(searchData).then(res => {
        this.tableData = res.data._embedded.cmsArticles
        this.size = res.data.page.size
        this.totalElements = res.data.page.totalElements
        this.totalPages = res.data.page.totalPages
        this.page = res.data.page.number + 1
        this.tableLoading = false
      }).catch(err => {
        console.log(err)
        this.tableLoading = false
      })
    },
    handlePageChange (page) {
      this.page = page
      this.loadTableData()
    },
    handlePageSizeChange (pageSize) {
      this.size = pageSize
      this.loadTableData()
    },
    handleNewArticle () {
      if (this.columnId) {
        this.handleClearForm()
        this.infoDialogVisible = true
      } else {
        this.$Message.info('请首先选择栏目')
      }
    },
    handleEdit (item) {
      this.dataForm.id = item.id
      this.dataForm.columnId = item.columnId
      this.dataForm.iconId = item.iconId
      this.dataForm.imgUrl = item.iconId ? '/api/attachment/get/' + item.iconId : ''
      this.dataForm.title = item.title
      this.dataForm.subTitle = item.subTitle
      this.dataForm.author = item.author
      this.dataForm.source = item.source
      this.dataForm.pubDate = item.pubDate
      this.dataForm.resume = item.resume
      this.dataForm.content = item.content
      this.dataForm.url = item.url
      this.dataForm.orderValue = item.orderValue + ''
      this.dataForm.columnProperty = this.$config.columnProperty.OTHER
      this.infoDialogVisible = true
    },
    handleRemove (item) {
      Modal.confirm({
        title: '确认删除吗？',
        onOk: () => {
          deleteArticle(item.id).then(res => {
            this.handleClearForm()
            this.loadTableData()
            this.$Message.info('删除成功')
          })
        },
        onCancel: () => {
        }
      })
    },
    closeDialog () {
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
      this.dataForm.columnId = null
      this.dataForm.iconId = null
      this.dataForm.imgUrl = ''
      this.dataForm.title = ''
      this.dataForm.subTitle = null
      this.dataForm.author = ''
      this.dataForm.source = ''
      this.dataForm.pubDate = ''
      this.dataForm.resume = ''
      this.dataForm.content = ''
      this.dataForm.url = ''
      this.dataForm.orderValue = '50'
      this.dataForm.columnProperty = this.$config.columnProperty.OTHER
    },
    saveData () {
      this.$refs['dataForm'].validate((valid) => {
        if (valid) {
          this.dataForm.columnId = this.columnId
          saveArticle(this.dataForm).then(res => {
            this.handleClearForm()
            this.loadTableData()
            this.closeDialog()
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
    },
    handleContentChange (html, text) {
      this.dataForm.content = html
    },
    selectPubDate (val) {
      this.dataForm.pubDate = new Date(val)
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
.right-col {
    text-align: right;
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
    height: calc(~"100% - 80px")
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
    width: 800px;
    height: 600px;
    left: 0;
    top: 0;
    right: 0;
    bottom: 0;
    margin: auto;
    z-index: 10;
}
.dialogButton {
    margin: 10px;
}
.buttonBorder {
    text-align: center;
}
.ivu-btn {
  margin: 0 10px;
}
</style>
