<template>
  <div class="game">
    version 0.0.1
    <button @click="sendPing()">
      Пинг
    </button>
    <ul>
      <li v-for="(action, index) in gameturn" :key="index">
        {{ action }}
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  name: 'Game',

  data() {
    return {
      gameturn: [],
    };
  },

  methods: {

    sendPing() {
      this.gameturn.push('ping');
      const url = 'http://localhost:3000/game';

      this.axios.get(url)
        .then((res) => {
          this.gameturn.push(res.data);
        });
    },

  },
};
</script>
