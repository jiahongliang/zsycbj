<template>
    <div>
        <column-top/>
        <div class="main">
        <div class="wrap clearfloat">
          <div class="contLeft">
            <div class="contLeftTit">
              <span><img src="../../assets/images/course_ico.png"/></span>
              <h2>课程设置</h2>
              <h3>Curriculum setting</h3>
            </div>
            <div class="contLeftNav">
              <ul>
                <li>
                  <h3><a href="javascript:;">雪地课程<span class="contLeftBtn"></span></a></h3>
                  <div class="contLeftDown">
                    <a href="javascript:;">雪地课程</a>
                    <a href="javascript:;">雪地课程</a>
                    <a href="javascript:;">雪地课程</a>
                    <a href="javascript:;">雪地课程</a>
                  </div>
                </li>
                <li class="active">
                  <h3><a href="javascript:;">海洋课程<span class="contLeftBtn"></span></a></h3>
                  <div class="contLeftDown">
                    <a href="javascript:;">海洋课程</a>
                    <a href="javascript:;">海洋课程</a>
                    <a href="javascript:;">海洋课程</a>
                    <a href="javascript:;">海洋课程</a>
                  </div>
                </li>
                <li>
                  <h3><a href="">语言课程</a></h3>
                </li>
                <li>
                  <h3><a href="javascript:;">综合课程<span class="contLeftBtn"></span></a></h3>
                  <div class="contLeftDown">
                    <a href="javascript:;">综合课程</a>
                    <a href="javascript:;">综合课程</a>
                    <a href="javascript:;">综合课程</a>
                    <a href="javascript:;">综合课程</a>
                  </div>
                </li>
                <li>
                  <h3><a href="">语言课程</a></h3>
                </li>
                <li>
                  <h3><a href="javascript:;">综合课程<span class="contLeftBtn"></span></a></h3>
                  <div class="contLeftDown">
                    <a href="javascript:;">综合课程</a>
                    <a href="javascript:;">综合课程</a>
                    <a href="javascript:;">综合课程</a>
                    <a href="javascript:;">综合课程</a>
                  </div>
                </li>
              </ul>
            </div>
            
          </div>
          <div class="contRight">
            <div class="contRightH clearfloat">
              <h2>海洋课程</h2>
              <p>您的位置：<a href="">首页</a>  &gt;  <a href="">课程设置</a> &gt; <span>海洋课程</span></p>
            </div>
            <div class="contRightLine"></div>
            
            <div class="contRightWrap">
              <router-view/>
            </div>
          </div>
        </div>
      </div>
    </div>
</template>
<script>
import ColumnTop from './components/ColumnTop.vue';

export default {
  data() {
    return {
      cid: null,
      aid: null
    }
  },
  components: {
    ColumnTop
  },
  beforeMount() {
  },
  mounted(){
    this.aid = this.$route.query.aid;
  },
  watch: {
    '$route.query.aid': function () {
      this.aid = this.$route.query.aid;
    }
  }
}
</script>
<style scoped>

</style>