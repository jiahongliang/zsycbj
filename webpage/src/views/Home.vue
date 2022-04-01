<template>
    <div>
        <page-top/>
        <router-view/>
        <bottom/>
    </div>
</template>

<script>
import PageTop from './components/PageTop.vue';
import Bottom from './components/Bottom.vue';

export default {
  name: 'Home',
  data() {
    return {

    }
  },
  components: {
    PageTop,
    Bottom
  },
  beforeMount() {
  },
  mounted(){
  }
}
</script>

<style>

</style>