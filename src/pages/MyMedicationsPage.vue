<template>
  <q-page class="bg-grey-3 columns">
    <h3 style="padding-top: 20px; padding-left: 20px;">My Medications </h3>

    <div class="q-pa-md row items-start q-gutter-md">
    <q-card class="my-card" style="width: 40%;">
      <q-card-section class="bg-primary text-white">
        <div class="text-h6">Medication 1</div>
        <div class="text-subtitle2">100 mg twice daily</div>
      </q-card-section>

      <q-separator />

      <q-card-actions align="right">
        <q-btn flat></q-btn>
        <q-btn flat>View Details</q-btn>
      </q-card-actions>
    </q-card>

    <q-card class="my-card" style="width: 40%;">
      <q-card-section class="bg-purple text-white">
        <div class="text-h6">Medication 2</div>
        <div class="text-subtitle2">100mg once daily</div>
      </q-card-section>

      <q-card-actions vertical align="right">
        <q-btn flat>View Details</q-btn>
      </q-card-actions>
    </q-card>

    <q-card class="my-card" style="width: 40%;">
      <q-card-section class="bg-teal text-white">
        <div class="text-h6">Medication 3</div>
        <div class="text-subtitle2">100mg once daily</div>
      </q-card-section>

      <q-card-actions vertical align="right">
        <q-btn flat @click="naviagateToMedications('/medications')">View Details</q-btn>
      </q-card-actions>
    </q-card>

    <q-card class="my-card" style="width: 40%;">
      <q-card-section class="bg-grey-8 text-white">
        <div class="text-h6">Medication 4</div>
        <div class="text-subtitle2">100mg once daily</div>
      </q-card-section>

     <q-card-actions align="right">
        <q-btn flat>View Details</q-btn>
      </q-card-actions>
    </q-card>
  </div>

  </q-page>
</template>

<script>
import { defineComponent } from 'vue'


export default defineComponent({
  name: 'MyMedicationsPage'
})
</script>
