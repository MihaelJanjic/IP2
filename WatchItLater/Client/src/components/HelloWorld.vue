<template>
  <v-container class="fill-height" max-width="900">
    <div>
      <v-img
        class="mb-4"
        height="150"
        src="@/assets/logo.png"
      />

      <div class="mb-8 text-center">
        <div class="text-body-2 font-weight-light mb-n1">Welcome to</div>
        <h1 class="text-h2 font-weight-bold">WatchItLater</h1>
      </div>

      <v-row>
        <v-col cols="12">
          <v-card
            href="http://localhost:3000/SeriesList"
            class="py-4"
            color="surface-variant"
            image="https://cdn.vuetifyjs.com/docs/images/one/create/feature.png"
            prepend-icon="mdi-rocket-launch-outline"
            rounded="lg"
            variant="tonal"
          >
            <template #image>
              <v-img position="top right" />
            </template>

            <template #title>
              <h2 class="text-h5 font-weight-bold">
                Get started
              </h2>
            </template>

            <template #subtitle>
              <div class="text-subtitle-1">
                Check up on your favorite shows with WatchItLater.
              </div>
            </template>
          </v-card>
        </v-col>

        <v-col cols="12" >
          <v-card elevation="2" class="pa-5">
          
            <h1 class="text-h4 font-weight-bold">WatchItLater</h1>
            <p class="text-subtitle-1 mt-3" style="text-align: left;">
              Check up on your favorite Shows, Movies, Games and others with WatchItLater. <br>
              &#9679 See when the new seasons are coming out. <br>
              &#9679 Check if your favorite movie sequel is out already. <br>
              &#9679 Get ready to play your best upcoming games with WatchItLater. <br>
            </p><br><br>

            <h2>Instructions</h2>
            <div style="text-align: left;">
              1. Press "Get Started".<br>
              2. Browse through existing items.<br>
              3. Add new Shows.<br>
              4. Fill out the form.<br>
              5. Enjoy.<br>
            </div>
          </v-card>
        </v-col>

        <v-col v-for="link in links" :key="link.href" cols="6">
          <v-card
            append-icon="mdi-open-in-new"
            class="py-4"
            color="surface-variant"
            :href="link.href"
            :prepend-icon="link.icon"
            rel="noopener noreferrer"
            rounded="lg"
            :subtitle="link.subtitle"
            :title="link.title"
            variant="tonal"
          />
        </v-col>
      </v-row>
    </div>
  </v-container>
</template>


<script setup>
  const links = [
    /*{
      href: 'https://vuetifyjs.com/components/all',
      icon: 'mdi-widgets-outline',
      subtitle: 'Change settings for WatchItLater.',
      title: 'Settings',
    },*/
  ]
</script>
