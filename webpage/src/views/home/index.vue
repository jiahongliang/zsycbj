<template>
    <div>
        <index-banner/>
        <home-news/>
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
import HomeNews from '../components/HomeNews.vue';

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
    HomeLink,
    HomeNews
  },
  beforeMount() {
  },
  mounted(){
  }
}
</script>

<style>

</style>