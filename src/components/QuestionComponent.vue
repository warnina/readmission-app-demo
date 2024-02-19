<template>
  <div class="box">
    <div class="topbox">
      <div class="text-h4 text-center q-mb-md">{{ question.text }}</div>
    </div>
    <div v-if="question.allowMultiple">
      <div v-for="(response, index) in question.responses" :key="index" class="checkbox-item">
        <input type="checkbox" :id="'response' + index" :value="response" v-model="selectedResponses" />
        <label :for="'response' + index">{{ response.text }}</label>
      </div>
    </div>
    <div v-else>
      <div v-for="(response, index) in question.responses" :key="index" class="radio-item">
        <input type="radio" :id="'response' + index" :value="response" v-model="selectedResponse" />
        <label :for="'response' + index">{{ response.text }}</label>
      </div>
    </div>
    <div class="buttons text-center">
      <button v-if="!isLastQuestion" class="btn" @click="nextQuestion">Next Question</button>
      <button v-if="!isLastQuestion" class="btn" @click="saveForLater">Save for later</button>
      <button v-else class="btn" @click="completeSurvey">Complete Survey</button>
      <button class="btn" @click="previousQuestion">Previous Question</button>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    question: Object,
    isLastQuestion: Boolean
  },
  data() {
    return {
      selectedResponse: null,
      selectedResponses: []
    };
  },
  methods: {
    nextQuestion() {
      this.$emit('next', this.question.allowMultiple ? this.selectedResponses : this.selectedResponse);
      this.selectedResponse = null; // Reset selected response for questions not allowing multiple responses
      this.selectedResponses = []; // Reset selected responses for questions allowing multiple responses
    },
    completeSurvey() {
      console.log("Survey completed");
      // Emit an event to indicate that the survey is completed
      this.$emit('surveyCompleted');
    },
    previousQuestion() {
      this.$emit('previous')
    }
  }
}
</script>

<style scoped>
.question {
  font-size: 18px;
  margin-bottom: 10px;
}

.radio-item {
  margin-bottom: 10px;
  font-size: 25px;
}
  .box {
      border: 2px solid #000;
      background-color: white;
      padding: 20px;
      margin: 0 auto;
      width: fit-content;
      border-radius: 5px;
  }
  .topbox {
      background-color: tan;
      padding: 20px;
      border-radius: 5px;
  }
  .btn {
      margin: 0 10px; /* Add margin between buttons */
      padding: 0px 5px;
      font-size: 15px;
  }
  .buttons {
      margin-top: 20px; /* Add margin to separate buttons from radio buttons */
  }
</style>


