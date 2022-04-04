<template>
  <div>
    <div class="homeBox homeJoin">
      <div class="wrap">
          <div class="homeTitle">
            <h2>{{ columnName }}</h2>
            <h3>
              <span>{{ columnEnName }}</span>
            </h3>
            <div class="line"></div>
          </div>
          <div class="homeJoinWrap">
            <ul class="homeJoinList clearfloat">
              <li v-for="(item, index) in articleData" :key="index">
                <div class="pic">
                  <img :src="'/api/attachment/get/' + item.iconId" />
                </div>
                <a href="javascript:;" class="homeJoinBg" @click="handleClickItem(item)">
                  <div class="homeJoinBgInner">
                    <h3>{{ item.name }}</h3>
                    <h4>{{ item.enName }}<span></span></h4>
                    <div class="decorIcon"><i class="el-icon-news"></i></div>
                  </div>
                </a>
              </li>
            </ul>
          </div>
      </div>
    </div>
  </div>
</template>
<script>
import { mapState } from "vuex";

export default {
  name: "HomeJoinComponent",
  data() {
    return {
      columnName: "栏目名称",
      columnEnName: "Column Name",
      columnId: null,
      articleData: []
    };
  },
  mounted() {
    this.loadArticleData();
  },
  watch: {
    columnData: function () {
      this.loadArticleData();
    },
  },
  computed: {
    ...mapState({ columnData: (state) => state.cms.columnData }),
  },
  methods: {
    loadArticleData() {
      let columnIndex = 2;
      if (this.columnData && this.columnData.length > columnIndex) {
        this.columnName = this.columnData[columnIndex].name;
        this.columnEnName = this.columnData[columnIndex].enName;
        this.columnId = this.columnData[columnIndex].id;
        if(this.columnData[columnIndex].children && this.columnData[columnIndex].children[0]) {
          this.articleData.push(this.columnData[columnIndex].children[0]);
        }
        if(this.columnData[columnIndex].children && this.columnData[columnIndex].children[1]) {
          this.articleData.push(this.columnData[columnIndex].children[1]);
        }
      }
    },
    handleClickItem(obj) {
      var url = "/#/article_list?cid=" + this.columnId;
      if(obj.id !== this.columnId) {
        url = url + "&dcid=" + obj.id;
      }
      window.open(url);
    }
  },
};
</script>
<style scoped>
.decorIcon {
  position: absolute;
  top: 0px;
  left: 0px;
  width: 60px;
  height: 60px;
}
.decorIcon i {
  font-size: 30px;
  margin-left: 10px;
  margin-top: 5px;
}
</style>