<template>
<div>
    <Card style="width:430px;height:460px;margin:0 auto">
         <p slot="title">
            上传图片
        </p>
        <a href="#" slot="extra" @click.prevent="handleSaveImg">
            <Icon type="ios-loop-strong"></Icon>
            保存
        </a>
        <a href="#" slot="extra" @click.prevent="handleClear">
            <Icon type="ios-loop-strong"></Icon>
            清空
        </a>
        <div style="margin:0 auto 20px auto;text-align: center">
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
                style="width: 198px;height: 198px;margin:0 auto"
                >
                <div style="width: 198px;height:198px;line-height: 198px;">
                    <Icon type="ios-camera" size="60" v-show="imgForm.imgUrl.length == 0"></Icon>
                    <img :src="imgForm.imgUrl" style="max-width:100%;max-height:100%">
                </div>
            </Upload>
        </div>
        <Form :model="imgForm" label-position="right" :label-width="60">
         <FormItem label="标题">
            <Input v-model="imgForm.title" placeholder="请输入标题..." style="width: 300px" />
         </FormItem>
         <FormItem label="连接">
            <Input v-model="imgForm.url" placeholder="请输入连接地址..." style="width: 300px" />
         </FormItem>
         <FormItem label="排序号">
            <Input-number :max="10000" :min="1" v-model="imgForm.orderValue" placeholder="请输入排序号..." ></Input-number>
         </FormItem>
        </Form>
    </Card>
    <div class="slideImageList">
      <div class="cardTitle"><Icon type="ios-film-outline"></Icon>轮播图列表</div>
      <div style="margin-top:5px">
        <div class="demo-upload-list" v-for="(item,index) in slideImageList" v-bind:key="index">
            <img :src="'/api/attachment/get/' + item.iconId">
            <div class="demo-upload-list-cover">
                <Icon type="ios-eye-outline" @click.native="handleView(item.iconId)"></Icon>
                <Icon type="ios-create-outline" @click.native="handleEdit(item)"></Icon>
                <Icon type="ios-trash-outline" @click.native="handleRemove(item)"></Icon>
            </div>
        </div>
      </div>
    </div>
    <Modal title="预览大图" v-model="visible">
        <img :src="'/api/attachment/get/' + viewId " v-if="visible" style="width: 100%">
    </Modal>
</div>
</template>
<script>
import { saveArticle, loadArticlesByColumnProperty, deleteArticle } from '@/api/biz.js'
import { Modal } from 'iview'
export default {
  data () {
    return {
      slideImageList: [],
      uploadList: [],
      visible: false,
      viewId: null,
      imgForm: {
        id: null,
        columnProperty: null,
        columnId: null,
        iconId: null,
        imgUrl: '',
        title: '',
        url: '',
        orderValue: '100'
      }
    }
  },
  methods: {
    handleView (viewId) {
      this.viewId = viewId
      this.visible = true
    },
    handleEdit (file) {
      this.imgForm.id = file.id
      this.imgForm.iconId = file.iconId
      this.imgForm.imgUrl = '/api/attachment/get/' + file.iconId
      this.imgForm.title = file.title
      this.imgForm.url = file.url
      this.imgForm.orderValue = file.orderValue
    },
    handleRemove (file) {
      Modal.confirm({
        title: '确认删除吗？',
        onOk: () => {
          deleteArticle(file.id).then(res => {
            this.handleClear()
            this.loadAllSlideImages()
            this.$Message.info('删除成功')
          })
        },
        onCancel: () => {
        }
      })
    },
    handleSuccess (res, file) {
      if (res && res.rows && res.rows.length > 0) {
        this.imgForm.imgUrl = '/api/attachment/get/' + res.rows[0].id
        this.imgForm.iconId = res.rows[0].id
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
    handleClear () {
      this.imgForm.id = null
      this.imgForm.iconId = null
      this.imgForm.imgUrl = ''
      this.imgForm.title = ''
      this.imgForm.url = ''
      this.imgForm.orderValue = '100'
    },
    handleSaveImg () {
      if (this.imgForm.iconId == null) {
        this.$Notice.warning({
          title: '没有上传图片',
          desc: '请首先上传图片后再保存.'
        })
        return
      }
      saveArticle(this.imgForm).then(res => {
        this.handleClear()
        this.loadAllSlideImages()
        this.$Message.info('保存成功')
      })
    },
    loadAllSlideImages () {
      loadArticlesByColumnProperty(2).then(res1 => {
        this.slideImageList = res1.data._embedded.cmsArticles
        // console.log('slideImageList', this.slideImageList)
      })
    }
  },
  mounted () {
    this.imgForm.columnProperty = this.$config.columnProperty.SLIDE_IMAGE
    this.imgForm.columnId = this.$config.columnProperty.SLIDE_IMAGE
    this.loadAllSlideImages()
  }
}
</script>
<style>
  .demo-upload-list{
      display: inline-block;
      width: 200px;
      height: 200px;
      text-align: center;
      line-height: 200px;
      border: 1px solid transparent;
      border-radius: 4px;
      overflow: hidden;
      background: #fff;
      position: relative;
      box-shadow: 0 1px 1px rgba(0,0,0,.2);
      margin-right: 4px;
  }
  .demo-upload-list img{
      width: 100%;
      height: 100%;
  }
  .demo-upload-list-cover{
      display: none;
      position: absolute;
      top: 0;
      bottom: 0;
      left: 0;
      right: 0;
      background: rgba(0,0,0,.6);
  }
  .demo-upload-list:hover .demo-upload-list-cover{
      display: block;
  }
  .demo-upload-list-cover i{
      color: #fff;
      font-size: 20px;
      cursor: pointer;
      margin: 0 2px;
  }
  .slideImageList {
    padding: 10px;
    margin-top: 20px;

      border: 1px solid transparent;
      border-radius: 4px;
      overflow: hidden;
      background: #fff;
      position: relative;
      box-shadow: 0 1px 1px rgba(0,0,0,.2);
  }
  .cardTitle {
    padding: 10px;
    height: 50px;
    line-height: 20px;
    font-size: 14px;
    color: #17233d;
    font-weight: bold;
    border-bottom: 1px solid #e8eaec;
  }
</style>
