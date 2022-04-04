<template>
    <div>
        <div class="top" id="top">
            <div class="wrap clearfloat">
                <div class="logo"><a href="/"><img src="../../assets/logo.png"/></a></div>
                <div class="nav">
                    <ul class="clearfloat">
                        <li :class="getActiveIndexClass('0')">
                            <h2><a href="/#/">首页</a></h2>
                        </li>
                        <li v-for="item in columnData" :key="item.id" :class="getActiveIndexClass(item.id)">
                            <h2><a :href="'/#/article_list?cid=' + item.id">{{item.name}}</a><span class="navBtn"></span></h2>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="muen">
                <span class="muenX"></span>
                <span class="muenY"></span>
                <span class="muenZ"></span>
            </div>
        </div>
    </div>
</template>

<script>
import $ from 'jquery'
export default {
  name: 'PageTopComponent',
  data() {
    return {
        muenObj: null,
        muenOnFlag: false
    }
  },
  computed: {
      activeIndex: function () {
          let cid = this.$route.query.cid;
          if(cid && cid.trim().length > 0) {
              return cid ;
          }
          return '0';
      },
      columnData: function () {
          return this.$store.state.cms.columnData;
      },
  },
  beforeMount() {
  },
  watch: {
  },
  mounted () {
    this.muenObj = document.querySelector('.muen');
    this.muenObj.addEventListener('click',this.handleMuenObjClick);
  },
  destroyed () {
      this.muenObj.removeEventListener('click',this.handleMuenObjClick);
  },
  methods: {
    getActiveIndexClass(indexId){
        indexId = indexId + '';
        if (this.activeIndex === indexId) {
            return 'active';
        }
        return '';
    },
    handleMuenObjClick: function (e){
        let navObj = $("#top .nav");
        if(this.muenOnFlag) {
            this.muenObj.classList.remove("on")
            navObj.stop().animate({"left":'-100%'});
            this.muenOnFlag = false;
        } else {
            this.muenObj.classList.add("on")
            navObj.stop().animate({"left":'0'});
            this.muenOnFlag = true;
        }
        e.stopPropagation();
    }
  }
}
</script>

<style scoped>
</style>