<template>
  <v-card class="ma-4 fixed-height-card" max-width="300" outlined>
    <v-img :src="series.image" height="180px" class="white--text align-end" gradient="to bottom, rgba(0,0,0,.1), rgba(0,0,0,.7)">
      <v-card-title>{{ series.name }}</v-card-title>
    </v-img>

    <v-card-subtitle :class="['pl-4', 'pt-2', statusClass]">
      <template v-if="series.season !== null && series.season !== 0">
        Season: {{ series.season }}
      </template>
      <template v-else>
        &nbsp; <!-- Non-breaking space to keep an empty line -->
      </template>
    </v-card-subtitle>

    <v-card-text :class="['pl-4', statusClass]">
      {{ truncatedDescription }}
    </v-card-text>

    <v-card-text :class="['pl-4', statusClass]" style="text-align: center; padding-bottom: 0; color: turquoise">
      <h3>{{ series.date }}</h3>
    </v-card-text>

    <v-card-actions :class="[statusClass]">
      <v-btn icon @click="$emit('edit', series.id)">
        <v-icon>mdi-pencil</v-icon>
      </v-btn>
      <v-spacer />
      <v-btn icon @click="$emit('delete', series.id)">
        <v-icon style="color: #e74c3c;">mdi-delete</v-icon>
      </v-btn>
    </v-card-actions>
  </v-card>
</template>

<style scoped>
.status-not-coming {
  background-color: #b03a2e; /* Red */
  color: white;
}

.status-coming-soon {
  background-color: #f1c40f; /* Yellow */
  color: black;
}

.status-out {
  background-color: #2ecc71; /* Green */
  color: white;
}

.status-unknown {
  background-color: #9b59b6; /* Purple */
  color: white;
}

.fixed-height-card {
  height: 450px;
  display: flex;
  flex-direction: column;
}
</style>

<script setup>
import { computed } from 'vue'
import dayjs from 'dayjs'
import customParseFormat from 'dayjs/plugin/customParseFormat'

// How many days before do I want yellow
const daysOfYellow = 7;

dayjs.extend(customParseFormat)

const props = defineProps({
  series: {
    type: Object,
    required: true
  }
})

const truncatedDescription = computed(() => {
  if (!props.series.description) return ''
  if (props.series.description.length > 150) {
    return props.series.description.slice(0, 150) + '...'
  }
  return props.series.description
})

// Status class based on date using dayjs
const statusClass = computed(() => {
  const dateStr = props.series.date
  if (!dateStr || typeof dateStr !== 'string') return 'status-unknown'

  // Parse format d.m.yyyy.
  const date = dayjs(dateStr.trim(), 'D.M.YYYY.', true)
  if (!date.isValid()) return 'status-unknown'

  const now = dayjs()
  const dateWhenYellow = now.add(daysOfYellow, 'day')

  if (date.isBefore(now, 'day') || date.isSame(now, 'day')) {
    return 'status-out'
  } else if (date.isBefore(dateWhenYellow, 'day') || date.isSame(dateWhenYellow, 'day')) {
    return 'status-coming-soon'
  } else if (date.isAfter(dateWhenYellow, 'day')) {
    return 'status-not-coming'
  }

  return 'status-unknown'
})
</script>