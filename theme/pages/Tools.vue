<template>
  <div class="tools-page">
    <div
      class="tools-item card-box"
      v-for="item of ToolsList"
      :key="item.index"
      @click="openTool(item)"
      :style="{
        background: 'url(' + item.img + ') center center / cover no-repeat',
      }"
    >
      <div class="tools-item__mask" />
      <div class="tools-item__title">
        {{ item.name }}
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      ToolsList: [
        {
          id: 1,
          name: "时钟",
          link: "/clock/",
          img: "https://cdn.jsdelivr.net/gh/Aohonze/PicRepo/20210618142917.png",
        },
        {
          id: 2,
          name: "更多",
          link: "/tools/",
          img: "https://cdn.jsdelivr.net/gh/tyrone-wu/PicRepo/秋8.png",
        },
      ],
    };
  },
  created() {},
  methods: {
    openTool(item) {
      this.$router.push(item.link);
    },
  },
};
</script>

<style scoped lang="stylus">
.tools-page {
  margin-top: $navbarHeight;
  display: flex;
  flex-wrap: wrap;
  justify-content: space-around;
  padding: 48px;
}

.tools-item {
  position: relative;
  width: 600px;
  height: 300px;
  margin-bottom: 24px;
  display: flex;
  justify-content: center;
  overflow: hidden;

  &__mask {
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.4);
  }

  &__title {
    position: absolute;
    top: 50%;
    left: 50%;
    font-size: 48px;
    font-weight: bolder;
    color: #fff;
    transform: translate(-50%, -50%);
  }
}
</style>
