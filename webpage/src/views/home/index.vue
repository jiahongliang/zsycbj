<template>
    <div>
        <index-banner/>
        <home-idea/>
        <home-join/>
        <home-link/>
    </div>
</template>

<script>
import IndexBanner from '../components/IndexBanner.vue';
import HomeIdea from '../components/HomeIdea.vue';
import HomeJoin from '../components/HomeJoin.vue';
import HomeLink from '../components/HomeLink.vue';

export default {
  name: 'Index',
  data() {
    return {

    }
  },
  components: {
    IndexBanner,
    HomeIdea,
    HomeJoin,
    HomeLink
  },
  beforeMount() {
  },
  mounted(){
  }
}
</script>

<style>

</style>