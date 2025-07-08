<template> 
  <v-container>
    <v-card>
      <v-card-title>
        Series List
        <v-row class="flex-nowrap pa-4" align="center">
          <v-btn color="primary" @click="$router.push('/AddSeries')">Add New Series</v-btn>
          <v-spacer />
          <v-btn color="primary" @click="$router.push('/')">Main Menu</v-btn>
        </v-row>
      </v-card-title>

      <v-row class="mx-4 my-2" align="center">
        <v-col cols="12" sm="6" md="6" lg="4">
          <v-text-field
            v-model="search"
            label="Search series"
            clearable
            @click:clear="handleClearSearch"
          />
        </v-col>
        <v-col cols="12" sm="6" md="6" lg="4">
          <v-select
            v-model="selectedType"
            :items="types"
            label="Filter by Type"
            clearable
          />
        </v-col>
      </v-row>

      <v-row>
        <v-col
          v-for="serie in paginatedSeries"
          :key="serie.id"
          cols="12"
          sm="6"
          md="4"
          lg="3"
        >
          <Show
            :series="serie"
            @edit="handleEdit"
            @delete="handleDelete"
          />
        </v-col>
      </v-row>

      <!-- Pagination control -->
      <v-row justify="center" class="my-4">
        <v-pagination
          v-model="currentPage"
          :length="Math.ceil(filteredSeries.length / itemsPerPage)"
          color="primary"
          :total-visible="5"
        />
      </v-row>
    </v-card>
  </v-container>
</template>

<script setup>
import { useRouter } from 'vue-router'
import { ref, computed, onMounted, watch } from 'vue'
import axios from 'axios'
import Show from '@/components/Show.vue'

const router = useRouter()
const series = ref([])
const search = ref('')
const selectedType = ref('')
const types = ref([])

const handleClearSearch = async () => {
  search.value = ''
  await fetchSeries()
}

// Pagination
const currentPage = ref(1)
const itemsPerPage = 8 // Number of items per page

// Fetch data
const fetchSeries = async () => {
  try {
    const response = await axios.get('http://localhost:4000/watchitlater/all')
    series.value = response.data
    
    // Extract unique types for filter
    const uniqueTypes = [...new Set(series.value.map(s => s.type))]
    types.value = uniqueTypes
  } catch (error) {
    console.error('Error fetching series:', error)
  }
}

onMounted(fetchSeries)

// Filtering by search and type
const filteredSeries = computed(() => {
  return series.value.filter(s => {
    const matchesSearch = s.name.toLowerCase().includes(search.value.toLowerCase())
    const matchesType = selectedType.value ? s.type === selectedType.value : true
    return matchesSearch && matchesType
  })
})

// Reset pagination when search or type filter changes
watch([search, selectedType], () => {
  currentPage.value = 1
})

// Pagination logic
const paginatedSeries = computed(() => {
  const start = (currentPage.value - 1) * itemsPerPage
  const end = start + itemsPerPage
  return filteredSeries.value.slice(start, end)
})

// Handlers for edit and delete
const handleEdit = (id) => {
  router.push(`/${id}`)
}

const handleDelete = async (id) => {
  try {
    await axios.delete(`http://localhost:4000/watchitlater/delete/${id}`)
    await fetchSeries()
  } catch (err) {
    console.error('Error deleting item:', err)
  }
}
</script>