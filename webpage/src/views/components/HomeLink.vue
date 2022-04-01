<template>
    <div class="homeLink">
        <div class="wrap">
            <div class="homeTitle">
                <h2>友情链接</h2>
                <h3><span>Friendship link</span></h3>
                <div class="line"></div>
            </div>
            <div class="homeLinkWrap">
                <a v-for="(item) in linkData" :key="item.id" :href="item.url" target="_blank">{{item.title}}</a>                  
            </div>
            
        </div>
    </div>
</template>
<script>
export default {
  name: 'HomeLinkComponent',
  data() {
    return {
    }
  },
  computed: {
      linkData: function () {
          return this.$store.state.cms.linkData;
      }
  },
  beforeMount(){
  },
  mounted(){  
  }
}
</script>

<style scoped>
</style>