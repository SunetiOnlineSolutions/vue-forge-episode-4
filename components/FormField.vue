<script setup lang="ts">
const props = defineProps<{
  label: string;
  name: string;
  modelValue?: any;
  as?: string;
  hint?: string;
  id?: string;
  class?: string;
}>();

const emit = defineEmits<{
  (e: "update:modelValue", payload: typeof props.modelValue): void;
}>();

const {value, handleChange, errorMessage} = useField<string | number>(() => props.name, undefined, {
    syncVModel: true,
});

watch(value, (val) => emit("update:modelValue", val));
watch(
  () => props.modelValue,
  (val) => (value.value = val)
);

// handle input attributes
const id = computed(() => props.id || props.name);

const classes = computed(() => {
  if (props.class) return props.class;
  if (props.as === "select") return `select select-bordered ${errorMessage.value ? "select-error" : ""}`;
  if (props.as === "textarea") return `textarea textarea-bordered h-64 ${errorMessage.value ? "textarea-error" : ""}`;
  return `input input-bordered ${errorMessage.value ? "input-error" : ""}`;
});

const $attrs = useAttrs();

const fieldAttrs = computed(() => {
  return {
    id: props.id,
    name: props.name,
    ...$attrs,
    class: `w-full ${classes.value}`,
  };
});
</script>

<script lang="ts">
export default {
  inheritAttrs: false,
};
</script>
<template>
  <div class="w-full max-w-full mb-4 form-control">
    <label class="label" :for="id">
      <span class="label-text">
        <slot name="label">{{ label }}</slot>
      </span>
      <span class="label-text-alt">
        <slot name="label-text-alt"></slot>
      </span>
      <span v-if="errorMessage" class="text-xs text-red-600">{{ errorMessage }}</span>
    </label>

    <slot name="after-label"></slot>

    <input v-if="!as" v-bind="fieldAttrs" @input="handleChange" :value="value" />

    <select v-if="as === 'select'" v-bind="fieldAttrs" @input="handleChange" :value="value">
      <slot></slot>
    </select>

    <textarea
      v-if="as === 'textarea'"
      v-bind="fieldAttrs"
      @input="handleChange" :value="value"
    ></textarea>

    <slot name="after-input"></slot>

    <label :for="id" class="label" v-if="hint">
      <span class="text-gray-400 label-text-alt">
        <slot name="hint">
          {{ hint }}
        </slot>
      </span>
    </label>
  </div>
</template>