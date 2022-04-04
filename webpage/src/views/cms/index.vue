<template>
  <div>
    <column-top />
    <div class="main">
      <div class="wrap clearfloat">
        <div class="contLeft">
          <div class="contLeftTit">
            <span><img src="../../assets/images/course_ico.png" /></span>
            <h2>{{ column.name }}</h2>
            <h3>{{ column.enName }}</h3>
          </div>
          <div class="contLeftNav">
            <ul>
              <li
                v-for="(item, index) in column.children"
                :key="index"
                :class="dcid && dcid === item.id ? 'active' : ''"
              >
                <h3>
                  <a :href="'/#/article_list?cid=' + cid + '&dcid=' + item.id">
                    {{ item.name }}
                  </a>
                </h3>
              </li>
            </ul>
          </div>
        </div>
        <div class="contRight">
          <div class="contRightH clearfloat">
            <h2 v-if="detailColumn">{{ detailColumn.name }}</h2>
            <h2 v-else>{{ column.name }}</h2>
            <p>
              您的位置：<a href="/#/index">首页</a> &gt; <a v-if="column" :href="'/#/article_list?cid=' + column.id">{{column.name}}</a> <template v-if="detailColumn">&gt;
              <span>{{detailColumn.name}}</span></template>
            </p>
          </div>
          <div class="contRightLine"></div>

          <div class="contRightWrap">
            <router-view />
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import { mapState } from "vuex";
import ColumnTop from "./components/ColumnTop.vue";

export default {
  data() {
    return {
      cid: null,
      dcid: null,
      aid: null,
      column: {},
      detailColumn: null,
    };
  },
  components: {
    ColumnTop,
  },
  computed: {
    ...mapState({ columnData: (state) => state.cms.columnData }),
  },
  mounted() {
    this.loadData();
  },
  watch: {
    "$route.query.cid": function () {
      this.loadData();
    },
    "$route.query.dcid": function () {
      this.loadData();
    },
    columnData: function () {
      this.loadData();
    }
  },
  methods: {
    loadData() {
      let cid = this.$route.query.cid;
      let dcid = this.$route.query.dcid;
      if (cid) {
        cid = cid * 1;
        this.cid = cid;
        for (let i in this.columnData) {
          if (this.columnData[i].id === this.cid) {
            this.column = this.columnData[i];
          }
        }

        if (dcid && this.column.children) {
          dcid = dcid * 1;
          this.dcid = dcid;
          for (let j in this.column.children) {
            if (this.column.children[j].id === this.dcid) {
              this.detailColumn = this.column.children[j];
            }
          }
        } else {
          this.dcid = null;
          this.detailColumn = null;
        }
      } else {
        this.cid = null;
        this.column = {};
        this.dcid = null;
        this.detailColumn = null;
      }
    },
  },
};
</script>
<style scoped>
</style>