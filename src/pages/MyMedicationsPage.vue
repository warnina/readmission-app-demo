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

     <q-card-actions vertical align="right">
        <q-btn flat @click="ShowMedications('Medication 1')">View Details</q-btn>
      </q-card-actions>
    </q-card>

    <q-card class="my-card" style="width: 40%;">
      <q-card-section class="bg-purple text-white">
        <div class="text-h6">Medication 2</div>
        <div class="text-subtitle2">100mg once daily</div>
      </q-card-section>

      <q-card-actions vertical align="right">
        <q-btn flat @click="ShowMedications('Medication 2')">View Details</q-btn>
      </q-card-actions>
    </q-card>

    <q-card class="my-card" style="width: 40%;">
      <q-card-section class="bg-teal text-white">
        <div class="text-h6">Medication 3</div>
        <div class="text-subtitle2">100mg once daily</div>
      </q-card-section>

      <q-card-actions vertical align="right">
        <q-btn flat @click="ShowMedications('Medication 3')">View Details</q-btn>
      </q-card-actions>
    </q-card>

    <q-card class="my-card" style="width: 40%;">
      <q-card-section class="bg-grey-8 text-white">
        <div class="text-h6">Medication 4</div>
        <div class="text-subtitle2">100mg once daily</div>
      </q-card-section>

      <q-card-actions vertical align="right">
        <q-btn flat @click="ShowMedications('Medication 4')">View Details</q-btn>
      </q-card-actions>
    </q-card>
  
    <!-- View Medication Details -->
    <q-modal v-if="viewMedication" no-backdrop @hide="resetApptModal" class="Appt-modal">
      <button class="close-btn" @click="closeModal">x</button>
      <q-card class="my-modal-card">
        <q-card-section>
          <div align="center" style="padding:10px; font-weight:bold; font-size:28px;">
            {{ selectMedicationNumber }}
          </div>
          <div style="font-weight:bold; font-size:16px;">Details:</div>
          <div class="Appt-Details">Quantity: 100mg</div>
          <div class="Appt-Details">When: Twice Daily</div>
          <div class="Appt-Details">Clinical Prescriber: Dr. McDoctor</div>
          <div class="Appt-Details">Pharmacy: 123 Medicine St. Cleveland OH, 43201</div>
          <div class="Appt-Details">Purpose: Life, Liberty, and the pursuit of happiness</div>
          <div class="Appt-Details">Side-Effects: Bad Vibes and less rizz</div>
        </q-card-section>
      </q-card>
    </q-modal>

  </div>
  </q-page>
</template>

<script>
import { defineComponent } from 'vue'


export default defineComponent({
  name: 'MyMedicationsPage',
  data() {
    return{
      viewMedication: false,
      selectMedicationNumber: ''
    };
  },

  methods: {
    ShowMedications(medicationNumber) {
      this.selectMedicationNumber = medicationNumber
      this.viewMedication = true;
      console.log("viewingMedication")
    },
    closeModal() {
      // Logic to go back or cancel the appointment
      console.log('Go back');
      // You can add more logic here, such as closing the modal or navigating to another page
      this.viewMedication= false;
    }

  }
})
</script>

<style>
  .Appt-modal {
    width: 50%;
    height: 100%;
    /* margin: auto; */
    /* position: fixed; */
    top: 20%;
    left: 20%;
    z-index: 100; /* Adjust z-index as needed */
  }
</style>

