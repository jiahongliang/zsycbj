<template>
    <div>
        <mobile-top/>
        <router-view/>
        <mobile-bottom/>
    </div>
</template>
<script>
import MobileTop from './components/MobileTop.vue';
import MobileBottom from './components/MobileBottom.vue';

export default {
  name: 'Mobile',
  data() {
    return {

    }
  },
  components: {
    MobileTop,
    MobileBottom
  },
  beforeMount() {
  },
  mounted(){
  }
}
</script>
<style scoped>

</style>