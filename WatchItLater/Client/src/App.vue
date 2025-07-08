<template>
  <v-app>
    <v-system-bar color="deep-purple accent-4" dark>
      <span>Season Tracker</span>
    </v-system-bar>

    <v-app-bar app color="deep-purple" dark>
      <v-app-bar-title>WatchItLater</v-app-bar-title>
    </v-app-bar>

    <v-main>
      <v-container>
        <router-view />
      </v-container>
    </v-main>
  </v-app>
</template>
