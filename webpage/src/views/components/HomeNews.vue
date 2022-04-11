<template>
  <div class="homeBox homeJoin">
    <div class="wrap">
      <div class="homeTitle">
        <h2><a :href="'/#/article_list?cid=' + columnId">{{ columnName }}</a></h2>
        <h3>
          <span>{{ columnEnName }}</span>
        </h3>
        <div class="line"></div>
      </div>

      <div class="homeCamWrap">
        <ul class="homeCamList clearfloat">
          <li v-for="(item,index) in articleData" :key="index">
            <div class="pic">
              <a :href="item.detailUrl" target="_blank"><img :src="item.imgUrl" /></a>
            </div>
            <div class="homeCamCont">
              <h3 class="single-line">
                <a :href="item.detailUrl" target="_blank">{{item.title}}</a>
              </h3>
              <h4>{{item.pubDate}}</h4>
              <div class="line"></div>
              <p class="multi-line">
                {{item.resume}}
              </p>
              <a class="more" :href="item.detailUrl" target="_blank">MORE+</a>
            </div>
          </li>
        </ul>
      </div>
    </div>
  </div>
</template>
<script>
import { mapState } from "vuex";
import { fetchArticleList } from "@/api/index.js";

export default {
  name: "HomeJoinComponent",
  data() {
    return {
      columnName: "新闻中心",
      columnEnName: "News Center",
      columnId: null,
      articleData: [
        {
          title: "招聘专区",
          subTitle: "Employeement Area",
          imgUrl: require("../../assets/images/home_join_img1.jpg"),
        },
        {
          title: "加入我们",
          subTitle: "Enrolment Area",
          imgUrl: require("../../assets/images/home_join_img2.jpg"),
        },
      ],
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
        let column_index = 0;
        let article_number = 3;
      if (this.columnData && this.columnData.length > column_index) {
        this.columnName = this.columnData[column_index].name;
        this.columnEnName = this.columnData[column_index].enName;
        this.columnId = this.columnData[column_index].id;
        let columnIds = this.columnData[column_index].descendantsId;
        columnIds.push(this.columnData[column_index].id);
        let data = {
          ext: columnIds,
          pageNum: 1,
          pageSize: article_number,
        };
        fetchArticleList(data).then((res) => {
          if (res.data && res.data.content && res.data.content.length > 0) {
            this.articleData = res.data.content;
            this.articleData.map((item) => {
              item.imgUrl = "/api/attachment/get/" + item.iconId;
              item.detailUrl = '/#/article_info?aid=' + item.id + '&cid=' + this.columnData[column_index].id + (item.columnId === this.columnData[column_index].id ? '' : '&dcid=' + item.columnId);
            });
          }
        });
      }
    },
  },
};
</script>
