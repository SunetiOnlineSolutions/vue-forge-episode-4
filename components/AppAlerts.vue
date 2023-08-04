<script setup lang="ts">
  const { alerts, dismiss } = useAlerts();
</script>
<template>
  <div class="fixed bottom-0 z-10 w-full p-2 right-2 sm:p-0 sm:w-auto sm:bottom-5">
    <TransitionGroup name="list" tag="div">
      <div v-for="alert in alerts" :key="alert.id" :class="`alert alert-${alert.type} mb-4 border-t-[1px] shadow-sm w-max`">
        <AlertIcon :type="alert.type" />
        <div class="flex flex-col">
          <span class="font-bold" v-if="alert.title">{{ alert.title }}</span>
          <p>{{ alert.message }}</p>
        </div>
        <button v-if="alert.dismissiable" @click="dismiss(alert)"
            class="btn btn-ghost p-1 transition rounded hover:bg-white">Dismiss</button>
      </div>
    </TransitionGroup>
  </div>
</template>
<style scoped>
.list-move,
/* apply transition to moving elements */
.list-enter-active,
.list-leave-active {
  transition: all 0.6s ease;
}

.list-enter-from {
  opacity: 0;
  transform: translateX(60px);
}

.list-leave-to {
  opacity: 0;
  transform: translateX(60px) translateY(-100%);
}

/* ensure leaving items are taken out of layout flow so that moving
   animations can be calculated correctly. */
.list-leave-active {
  position: absolute;
}
</style>
