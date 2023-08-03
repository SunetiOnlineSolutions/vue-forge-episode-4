<script setup lang="ts">
import { useCategories } from '@/composables/useCategories';
import { ref } from 'vue';

// Get categories for dropdown
const { list: categories, fetchAll } = useCategories();
fetchAll();

const today = new Date().toISOString().slice(0, 10);
const sixMonthsFromNow = new Date(Date.now() + 6 * 30 * 24 * 60 * 60 * 1000).toISOString().slice(0, 10);
const project = ref({
  title: '',
  description: '',
  image: null as File | null,
  category: '',
  softCap: 10000,
  hardCap: 25000,
  startDate: today,
  endDate: sixMonthsFromNow
});

const { defineComponentBinds } = useForm();

function submit() {
  const { title, description, image, category, softCap, hardCap, startDate, endDate } = project.value;
  alert(`Submitting ${title} ${description} ${image} ${category} ${softCap} ${hardCap} ${startDate} ${endDate}`);
}
</script>

<template>
  <div class="p-8" style="width:40vw">
    <h1 class="text-2xl font-bold mb-4">Kickstart your own project</h1>
    <form @submit.prevent="submit" class="space-y-4">
      <fieldset class="space-y-4">
        <label for="title" class="block font-medium">What is your projects name?</label>
        <input type="text" id="title" name="title" required class="w-full p-2 border rounded-2xl" v-model="project.title">
        <small class="text-slate-400">Use a very handy title that people could identify your project</small>

        <label for="description" class="block font-medium">What is your project about?</label>
        <textarea id="description" name="description" required class="w-full p-2 border rounded-2xl" v-model="project.description"></textarea>        
        <small class="text-slate-400">Describe with full detail your project so that people understand exactly what it is about</small>

        <AppFileUpload bucket="projects" hint="Images must be smaller than 1MB" @file:uploaded="project.image = new File([$event], 'filename.jpg', { type: 'image/jpeg' })" />
        <!-- <input type="file" id="image" name="image" accept="image/*" required class="w-full p-2 border rounded-2xl"> -->

        <label for="category" class="block font-medium">Which category does your project fit in? </label>
        <select id="category" name="category" required class="w-full p-2 border rounded-2xl" v-model="project.category">
          <option v-for="category in categories" :key="category.uuid" :value="category.slug">{{ category.name }}</option>
        </select>

        <label for="soft-cap" class="block font-medium">What is the soft cap of your project? <span class="flex justify-end"><Money :amount="project.softCap" currency="USD" sign="" /></span></label>
        <input type="range" id="soft-cap" min={0} max="100000" step="25000" className="range range-lg text-white" v-model="project.softCap" />
        <div class="w-full flex justify-between text-xs px-2">
          <span>|</span>
          <span>|</span>
          <span>|</span>
          <span>|</span>
          <span>|</span>
        </div>
        <div class="w-full flex justify-between text-xs px-2">
          <span>$10,000.00</span>
          <span>$25,000.00</span>
          <span>$50,000.00</span>
          <span>$75,000.00</span>
          <span>$100,000.00</span>
        </div>

        <label for="hard-cap" class="block font-medium">What is the hard cap of your project?
          <span class="flex justify-end">
            <Money :amount="project.hardCap" currency="USD" sign="" />
          </span>
        </label>
        <input type="range" id="hard-cap" min={0} max="100000" step="25000" className="range range-lg text-white" v-model="project.hardCap" />
        <div class="w-full flex justify-between text-xs px-2">
          <span>|</span>
          <span>|</span>
          <span>|</span>
          <span>|</span>
          <span>|</span>
        </div>
        <div class="w-full flex justify-between text-xs px-2">
          <span>$10,000.00</span>
          <span>$25,000.00</span>
          <span>$50,000.00</span>
          <span>$75,000.00</span>
          <span>$100,000.00</span>
        </div>


        <label for="start-date" class="block font-medium">Start Date:</label>
        <input type="date" id="start-date" name="start-date" required class="w-full p-2 border rounded-2xl" v-model="project.startDate">

        <label for="end-date" class="block font-medium">End Date:</label>
        <input type="date" id="end-date" name="end-date" required class="w-full p-2 border rounded-2xl" v-model="project.endDate">
      </fieldset>

      <button type="submit" class="bg-blue-500 text-white py-2 px-4 rounded-2xl hover:bg-blue-600">Create Project</button>
    </form>
</div></template>
