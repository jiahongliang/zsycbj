<template>
    <div>
        <page-top/>
        <router-view/>
        <bottom/>
    </div>
</template>

<script>
import { mapActions } from 'vuex'
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
  methods: {
    ...mapActions(['fetchColumnData', 'fetchLinkData']),
  },
  beforeMount() {
  },
  mounted(){
    this.fetchColumnData();
    this.fetchLinkData();
  }
}
</script>

<style>

</style>