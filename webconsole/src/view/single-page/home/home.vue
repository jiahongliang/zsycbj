<template>
    <div class="content-div">
      <div class="main-content">
        <div class="left-content">欢迎使用<br/><strong>后台管理系统</strong></div>
        <div class="right-content">
          <img :src="imgImac">
        </div>
      </div>
    </div>
</template>

<script>
export default {
  data () {
    return {
      imgImac: require('@/assets/images/imac.png')
    }
  },
  mounted () {
    //
  }
}
</script>

<style lang="less" scoped>
.main .content-wrapper {
  line-height: 100%;
}
.bg-div{
  position: relative;
  top: 0px;
  left: 0px;
  width: 100%;
  height: 100%;
  background-image: url('../../../assets/images/main-bg.jpg');
  background-position: center;
  background-size: cover;
  margin: auto auto;
  border-radius: 10px;
  z-index: 0;
}

.content-div {
  background-color: #fff;
  z-index: 10;
  height: 100%;
  border-radius: 10px;
}
.main-content {
  width: 800px;
  height:100%;
  margin: auto;
  vertical-align: middle;
}
.left-content {
  float: left;
  width: 439px;
  margin-top: 40%;
  font-size: 60px;
  text-align: center;
  margin-top: calc(50% - 10px)
}
.right-content {
  height: 80%;
  width: 360px;
  min-height: 603px;
  float: right;
  margin-left: auto;
  margin-top: 10%;
  img {
    max-width: 99%;
    max-height: 99%;
  }
}
</style>
