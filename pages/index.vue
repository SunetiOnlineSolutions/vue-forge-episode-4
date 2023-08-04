<script setup lang="ts">
const { success, error, warning, info } = useAlerts();

onMounted(() => {
  success("This is a success message", {
    title: "THIS IS TEST CODE",
  });
  error("This is an error message", {
    title: "THIS IS TEST CODE",
  });
  warning("This is a warning message", {
    title: "THIS IS TEST CODE",
  });
  info("This is an info message", {
    title: "REMOVE FROM index.vue",
  });
});
</script>


<template>
  <div>
    <ProjectsList class="mt-24" />
  </div>
</template>
