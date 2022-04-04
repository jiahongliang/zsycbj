<template>
  <div class="homeBox homeIdear">
    <div class="wrap">
      <div class="homeTitle">
        <h2>{{ columnName }}</h2>
        <h3>
          <span> {{ columnEnName }} </span>
        </h3>
        <div class="line"></div>
      </div>
      <div class="homeIdearWrap">
        <ul class="slideHomeIdear clearfloat">
          <li v-for="item in articleData" :key="item.id">
            <h3>{{ item.name }}</h3>
            <div class="line"></div>
            <div class="pic ideaHref" @click="handleClickImage(item)">
              <img
                v-if="item.iconId"
                :src="'/api/attachment/get/' + item.iconId"
              />
              <img v-else src="../../assets/images/default-banner.jpg" />
            </div>
            <p class="ideaMemo">
              {{ item.memo }}
            </p>
          </li>
        </ul>
      </div>
    </div>
  </div>
</template>
<script>
import { mapState } from "vuex";

export default {
  name: "HomeIdeaComponent",
  data() {
    return {
      columnName: "栏目名称",
      columnEnName: "Column Name",
      columnId: null,
      articleData: [],
    };
  },
  mounted() {
    this.loadArticleData();
  },
  computed: {
    ...mapState({ columnData: (state) => state.cms.columnData }),
  },
  methods: {
    loadArticleData() {
      let columnIndex = 1;
      let articleNumber = 3;
      if (this.columnData && this.columnData.length > columnIndex) {
        this.columnName = this.columnData[columnIndex].name;
        this.columnEnName = this.columnData[columnIndex].enName;
        this.columnId = this.columnData[columnIndex].id;
        if(this.columnData[columnIndex].children) {
          for(let i = 0; i < articleNumber; i++) {
            if(this.columnData[columnIndex].children[i]) {
              this.articleData.push(this.columnData[columnIndex].children[i]);
            }
          }
        }
      }
    },
    handleClickImage(obj) {
      var url = "/#/article_list?cid=" + this.columnId;
      if(obj.id !== this.columnId) {
        url = url + "&dcid=" + obj.id;
      }
      window.open(url);
    }
  }
};
</script>
<style scoped>
.pic {
  overflow: hidden;
  height: 0;
  padding-bottom: 56%;
}

.ideaMemo {
  /* 内容过长显示两行，多余为省略号 */
  text-overflow:ellipsis;/*设置隐藏部分为省略号*/
  overflow: hidden;/*设置隐藏*/
  display: -webkit-box;
  -webkit-line-clamp: 4;/*设置显示行数，此处为2行，可设置其他数字*/
  -webkit-box-orient: vertical;
}
.ideaHref {
  cursor: pointer;
}
</style>