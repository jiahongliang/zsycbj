<template>
  <div class="homeBox homeJoin">
    <div class="wrap">
      <template>
        <div class="homeTitle">
          <h2>加入我们</h2>
          <h3><span>Join us</span></h3>
          <div class="line"></div>
        </div>
        <div class="homeJoinWrap">
          <ul class="homeJoinList clearfloat">
            <li>
              <div class="pic">
                <img src="../../assets/images/home_join_img1.jpg" />
              </div>
              <a href="" class="homeJoinBg">
                <div class="homeJoinBgInner">
                  <h3>招生专区</h3>
                  <h4>ENROLMENT AREA<span></span></h4>
                </div>
              </a>
            </li>
            <li>
              <div class="pic">
                <img src="../../assets/images/home_join_img2.jpg" />
              </div>
              <a href="" class="homeJoinBg">
                <div class="homeJoinBgInner">
                  <h3>招聘专区</h3>
                  <h4>RECRUITMENT AREA<span></span></h4>
                  <div class="decorIcon"><i class="el-icon-news"></i></div>
                </div>
              </a>
            </li>
          </ul>
        </div>
      </template>

      <template>
        <div class="homeTitle">
          <h2>校园动态</h2>
          <h3><span>Campus dynamics</span></h3>
          <div class="line"></div>
        </div>

        <div class="homeCamWrap">
          <ul class="homeCamList clearfloat">
            <li>
              <div class="pic">
                <a href=""
                  ><img src="../../assets/images/home_cum_img1.jpg"
                /></a>
              </div>
              <div class="homeCamCont">
                <h3 class="single-line">
                  <a href="">会员收费活动 | 英语思维之桌游系列</a>
                </h3>
                <h4>2018-07-10</h4>
                <div class="line"></div>
                <p class="multi-line">
                  我们为您准备了 30-500
                  人的各类活动专用场地，并配备了音箱、投影、桌椅、茶歇等增值服务。我们撤掉…
                </p>
                <a class="more" href="">MORE+</a>
              </div>
            </li>
            <li>
              <div class="pic">
                <a href=""
                  ><img src="../../assets/images/home_cum_img2.jpg"
                /></a>
              </div>
              <div class="homeCamCont">
                <h3 class="single-line">
                  <a href="">会员收费活动 | 英语思维之桌游系列</a>
                </h3>
                <h4>2018-07-10</h4>
                <div class="line"></div>
                <p class="multi-line">
                  我们为您准备了 30-500
                  人的各类活动专用场地，并配备了音箱、投影、桌椅、茶歇等增值服务。我们撤掉…
                </p>
                <a class="more" href="">MORE+</a>
              </div>
            </li>
            <li>
              <div class="pic">
                <a href=""
                  ><img src="../../assets/images/home_cum_img3.jpg"
                /></a>
              </div>
              <div class="homeCamCont">
                <h3 class="single-line">
                  <a href="">会员收费活动 | 英语思维之桌游系列</a>
                </h3>
                <h4>2018-07-10</h4>
                <div class="line"></div>
                <p class="multi-line">
                  我们为您准备了 30-500
                  人的各类活动专用场地，并配备了音箱、投影、桌椅、茶歇等增值动专用场地，并配备了音箱、投影、桌椅、茶歇等增值服务。我们撤掉…
                </p>
                <a class="more" href="">MORE+</a>
              </div>
            </li>
          </ul>
        </div>
      </template>
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
      columnName1: "栏目名称",
      columnEnName1: "Column Name",
      articleData1: [],
      columnName2: "栏目名称",
      columnEnName2: "Column Name",
      articleData2: [],
    };
  },
  mounted() {
    if (this.columnData && this.columnData.length > 1) {
      this.columnName1 = this.columnData[1].name;
      this.columnEnName1 = this.columnData[1].enName;
      let columnIds = this.columnData[1].descendantsId;
      columnIds.push(this.columnData[1].id);
      let data = {
        ext: columnIds,
        pageNum: 1,
        pageSize: 2,
      };
      fetchArticleList(data).then((res) => {
        this.articleData1 = res.data.content;
        console.log(this.articleData1);
      });
    }

    if (this.columnData && this.columnData.length > 2) {
      this.columnName2 = this.columnData[2].name;
      this.columnEnName2 = this.columnData[2].enName;
      let columnIds = this.columnData[2].descendantsId;
      columnIds.push(this.columnData[2].id);
      let data = {
        ext: columnIds,
        pageNum: 1,
        pageSize: 2,
      };
      fetchArticleList(data).then((res) => {
        this.articleData2 = res.data.content;
        console.log(this.articleData2);
      });
    }
  },
  computed: {
    ...mapState({ columnData: (state) => state.cms.columnData }),
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