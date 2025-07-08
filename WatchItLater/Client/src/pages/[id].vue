<template>
  <v-container>
    <v-alert v-if="loading" type="info">Loading series data...</v-alert>
    <SeriesForm
      v-else
      :series="series"
      @success="goBack"
    />
  </v-container>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import axios from 'axios'
import SeriesForm from '@/components/SeriesForm.vue'

const route = useRoute()
const router = useRouter()
const series = ref(null)
const loading = ref(true)

onMounted(async () => {
  try {
    const id = route.params.id
    const res = await axios.get(`http://localhost:4000/watchitlater/${id}`)
    series.value = res.data
  } catch (err) {
    console.error('Failed to load series', err)
  } finally {
    loading.value = false
  }
})

const goBack = () => {
  router.push('/SeriesList')
}
</script>