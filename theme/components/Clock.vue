<template>
  <div class="time-page">
    <div class="time-page-cover">
      <div class="time-content">
        <div v-if="showHours" class="time-content-card">
          <p>{{ hours | formatTime }}</p>
          <div class="card-line" />
        </div>

        <div v-if="showMinutes" class="time-content-card">
          <p>{{ minutes | formatTime }}</p>
          <div class="card-line" />
        </div>
        <div v-if="showSeconds" class="time-content-card">
          <p>{{ seconds | formatTime }}</p>
          <div class="card-line" />
        </div>
      </div>
      <div class="slogan-content">
        <p>明日复明日，明日何其多。我生待明日，万事成蹉跎！</p>
      </div>
      <router-link to="/tools/"> 返回 </router-link>
    </div>
  </div>
</template>
<script>
export default {
  name: "clock",
  props: {
    showHours: {
      type: Boolean,
      default: true,
    },
    showMinutes: {
      type: Boolean,
      default: true,
    },
    showSeconds: {
      type: Boolean,
      default: true,
    },
  },
  data() {
    return {
      hours: new Date().getHours(),
      minutes: new Date().getMinutes(),
      seconds: new Date().getSeconds(),
    };
  },
  mounted() {
    setInterval(() => {
      this.seconds = new Date().getSeconds();
      if (this.seconds === 0) {
        this.minutes = new Date().getMinutes();
        if (this.minutes === 0) {
          this.hours = new Date.getHours();
        }
      }
    }, 1000);
  },
  filters: {
    formatTime(val) {
      return val >= 10 ? String(val) : "0" + val;
    },
  },
  methods: {},
};
</script>
<style lang="stylus">
.time-page {
  width: 100%;
  height: 100vh;
  // background: url('theme/components/IMG_0269.JPG');
  background: url('https://cdn.jsdelivr.net/gh/tyrone-wu/PicRepo/bg5.jpg') center center / cover no-repeat; // cdn.jsdelivr.net/gh/tyrone-wu/PicRepo/bg4.jpg) center center / cover no-repeat

  &-cover {
    width: 100%;
    height: 100%;
    // background-color: rgba(0, 0, 0, 0.1);
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
  }

  .time-content {
    display: flex;
    justify-content: center;
    align-items: center;

    &-card {
      display: flex;
      justify-content: center;
      align-items: center;
      width: 400px;
      height: 400px;
      font-size: 300px;
      font-weight: bolder;
      color: white;
      background-color: #212121;
      opacity: 0.9;
      border-radius: 15px;

      &:not(:last-Child) {
        margin-right: 30px;
      }

      .card-line {
        position: absolute;
        width: 396px;
        border-top: 4px solid #000;
      }
    }
  }

  .slogan-content {
    padding: 30px 0;
    text-align: center;
    font-size: 30px;
    width: 1000px;
    height: 100px;
    color: #fff;
  }
}
</style>