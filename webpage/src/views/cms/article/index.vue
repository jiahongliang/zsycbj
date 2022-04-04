<template>
    <div>
        <div class="newsDetailH">
            <h3>{{article.title}}</h3>
            <p><span v-if="article.author">作者：{{article.author}} </span><span v-if="article.pubDate">时间：{{article.pubDate}} </span><span v-if="article.source">来源：{{article.source}}</span></p>
        </div>
        <div class="newsDetailCont">
            <div class="pic picCenter"><img :src="'/api/attachment/get/' + article.iconId"/></div>
            <p> &nbsp; </p>
            <p class="contentTitle"><i class="el-icon-caret-right"></i> 摘要</p>
            <p v-text="article.resume"></p>
            <p> &nbsp; </p>
            <p class="contentTitle"><i class="el-icon-caret-right"></i> 正文</p>
            <p v-html="article.content" class="contentDetail"></p>
        </div>
        <!-- div class="pageJump">
            <p><a href="">上一篇： </a></p>
            <p><a href="">下一篇：</a></p>                                                                 
        </div -->
    </div>
</template>
<script>
import { loadArticle } from "@/api/index.js";
export default {
  data() {
    return {
        aid: null,
        article: {}
    }
  },
  mounted(){  
      this.loadArticle();
  },
  watch: {
      '$route.query.aid': function () {
          this.loadArticle();
      }
  },
  methods: {
      loadArticle() {
          let aid = this.$route.query.aid;
          this.aid = null;
          this.article = {}
          if(aid) {
              this.aid = aid * 1;
              loadArticle(this.aid).then(res => {
                  this.article = res.data;
              });
          }
      }
  }
}
</script>

<style>
.newsDetailCont p.contentTitle {
    text-indent: 0px;
    font-size: 18px;
    font-weight: 600;
    border-bottom: 1px dashed #999999;
    margin-bottom: 10px;
}
.newsDetailCont p{
    text-align: left;
    text-indent: 32px;
}

</style>