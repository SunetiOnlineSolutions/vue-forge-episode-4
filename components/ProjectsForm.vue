<script setup lang="ts">
import {z} from "zod";

const schema = toTypedSchema(z.object({
  title: z.string().nonempty('Title is rquired').min(3),
  description: z.string().nonempty('Description is rquired').max(500),
  image: z.string().nonempty('Image is rquired'),
  categoryUuid: z.string().nonempty('Category is rquired').uuid(),
  softCap: z.number(),
  hardCap: z.number(),
  startsAt: z.string().regex(/^\d{4}-\d{2}-\d{2}$/),
  finishesAt: z.string().regex(/^\d{4}-\d{2}-\d{2}$/),
}))

const { defineComponentBinds, values: project, setFieldValue , handleSubmit} = useForm({
  validationSchema: schema,
  initialValues:{
    title: "",
    description: "",
    image: "https://cataas.com/cat",
    categoryUuid: "",
    softCap: 10_000,
    hardCap: 25_000,
    startsAt: useDateFormat(new Date(), "YYYY-MM-DD").value,
    finishesAt: useDateFormat(getDateXMonthsFromNow(6), "YYYY-MM-DD").value,
  },
})

watch([() => project.softCap], ([soft]) => {
  if(soft === undefined || project.softCap === undefined) return;
  if (soft > project.hardCap) {
    const plus500 = soft + 5000;
    setFieldValue("hardCap", plus500 < 10000 ? plus500 : soft);
  }
});
watch([() => project.hardCap], ([hard]) => {
  if(hard === undefined || project.hardCap === undefined) return;
  if (project.softCap > hard) {
    const minus500 = hard - 5000;
    setFieldValue("softCap", minus500 < 0 ? hard : minus500);
  }
});

const { list: categories, fetchAll } = useCategories();
fetchAll();
const category = computed(() => {
  return categories.value.find(
    (category) => category.uuid === project.categoryUuid
  );
});

const submitForm = handleSubmit(async () => {
  useAlerts().success("Project created");
});
</script>

<template>
  <div class="w-full max-w-5xl mx-auto mb-20">
    <h3 class="py-5 text-3xl">Kickstart your own project</h3>

    <div class="grid grid-cols-12 gap-8">
      <form @submit.prevent="submitForm" class="w-full col-span-8">
        <FormField
          label="What is your projects name?"
          name="title"
          hint="Use a very handy title that people could identify your
                project"
        />

        <FormField
          label="What is your project about?"
          name="description"
          as="textarea"
          hint="Describe with full detail your project so that people
                understand exactly what it is about."
        />

        <AppFileUpload
          label="Upload a cover image for your project"
          bucket="projects"
          @file:uploaded="project.image = $event"
          class="mb-4"
        />

        <FormField
          label="Which category does your project fit in?"
          as="select"
          name="categoryUuid"
          hint="Selecting a fitting category ensures the right people find your project."
        >
          <option disabled selected :value="null">Pick one</option>
          <option
            v-for="category in categories"
            :key="category.uuid"
            :value="category.uuid"
          >
            {{ category.name }}
          </option>
        </FormField>

        <FormField
          label="What is the soft cap of your project?"
          name="softCap"
          type="range"
          min="0"
          max="100000"
          class="range"
          step="5000"
          hint="Soft cap is the minimum amount of money that you need to raise
                in order to start your project."
        >
          <template #label-text-alt>
            <Money :amount="project.softCap" />
          </template>

          <template #after-input>
            <div class="flex justify-between w-full px-2 text-xs">
              <span>|</span>
              <span>|</span>
              <span>|</span>
              <span>|</span>
              <span>|</span>
            </div>
            <div class="flex justify-between w-full px-2 text-xs">
              <span><Money :amount="10000" /></span>
              <span><Money :amount="25000" /></span>
              <span><Money :amount="50000" /></span>
              <span><Money :amount="75000" /></span>
              <span><Money :amount="100000" /></span>
            </div>
          </template>
        </FormField>

        <FormField
          label="What is the hard cap of your project?"
          name="hardCap"
          type="range"
          min="0"
          max="100000"
          class="range"
          step="5000"
          hint="Hard cap is the maximum amount of money that you need to raise
                in order to start your project."
        >
          <template #label-text-alt>
            <Money :amount="project.hardCap" />
          </template>

          <template #after-input>
            <div class="flex justify-between w-full px-2 text-xs">
              <span>|</span>
              <span>|</span>
              <span>|</span>
              <span>|</span>
              <span>|</span>
            </div>
            <div class="flex justify-between w-full px-2 text-xs">
              <span><Money :amount="10000" /></span>
              <span><Money :amount="25000" /></span>
              <span><Money :amount="50000" /></span>
              <span><Money :amount="75000" /></span>
              <span><Money :amount="100000" /></span>
            </div>
          </template>
        </FormField>

        <FormField
          label="When should your project funding start?"
          name="startsAt"
          type="date"
          hint="This is the date that your project will open to start receiving funds."
        />

        <FormField
          label="When should your project funding end?"
          name="finishesAt"
          type="date"
          hint="This is the date that your project will stop receiving funds."
        />

        <button class="w-full btn btn-primary">Publish your project</button>
      </form>
      <div class="col-span-4">
        <div>
          <ClientOnly>
            <ProjectCard
              :project="{
                ...project,
                backers: Math.floor(Math.random() * 1000),
                pledged: 0,
                funded: Math.floor(Math.random() * 10000).toString(),
                finishesAt: project.finishesAt.toString(),
                startsAt: project.startsAt.toString(),
                title: project.title || 'Your title here',
                image: project.image || 'https://placehold.co/500x320',
                excerpt: project.description
                  ? `${project?.description?.substring(0, 130)}...`
                  : 'This is a description of your project. You can change it in the project. You have up to 130 characters to describe your project.',
                categoryUuid: project.categoryUuid,
                createdAt: new Date().toString(),
                lastUpdatedAt: new Date().toString(),
                hardCap: project.hardCap.toString(),
                softCap: project.softCap.toString(),
                uuid: '',
              }"
              :category-name="category?.name ?? 'Some Category'"
            />
          </ClientOnly>
        </div>
      </div>
    </div>
  </div>
</template>