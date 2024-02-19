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
        <q-btn flat class="black-no-underline">
            <router-link to="/questionnaire" style="color: black; text-decoration: none;">Take Now</router-link>
        </q-btn>
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

    <q-card v-if="NeedToViewMedications" class="my-card" style="width: 25%;">
      <q-card-section class="bg-teal text-white">
        <div class="text-h6">View New Medication</div>
        <div class="text-subtitle2">Spirolactine</div>
      </q-card-section>

      <q-card-actions vertical align="right">
        <q-btn flat class="black-no-underline" @click="handleViewNowClick">
            <router-link to="/medications" style="color: black; text-decoration: none;">View Now</router-link>
        </q-btn>
      </q-card-actions>
    </q-card>

    <q-card v-if="NeedToConfirmAppointment" class="my-card" style="width: 25%;">
      <q-card-section class="bg-grey-8 text-white">
        <div class="text-h6">Confirm Upcoming Appointment</div>
        <div class="text-subtitle2">Date: 2/14/2024</div>
      </q-card-section>

     <q-card-actions align="right">
        <q-btn flat @click="showApptModal = true">Confirm Appointment</q-btn>
        <q-btn flat>View Details</q-btn>
      </q-card-actions>
    </q-card>

    
    <!-- Modal component -->
    <q-modal v-if="showApptModal" no-backdrop @hide="resetApptModal" class="Appt-modal">
      <button class="close-btn" @click="closeModal">x</button>
      <q-card class="my-modal-card">
        <q-card-section>
          <div class="Appt-Header">Appointment Details</div>
          <div class="Appt-Details">Date: 2/14/2024 2:15pm</div>
          <div class="Appt-Details">Address: 123 Address Rd Cleveland OH 43201</div>
          <div class="Appt-Details">Clinician: Dr. McDoctor</div>
        </q-card-section>
        <q-card-actions align="center">
          <q-btn class="button" flat @click="confirmAppointment">Confirm Appointment</q-btn>
          <q-btn class="button" flat @click="cancelAppointment">Request Appointment Cancellation</q-btn>
        </q-card-actions>
      </q-card>
    </q-modal>

    <!-- Modal Confirmation -->
    <q-modal v-if="showConfirmation" no-backdrop @hide="resetApptModal" class="Appt-modal">
      <button class="close-btn" @click="closeModal">x</button>
      <q-card class="my-modal-card">
        <q-card-section>
          <div align="center" style="padding:10px; font-weight:bold; font-size:28px;">
            Appointment Confirmed
          </div>
          <div style="font-weight:bold; font-size:16px;">Details:</div>
          <div class="Appt-Details">Date: 2/14/2024 2:15pm</div>
          <div class="Appt-Details">Address: 123 Address Rd Cleveland OH 43201</div>
          <div class="Appt-Details">Clinician: Dr. McDoctor</div>
          <div align="center" style="padding:10px; font-weight:bold;">
            Thank you for confirming your appointment. If you need to cancel your appointment please call (555) 555-5555
          </div>
        </q-card-section>
      </q-card>
    </q-modal>

    <!-- Modal Cancellation -->
    <q-modal v-if="showCancellation" no-backdrop @hide="resetApptModal" class="Appt-modal">
      <button class="close-btn" @click="closeModal">x</button>
      <q-card class="my-modal-card">
        <q-card-section>
          <div align="center" style="padding:10px; font-weight:bold; font-size:28px;">
            Appointment Cancellation Requested
          </div>
          <div align="center" style="padding:10px; font-weight:bold;">
            Please note your appointment has not been fully cancelled. You should receive a call in the next 48 hours to confirm cancellation.
            For questions or to un-request the cancellation please call (555) 555-5555.
          </div>
        </q-card-section>
      </q-card>
    </q-modal>

  </div>
  </q-page>
</template>

<script>
import { defineComponent } from 'vue'


export default defineComponent({
  name: 'TasksPage',
  data() {
    return {
      showApptModal: false,
      showConfirmation: false,
      showCancellation: false,
      NeedToConfirmAppointment: true,
      NeedToViewMedications: true
    };
  },

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
    },
    confirmAppointment() {
      // Logic to confirm the appointment
      console.log('Appointment confirmed');
      // You can add more logic here, such as closing the modal or navigating to another page
      this.showApptModal = false;
      this.showConfirmation = true;
      this.NeedToConfirmAppointment = false;
    },
    cancelAppointment() {
      // Logic to confirm the appointment
      console.log('Appointment Cancellation Requested');
      // You can add more logic here, such as closing the modal or navigating to another page
      this.showApptModal = false;
      this.showCancellation = true;
      this.NeedToConfirmAppointment = false;
    },
    closeModal() {
      // Logic to go back or cancel the appointment
      console.log('Go back');
      // You can add more logic here, such as closing the modal or navigating to another page
      this.showApptModal = false;
      this.showConfirmation = false;
      this.showCancellation = false;
    },
    resetApptModal() {
      // Reset modal state when it is closed
      this.showApptModal = false;
    },
    handleViewNowClick() {
      this.NeedToViewMedications = false;
      console.log('Viewed Medication');

      
    }

  }
})
</script>

<style>
  .Appt-modal {
    width: 50%;
    height: 100%;
    margin: auto;
    position: fixed;
    top: 10%;
    left: 20%;
    z-index: 100; /* Adjust z-index as needed */
  }

  .Appt-Details {
    font-size: 16px
  }
  .button {
    border: 1px solid #000; /* Border style */
    border-radius: 5px; /* Rounded corners (adjust as needed) */
    padding: 8px 16px; /* Padding around the text (adjust as needed) */
    background-color: #f0f0f0; /* Light gray background color */
  }
  .close-btn {
  position: absolute;
  top: 10px;
  right: 10px;
  background-color: transparent;
  border: none;
  font-size: 20;
  cursor: pointer;
  z-index: 1000;
}


</style>