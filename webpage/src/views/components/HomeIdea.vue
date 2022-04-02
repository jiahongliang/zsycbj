<template>
  <div class="homeBox homeIdear">
    <div class="wrap">
      <div class="homeTitle">
        <h2>{{columnName}}</h2>
        <h3>
          <span> {{columnEnName}} </span>
        </h3>
        <div class="line"></div>
      </div>
      <div class="homeIdearWrap">
        <ul class="slideHomeIdear clearfloat">
          <li v-for="(item) in articleData" :key="item.id">
            <h3>{{item.title}}</h3>
            <div class="line"></div>
            <div class="pic">
              <img v-if="item.iconId" :src="'/api/attachment/get/' + item.iconId" />
              <img v-else src="../../assets/images/default-banner.jpg"/>
            </div>
            <p>
              {{item.resume}}
            </p>
          </li>
        </ul>
      </div>
    </div>
  </div>
</template>
<script>
import { mapState } from "vuex";
import {fetchArticleList} from '@/api/index.js'

export default {
  name: "HomeIdeaComponent",
  data() {
    return {
        columnName: '栏目名称',
        columnEnName: 'Column Name',
        articleData: []
    };
  },
  mounted() {
      if(this.columnData && this.columnData.length > 0) {
        this.columnName = this.columnData[0].name;
        this.columnEnName = this.columnData[0].enName;
        const columnIds = this.columnData[0].descendantsId;
        columnIds.push(this.columnData[0].id);
        let data = {
            ext: columnIds,
            pageNum: 1,
            pageSize: 3
        }
        fetchArticleList(data).then((res) => {
            this.articleData = res.data.content;
        });
      }
  },
  computed: {
    ...mapState({ columnData: (state) => state.cms.columnData }),
  }
};
</script>
<style scoped>
    .pic {
        overflow: hidden;
        height: 0;
        padding-bottom: 56%;
    }
</style>