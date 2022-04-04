<template>
  <div>
    <ul class="courseList">
      <li class="clearfloat" v-for="(item, index) in articleData" :key="index">
        <div class="pic">
          <a
            :href="
              '/#/article_info?aid=' +
              item.id +
              '&cid=' +
              cid +
              '&dcid=' +
              item.columnId
            "
            ><img :src="item.imgUrl"
          /></a>
        </div>
        <div class="cont">
          <h3 class="single-line">
            <a
              :href="
                '/#/article_info?aid=' +
                item.id +
                '&cid=' +
                cid +
                '&dcid=' +
                item.columnId
              "
              >{{ item.title }}</a
            >
          </h3>
          <p>
            {{ item.resume }}
          </p>
        </div>
      </li>
    </ul>

    <div class="el-page-wrapper">
      <el-pagination
        @size-change="handleSizeChange"
        @current-change="handleCurrentChange"
        :current-page="pageNum"
        :page-sizes="[10, 20, 30, 40, 50]"
        :page-size="pageSize"
        layout="total, sizes, prev, pager, next, jumper"
        :total="total"
      >
      </el-pagination>
    </div>
  </div>
</template>
<script>
import { mapState } from "vuex";
import { fetchArticleList } from "@/api/index.js";

export default {
  data() {
    return {
      cid: null,
      dcid: null,
      articleData: [],
      pageNum: 1,
      pageSize: 10,
      total: 0,
    };
  },
  computed: {
    ...mapState({ columnData: (state) => state.cms.columnData }),
  },
  beforeMount() {},
  mounted() {
    this.loadArticleData();
  },
  watch: {
    "$route.query.cid": function () {
      this.loadArticleData();
    },
    "$route.query.dcid": function () {
      this.loadArticleData();
    },
    columnData: function () {
      this.loadArticleData();
    },
  },
  methods: {
    loadArticleData() {
      let dcid = this.$route.query.dcid;
      let cid = this.$route.query.cid;
      let columnIds = [];
      this.articleData = [];

      if (dcid) {
        this.dcid = dcid * 1;
      }
      if (cid) {
        this.cid = cid * 1;
        let column = null;
        for (let i in this.columnData) {
          if (this.columnData[i] && this.columnData[i].id === this.cid) {
            column = this.columnData[i];
            columnIds = [];
            columnIds = [...this.columnData[i].descendantsId];
            columnIds.push(this.cid);
            break;
          }
        }

        if (dcid && column && column.children) {
          this.dcid = dcid * 1;
          for (let j in column.children) {
            if (column.children[j] && column.children[j].id === this.dcid) {
              columnIds = [];
              columnIds = [...column.children[j].descendantsId];
              columnIds.push(this.dcid);
              break;
            }
          }
        }
      }

      if (columnIds.length > 0) {
        let data = {
          ext: columnIds,
          pageNum: this.pageNum,
          pageSize: this.pageSize,
        };
        fetchArticleList(data).then((res) => {
          if (res.data && res.data.content && res.data.content.length > 0) {
            this.articleData = res.data.content;
            this.total = res.data.totalElements;
            this.articleData.map((item) => {
              item.imgUrl = "/api/attachment/get/" + item.iconId;
            });
          }
        });
      }
    },
    handleSizeChange(v) {
      this.pageSize = v;
      this.loadArticleData();
    },
    handleCurrentChange(v) {
      this.pageNum = v;
      this.loadArticleData();
    },
  },
};
</script>

<style scoped>
.el-page-wrapper {
  text-align: center;
  margin-top: 10px;
}

@media (max-width: 1920px) {
  .courseList {
    min-height: 390px;
  }
}

@media (max-width: 1680px) {
  .courseList {
    min-height: 430px;
  }
}
@media (max-width: 1440px) {
  .courseList {
    min-height: 430px;
  }
}
@media (max-width: 1366px) {
  .courseList {
    min-height: 430px;
  }
}
@media (max-width: 1280px) {
  .courseList {
    min-height: 450px;
  }
}

@media (max-width: 1080px) {
  .courseList {
    min-height: 470px;
  }
}

@media (max-width: 1024px) {
  .courseList {
    min-height: 470px;
  }
}

@media (max-width: 992px) {
  .courseList {
    min-height: 450px;
  }
}

@media (max-width: 768px) {
  .courseList {
    min-height: 480px;
  }
}
</style>