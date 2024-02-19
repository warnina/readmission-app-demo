<template>
    <q-page class="bg-grey-3 columns" style="margin-top: 0;">
        <div v-if="!surveyInProgress" class="finish">
            <div class="blue-box">
                <p class="centered-text">Thanks for completing the survey!</p>
            </div>
        </div>
        <div v-else>
            <div class="text-h4 text-center q-mb-md" >
                <QuestionComponent 
                    :question="currentQuestion" 
                    :is-last-question="isLastQuestion"
                    @response="handleResponse" 
                    @previous="previousQuestion"
                    @next="nextQuestion"
                    @surveyCompleted="completeSurvey"/>
                <div class="q-pa-md">
                    <q-linear-progress rounded size="15px" :value="progress" color="secondary" class="q-mt-sm" />
                </div>
            </div>
        </div>
    </q-page>
</template>

<script>
import QuestionComponent from 'src/components/QuestionComponent.vue';
import { defineComponent } from 'vue'
export default {
  components: {
    QuestionComponent,
  },
  data() {
    return {
      previousIndex: 0,
      surveyInProgress: true,
      questions: [
        {
          text: "How do you rate your overall health since leaving the hospital?",
          responses: [
            { text: "Poor", nextQuestionIndex: 1 },
            { text: "Fair", nextQuestionIndex: 1 },
            { text: "Good", nextQuestionIndex: 1 },
            { text: "Very Good", nextQuestionIndex: 1 },
            { text: "Excellent", nextQuestionIndex: 1 }
          ]
        },
        {
          text: "Have you filled any new prescriptions",
          responses: [
            { text: "Yes", nextQuestionIndex: 3 },
            { text: "No", nextQuestionIndex: 2 }
          ]
        },
        {
          text: "Why?",
          responses: [
            { text: "No transportation to get medications", nextQuestionIndex: 3 },
            { text: "Not enough money for medications", nextQuestionIndex: 3 },
            { text: "Other", nextQuestionIndex: 3 }
          ]
        },
        {
          text: "Are you taking your medications as instructed by the doctor?",
          responses: [
            { text: "Yes", nextQuestionIndex: 5 },
            { text: "No", nextQuestionIndex: 4 }
          ]
        },
        {
          text: "What problems have you been having taking the medications?",
          responses: [
            { text: "I do not understand how to take the medication(s)", nextQuestionIndex: 5 },
            { text: "Medications are causing new problems", nextQuestionIndex: 5 },
            { text: "I do not have the medication(s)", nextQuestionIndex: 5 },
            { text: "Other", nextQuestionIndex: 5 }
          ]
        },
        {
          text: "Do you have any new or worsening health problems since leaving the hospital? ",
          allowMultiple: true,
          responses: [
            { text: "Shortness of breath", nextQuestionIndex: 6 },
            { text: "Chest Pain" , nextQuestionIndex: 6 },
            { text: "Cough" , nextQuestionIndex: 6 },
            { text: "Fever" , nextQuestionIndex: 6 },
            { text: "Nausea" , nextQuestionIndex: 6 },
            { text: "Chills" , nextQuestionIndex: 6 },
            { text: "Headache" , nextQuestionIndex: 6 },
            { text: "Abdominal Pain" , nextQuestionIndex: 6 },
            { text: "Pain or Swelling in limbs" , nextQuestionIndex: 6 },
            { text: "Anxiety" , nextQuestionIndex: 6 },
            { text: "Depression" , nextQuestionIndex: 6 },
            { text: "Other" , nextQuestionIndex: 6 },
            { text: "None" , nextQuestionIndex: 6 }
          ]
        },
        {
          text: "Do you have follow-up appointments scheduled with your doctor or nurse/nurse practitioner?",
          responses: [
            { text: "Yes", nextQuestionIndex: 7 },
            { text: "No", nextQuestionIndex: 9 }
          ]
        },
        {
          text: "Are you able to attend the appointment?",
          responses: [
            { text: "Yes", nextQuestionIndex: 9 },
            { text: "No", nextQuestionIndex: 8 }
          ]
        },
        {
          text: "Why?",
          allowMultiple: true,
          responses: [
            { text: "I do not have transportation", nextQuestionIndex: 9 },
            { text: "I do not understand the reason for appointment", nextQuestionIndex: 9 },
            { text: "The appointment is at the same time as another engagement", nextQuestionIndex: 9 },
            { text: "Other", nextQuestionIndex: 9 }
          ]
        },
        {
          text: "Are you able to safely walk or move about with or without help?",
          responses: [
            { text: "Yes", nextQuestionIndex: 10 },
            { text: "No", nextQuestionIndex: 10 }
          ]
        },
        {
          text: "Are you able to follow the dietary recommendations given in the hospital?",
          responses: [
            { text: "Yes", nextQuestionIndex: 12 },
            { text: "No", nextQuestionIndex: 11 }
          ]
        },
        {
          text: "Why?",
          allowMultiple: true,
          responses: [
            { text: "I do not have the recommended food", nextQuestionIndex: 12 },
            { text: "I cannot afford the recommended food", nextQuestionIndex: 12 },
            { text: "I do not know how to prepare the recommended food", nextQuestionIndex: 12 },
            { text: "Other", nextQuestionIndex: 12 }
          ]
        },
        {
          text: "Do you feel safe to move about at home?",
          responses: [
            { text: "Yes", nextQuestionIndex: 14 },
            { text: "No", nextQuestionIndex: 13 }
          ]
        },
        {
          text: "Why?",
          allowMultiple: true,
          responses: [
            { text: "I need help to move", nextQuestionIndex: 14 },
            { text: "I am afraid of falling", nextQuestionIndex: 14 },
            { text: "Other", nextQuestionIndex: 14 }
          ]
        },
        {
          text: "Do you feel you are able to get better at home?",
          responses: [
            { text: "Yes", nextQuestionIndex: 16 },
            { text: "No", nextQuestionIndex: 15 }
          ]
        },
        {
          text: "Why?",
          allowMultiple: true,
          responses: [
            { text: "I do not have my own home", nextQuestionIndex: 16 },
            { text: "I do not have the help I need to recover", nextQuestionIndex: 16 },
            { text: "Other", nextQuestionIndex: 16 }
          ]
        },
        {
          text: "Do you have enough support from family and friends to get better? ",
          responses: [
            { text: "Yes", nextQuestionIndex: 18 },
            { text: "No", nextQuestionIndex: 17 }
          ]
        },
        {
          text: "Why?",
          responses: [
            { text: "I have no family or friends to help me", nextQuestionIndex: 18 },
            { text: "I have some support from family and friends but it is not enough", nextQuestionIndex: 18 },
            { text: "Other", nextQuestionIndex: 18 }
          ]
        },  
        {
          text: "Are you able to take care of your own personal hygiene? ",
          responses: [
            { text: "Yes", nextQuestionIndex: -1 },
            { text: "No", nextQuestionIndex: -1 }
          ]
        },      
      ],
      currentQuestionIndex: 0
    };
  },
  computed: {
    currentQuestion() {
      return this.questions[this.currentQuestionIndex];
    },
    totalQuestions() {
        return this.questions.length;
    },
     progress() {
      // Calculate progress as a percentage
      return ((this.currentQuestionIndex) / this.totalQuestions) ;
    },
  },
  methods: {
    handleResponse(response) {

    },
    nextQuestion(next) {
        console.log(next);
        console.log(this.progress);
        console.log(this.previousIndex);
        console.log(Array.isArray(next))
        if (Array.isArray(next)) {
            const firstResponse = next[0];
            console.log('here')
            console.log(next[0])
            console.log(firstResponse)
            console.log(firstResponse.nextQuestionIndex);
            this.previousIndex = this.currentQuestionIndex;
            this.currentQuestionIndex = next[0].nextQuestionIndex; // Move to the next question
        } else {
            console.log(next.nextQuestionIndex);
            this.previousIndex = this.currentQuestionIndex;
            this.currentQuestionIndex = next.nextQuestionIndex; // Move to the next question
        }
        this.isLastQuestion = this.currentQuestionIndex === this.questions.length - 1;
        
    },
    previousQuestion() {
        this.currentQuestionIndex = this.previousIndex;
    },
    completeSurvey() {
        this.surveyInProgress = false;
    }
  }
};
</script>

<style>
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
    .q-gutter-sm {
        display: flex;
        flex-direction: column; /* Stack items vertically */
        align-items: center; /* Center items horizontally */
    }
    .radio-item {
        margin-bottom: 10px; /* Add margin between radio buttons */
    }
    .buttons {
        margin-top: 20px; /* Add margin to separate buttons from radio buttons */
    }
    .btn {
        margin: 0 10px; /* Add margin between buttons */
    }
    .finish {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh; /* Ensure the box takes up the full height of the viewport */
    }

    .blue-box {
    background-color: blue;
    padding: 20px;
    border-radius: 10px;
    }

    .centered-text {
    text-align: center;
    color: white;
    font-size: 24px;
    }
</style>
