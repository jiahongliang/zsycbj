<template>
    <div class="bannerCont columnTopBg"><img :src="bgImgUrl"></div>
</template>
<script>
import { mapState } from "vuex";
export default {
  data() {
    return {
      bgImgUrl: ''
    }
  },
  mounted(){  
    this.loadData();
  },
  computed: {
    ...mapState({ columnData: (state) => state.cms.columnData }),
  },
  watch: {
    "$route.query.cid": function () {
      this.loadData();
    },
    columnData: function () {
      this.loadData();
    }
  },
  methods: {
    loadData() {
      let cid = this.$route.query.cid;
      if(cid) {
        cid = cid * 1;
        if(this.columnData && this.columnData.length > 0) {
          for(let i = 0; i< this.columnData.length; i++) {
            console.log(typeof(cid),typeof(this.columnData[i].id))
            if(cid === this.columnData[i].id) {
              this.bgImgUrl = "/api/attachment/get/" + this.columnData[i].iconId + "";
              break;
            }
          }
        }
      }
    }
  }
}
</script>
<style scoped>
.columnTopBg {
  overflow: hidden;
}
.columnTopBg img{
  width: 100%;
}
</style>