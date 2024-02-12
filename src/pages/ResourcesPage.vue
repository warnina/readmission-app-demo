<template>
  <q-page class="bg-grey-3 columns">
    <h3 style="padding-top: 20px; padding-left: 20px;">Resources </h3>

   <div class="q-pa-md d-flex justify-center" style="width: 40%;">
    <q-input outlined v-model="searchQuery" placeholder="Search..." @input="filterItems" />
    
    <!-- Your content here, e.g., a list of items -->
    <div v-for="(item, index) in filteredItems" :key="index">{{ item }}</div>
  </div>

  <div class="q-pa-md row items-start q-gutter-md">

    <q-card class="my-card" style="width: 30%;">
      <img src="src/assets/AppleHeart.jpg">
      
      <q-card-section>
        <div class="text-h6">Living with COPD</div>
        <div class="text-subtitle2">Lorem ipsum dolor sit amet consectetur adipisicing elit. Quisquam maiores ipsam harum quis recusandae earum voluptate aspernatur minima quidem quaerat. Totam molestias ut consequatur odio!</div>
      </q-card-section>
    </q-card>


    <q-card class="my-card" style="width: 30%;">
      <img src="src/assets/AppleHeart.jpg">
      
      <q-card-section>
        <div class="text-h6">Living with COPD</div>
        <div class="text-subtitle2">Lorem ipsum dolor sit amet consectetur adipisicing elit. Quisquam maiores ipsam harum quis recusandae earum voluptate aspernatur minima quidem quaerat. Totam molestias ut consequatur odio!</div>
      </q-card-section>
    </q-card>

        <q-card class="my-card" style="width: 30%;">
      <img src="src/assets/AppleHeart.jpg">
      
      <q-card-section>
        <div class="text-h6">Living with COPD</div>
        <div class="text-subtitle2">Lorem ipsum dolor sit amet consectetur adipisicing elit. Quisquam maiores ipsam harum quis recusandae earum voluptate aspernatur minima quidem quaerat. Totam molestias ut consequatur odio!</div>
      </q-card-section>
    </q-card>

        <q-card class="my-card" style="width: 30%;">
      <img src="src/assets/healthyRuns.jpg">
      
      <q-card-section>
        <div class="text-h6">Living with COPD</div>
        <div class="text-subtitle2">Lorem ipsum dolor sit amet consectetur adipisicing elit. Quisquam maiores ipsam harum quis recusandae earum voluptate aspernatur minima quidem quaerat. Totam molestias ut consequatur odio!</div>
      </q-card-section>
    </q-card>

            <q-card class="my-card" style="width: 30%;">
      <img src="src/assets/healthyRuns.jpg">
      
      <q-card-section>
        <div class="text-h6">Living with COPD</div>
        <div class="text-subtitle2">Lorem ipsum dolor sit amet consectetur adipisicing elit. Quisquam maiores ipsam harum quis recusandae earum voluptate aspernatur minima quidem quaerat. Totam molestias ut consequatur odio!</div>
      </q-card-section>
    </q-card>

        <q-card class="my-card" style="width: 30%;">
      <img src="src/assets/healthyRuns.jpg">
      
      <q-card-section>
        <div class="text-h6">Living with COPD</div>
        <div class="text-subtitle2">Lorem ipsum dolor sit amet consectetur adipisicing elit. Quisquam maiores ipsam harum quis recusandae earum voluptate aspernatur minima quidem quaerat. Totam molestias ut consequatur odio!</div>
      </q-card-section>
    </q-card>

    

 

  </div>
  </q-page>
</template>

<script>
import { defineComponent } from 'vue'


export default defineComponent({
  name: 'ResourcesPage'
})
</script>
