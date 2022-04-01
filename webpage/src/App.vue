<template>
  <div id="app">
    <router-view/>
  </div>
</template>

<script>
import { mapActions } from 'vuex'
export default {
  name: 'App',
  data() {
    return {

    }
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

<style src="./assets/style/public.css">
</style>
<style src="./assets/style/style.css">
</style>
