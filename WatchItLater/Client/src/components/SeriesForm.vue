<template>
  <v-container>
    <v-card class="pa-5" max-width="600" outlined>
      <v-card-title>{{ isEdit ? 'Edit Series' : 'Add New Series' }}</v-card-title>

      <v-form ref="form" v-model="valid" lazy-validation>
        <v-select
          v-model="localSeries.type"
          :items="types"
          label="Type"
          :rules="[required]"
          required
          clearable
        />
        <v-text-field v-model="localSeries.name" label="Name" :rules="[required]" required />
        <v-text-field v-model="localSeries.season" label="Season" type="number" />
        <v-text-field v-model="localSeries.date" label="Release Date" type="string" />
        <v-textarea v-model="localSeries.description" label="Description" />
        <v-text-field v-model="localSeries.image" label="Image URL" />

        <v-btn color="primary" :disabled="!valid || loading" :loading="loading" @click="submitForm" class="mt-4">
          {{ isEdit ? 'Save Changes' : 'Add Series' }}
        </v-btn>
      </v-form>

      <v-alert v-if="alert.show" :type="alert.type" class="mt-4" dense outlined>
        {{ alert.message }}
      </v-alert>
    </v-card>
  </v-container>
</template>

<script setup>
import { ref, watch, computed } from 'vue'
import axios from 'axios'

// Define props
const props = defineProps({
  series: {
    type: Object,
    default: null
  }
})

const emit = defineEmits(['success'])

const form = ref(null)
const valid = ref(false)
const loading = ref(false)

const localSeries = ref({
  type: '',
  name: '',
  season: '',
  date: '',
  description: '',
  image: ''
})

// Types dropdown options
const types = ['Movie', 'Show', 'Anime', 'Game', 'Book', 'Other']

// Copy props.series into localSeries when props.series changes
watch(() => props.series, (newVal) => {
  if (newVal) {
    localSeries.value = { ...newVal }
  }
}, { immediate: true })

const required = v => !!v || 'This field is required'

// Computed to check if edit mode or add mode
const isEdit = computed(() => !!props.series?.id)

const alert = ref({ show: false, message: '', type: 'success' })

const submitForm = async () => {
  if (!valid.value) return
  loading.value = true

  try {
    if (isEdit.value) {
      // Edit mode: PUT request
      await axios.put(`http://localhost:4000/watchitlater/edit/${props.series.id}`, localSeries.value)
      alert.value = { show: true, message: 'Series updated successfully!', type: 'success' }
    } else {
      // Add mode: POST request
      await axios.post('http://localhost:4000/watchitlater/add', localSeries.value)
      alert.value = { show: true, message: 'Series added successfully!', type: 'success' }
      // Reset form after adding new
      localSeries.value = { type: '', name: '', season: '', date: '', description: '', image: '' }
      form.value?.resetValidation()
    }

    emit('success')
  } catch (error) {
    console.error(error)
    alert.value = { show: true, message: 'Failed to submit series.', type: 'error' }
  } finally {
    loading.value = false
  }
}
</script>