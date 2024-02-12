<template>
  <q-page class="bg-grey-3 columns">
     <h3 class="text-Left" style="padding-top: 20px; padding-left: 20px;">My Tasks </h3>

  <div class="q-pa-md row items-start q-gutter-md">
    <q-card class="my-card" style="width: 25%;">
      <q-card-section class="bg-primary text-white">
        <div class="text-h6">Daily Questionnaire</div>
        <div class="text-subtitle2">2/9/2024</div>
      </q-card-section>

      <q-separator />

      <q-card-actions align="right">
        <q-btn flat></q-btn>
        <q-btn flat>Take Now</q-btn>
      </q-card-actions>
    </q-card>

    <q-card class="my-card" style="width: 25%;">
      <q-card-section class="bg-purple text-white">
        <div class="text-h6">Weekly Questionnaire</div>
        <div class="text-subtitle2">Week of 2/5/2024</div>
      </q-card-section>

      <q-card-actions vertical align="right">
        <q-btn flat>Resume</q-btn>
      </q-card-actions>
    </q-card>

    <q-card class="my-card" style="width: 25%;">
      <q-card-section class="bg-teal text-white">
        <div class="text-h6">View New Medication</div>
        <div class="text-subtitle2">Spirolactine</div>
      </q-card-section>

      <q-card-actions vertical align="right">
        <q-btn flat @click="naviagateToMedications('/medications')">View Now</q-btn>
      </q-card-actions>
    </q-card>

    <q-card class="my-card" style="width: 25%;">
      <q-card-section class="bg-grey-8 text-white">
        <div class="text-h6">Confirm Upcoming Appointment</div>
        <div class="text-subtitle2">Date: 2/14/2024</div>
      </q-card-section>

     <q-card-actions align="right">
        <q-btn flat>Confirm Appointment</q-btn>
        <q-btn flat>View Details</q-btn>
      </q-card-actions>
    </q-card>
  </div>
  </q-page>
</template>

<script>
import { defineComponent } from 'vue'


export default defineComponent({
  name: 'TasksPage',
  methods: {
    routeClick: function (page) {
      this.$router.push(page).catch(err => {
        // Ignore the vuex err regarding  navigating to the page they are already on.
        if (
          err.name !== 'NavigationDuplicated' &&
          !err.message.includes('Avoided redundant navigation to current location')
        ) {
          // But print any other errors to the console
          console.log('Routing error: ' + err)
        }
      })
    }
  }
})
</script>
