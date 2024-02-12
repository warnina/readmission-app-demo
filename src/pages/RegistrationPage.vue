<template>
  <q-page class="bg-grey-3 columns">
    <h3 class="text-center" style="padding-top: 20px;">Registration </h3>

  <div class="q-gutter-md d-flex justify-center items-center" style="max-width: 400px; margin: auto;">

    <q-form
      @submit="onSubmit"
      @reset="onReset"
      class="q-gutter-md"
    >
      <q-input
        filled
        v-model="name"
        label="Your name *"
        hint="Name and surname"
        lazy-rules
        :rules="[ val => val && val.length > 0 || 'Please type something']"
      />

      <q-input
        filled
        v-model="name"
        label="Birth Date *"
        hint="Format: mm/dd/yyy"
        lazy-rules
        :rules="[ val => val && val.length > 0 || 'Please type something']"
      />

      <q-input
        filled
        v-model="something"
        label="Something else *"
        hint="idk what all we need"
        lazy-rules
        :rules="[ val => val && val.length > 0 || 'Please type something']"
        
      />

      <q-input
        filled
        v-model="something"
        label="Registration User Name *"
        hint="Should be 8 characters starting with CCHS"
        lazy-rules
        :rules="[ val => val && val.length > 0 || 'Please type something']"
      />

      <q-input
        filled
        v-model="something"
        label="Registration Password *"
        hint="Should be 15 characters"
        lazy-rules
        :rules="[ val => val && val.length > 0 || 'Please type something']"
      />

      <q-toggle v-model="accept" label="I accept the license and terms" />

      <div>
        <q-btn label="Submit" type="submit" color="primary"/>
        <q-btn label="Reset" type="reset" color="primary" flat class="q-ml-sm" />
      </div>
    </q-form>

  </div>
  </q-page>
</template>

<script>
import { defineComponent } from 'vue'


export default defineComponent({
  name: 'RegistrationPage',
  data() {
    return {
      firstName: '',
      lastName: '',
      birthday: ''
    };
  }
})
</script>

