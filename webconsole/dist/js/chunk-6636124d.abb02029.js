(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-6636124d"],{"02cc":function(t,a,e){"use strict";e("45d5")},"43c1":function(t,a,e){"use strict";e.d(a,"h",(function(){return r})),e.d(a,"c",(function(){return o})),e.d(a,"e",(function(){return l})),e.d(a,"d",(function(){return n})),e.d(a,"a",(function(){return s})),e.d(a,"g",(function(){return c})),e.d(a,"f",(function(){return u})),e.d(a,"i",(function(){return d})),e.d(a,"b",(function(){return h}));e("55dd");var i=e("66df"),r=function(t){return i["a"].request({url:"/api/data/article",data:t,method:"post"})},o=function(t){return i["a"].request({url:"/api/data/article/search/column-property?value="+t,method:"get"})},l=function(t){var a="";return a=t.title&&t.title.length>0?"/api/data/article/search/title_column-property_page?title=%25"+t.title+"%25&columnProperty="+t.columnProperty+"&page="+t.page+"&size="+t.size+"&sort="+t.sort:"/api/data/article/search/column-property_page?columnProperty="+t.columnProperty+"&page="+t.page+"&size="+t.size+"&sort="+t.sort,i["a"].request({url:a,method:"get"})},n=function(t){var a="";return a=t.title&&t.title.length>0?"/api/data/article/search/column-id_title_page?title=%25"+t.title+"%25&columnId="+t.columnId+"&page="+t.page+"&size="+t.size+"&sort="+t.sort:"/api/data/article/search/column-id_page?columnId="+t.columnId+"&page="+t.page+"&size="+t.size+"&sort="+t.sort,i["a"].request({url:a,method:"get"})},s=function(t){return i["a"].request({url:"/api/data/article/"+t,method:"delete"})},c=function(t){return i["a"].request({url:"/api/data/column/search/top-column?property="+t,method:"get"})},u=function(t){return i["a"].request({url:"/api/data/column/"+t+"/children",method:"get"})},d=function(t){return i["a"].request({url:"/api/data/column",data:t,method:"post"})},h=function(t){return i["a"].request({url:"/api/data/column/"+t,method:"delete"})}},"45d5":function(t,a,e){},9195:function(t,a,e){"use strict";e.r(a);var i=function(){var t=this,a=t.$createElement,e=t._self._c||a;return e("Card",{staticClass:"cardbody"},[e("div",{staticClass:"search-con search-con-top"},[e("Row",[e("Col",{attrs:{span:"16"}},[e("Input",{staticClass:"search-input",attrs:{clearable:"",placeholder:"输入关键字搜索"},model:{value:t.searchValue,callback:function(a){t.searchValue=a},expression:"searchValue"}}),e("Button",{staticClass:"search-btn",attrs:{type:"primary"},on:{click:t.handleSearch}},[e("Icon",{attrs:{type:"search"}}),t._v("  搜索")],1)],1),e("Col",{staticClass:"right-col",attrs:{span:"8"}},[e("Button",{attrs:{size:"large",icon:"ios-add-circle-outline",type:"success"},on:{click:t.handleNewLink}},[t._v("新增")])],1)],1)],1),e("div",{staticClass:"mainDiv"},[e("Table",{ref:"tables",staticClass:"mainTable",attrs:{border:"",editable:"",searchable:"","search-place":"top",columns:t.tableColumns,data:t.tableData}}),e("Page",{attrs:{total:t.totalElements,current:t.page,"page-size":t.size,"show-elevator":"","show-sizer":"","show-total":""},on:{"on-change":t.handlePageChange,"on-page-size-change":t.handlePageSizeChange}})],1),t.infoDialogVisible?e("div",{staticClass:"infoDialog"},[e("Card",{staticClass:"dialogCard"},[e("p",{attrs:{slot:"title"},slot:"title"},[e("Icon",{attrs:{type:"ios-document-outline"}}),t._v("\n                详细信息\n            ")],1),e("Form",{ref:"dataForm",attrs:{model:t.dataForm,rules:t.dataFormRules,"label-position":"right","label-width":80}},[e("FormItem",{attrs:{label:"标题",prop:"title"}},[e("Input",{staticStyle:{width:"300px"},attrs:{placeholder:"请输入标题..."},model:{value:t.dataForm.title,callback:function(a){t.$set(t.dataForm,"title",a)},expression:"dataForm.title"}})],1),e("FormItem",{attrs:{label:"连接地址",prop:"url"}},[e("Input",{staticStyle:{width:"300px"},attrs:{placeholder:"请输入连接地址..."},model:{value:t.dataForm.url,callback:function(a){t.$set(t.dataForm,"url",a)},expression:"dataForm.url"}})],1),e("div",{staticClass:"buttonBorder"},[e("Button",{staticClass:"dialogButton",attrs:{type:"primary"},on:{click:t.saveData}},[t._v(" 保 存 ")]),e("Button",{staticClass:"dialogButton",on:{click:t.closeDialog}},[t._v(" 关 闭 ")])],1)],1)],1)],1):t._e()])},r=[],o=e("43c1"),l=e("e069"),n={data:function(){var t=this;return{tableColumns:[{title:"名称",key:"title"},{title:"连接地址",key:"url"},{title:"操作",key:"action",width:150,align:"center",render:function(a,e){return a("div",[a("Button",{props:{type:"primary",size:"small"},style:{marginRight:"5px"},on:{click:function(){t.handleEdit(e.row)}}},"修改"),a("Button",{props:{type:"error",size:"small"},on:{click:function(){t.handleRemove(e.row)}}},"删除")])}}],infoDialogVisible:!1,dataForm:{title:"",url:"",id:null,columnProperty:null,columnId:null},dataFormRules:{title:[{required:!0,message:"标题必须输入",trigger:"blur"}],url:[{required:!0,message:"连接地址必须输入",trigger:"blur"}]},tableData:[],searchValue:"",size:10,totalElements:0,totalPages:0,page:1}},mounted:function(){this.dataForm.columnProperty=this.$config.columnProperty.LINK,this.dataForm.columnId=this.$config.columnProperty.LINK,this.loadData()},methods:{loadData:function(){var t=this,a={title:this.searchValue,columnProperty:this.dataForm.columnProperty,page:this.page-1,size:this.size,sort:"id,asc"};Object(o["e"])(a).then((function(a){t.tableData=a.data._embedded.cmsArticles,t.size=a.data.page.size,t.totalElements=a.data.page.totalElements,t.totalPages=a.data.page.totalPages,t.page=a.data.page.number+1}))},handlePageChange:function(t){this.page=t,this.loadData()},handlePageSizeChange:function(t){this.size=t,this.loadData()},handleEdit:function(t){this.dataForm.id=t.id,this.dataForm.title=t.title,this.dataForm.url=t.url,this.infoDialogVisible=!0},handleRemove:function(t){var a=this;l["Modal"].confirm({title:"确认删除吗？",onOk:function(){Object(o["a"])(t.id).then((function(t){a.handleClearForm(),a.loadData(),a.$Message.info("删除成功")}))},onCancel:function(){}})},handleSearch:function(){this.searchValue=this.searchValue.trim(),this.loadData()},handleNewLink:function(){this.handleClearForm(),this.infoDialogVisible=!0},closeDialog:function(){this.handleClearForm(),this.infoDialogVisible=!1},handleClearForm:function(){this.dataForm.title="",this.dataForm.url="",this.dataForm.id=null},saveData:function(){var t=this;this.$refs["dataForm"].validate((function(a){a&&Object(o["h"])(t.dataForm).then((function(a){t.handleClearForm(),t.loadData(),t.infoDialogVisible=!1,t.$Message.info("保存成功")}))}))}}},s=n,c=(e("02cc"),e("2877")),u=Object(c["a"])(s,i,r,!1,null,"96f6e05a",null);a["default"]=u.exports}}]);