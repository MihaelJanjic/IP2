<template>
  <v-container>
    <SeriesForm @success="goBack" />
  </v-container>
</template>

<script setup>
import { useRouter } from 'vue-router'
import SeriesForm from '@/components/SeriesForm.vue'

const router = useRouter()

const goBack = () => {
  router.push('/SeriesList')
}
</script>