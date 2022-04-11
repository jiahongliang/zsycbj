<template>
    <el-carousel :interval="5000" arrow="always" height="0">
        <el-carousel-item v-for="item in slideImageData" :key="item.id">
          <a :href="item.url ? item.url : '#'"><img :src="item.iconUrl"/></a>
        </el-carousel-item>
  </el-carousel>
</template>

<script>
import {fetchSlideImages} from '@/api/index.js'

export default {
  name: 'IndexBannerComponent',
  data() {
    return {
        slideImageData:[]
    }
  },
  mounted(){  
    fetchSlideImages().then( res => {
      if(res.data && res.data.length > 0) {
        for(let i in res.data) {
          let item = res.data[i];
          let obj = {
            id: item.id,
            url: item.url,
            iconUrl: '/api/attachment/get/' + item.iconId
          }
          this.slideImageData.push(obj);
        }
      }
    });
  }
}
</script>

<style scoped>
    /deep/ .el-carousel__container {
      padding-bottom: 30%;
      height: 0px;
    }
   .el-carousel__item img {
     width: 100%;
     height: auto;
     border: 0;
   }
</style>