import * as firebase from "firebase";

var firebaseConfig = {
    apiKey: "AIzaSyASgDcjbqpCkFNSu-nfqQqJDeA5iZfCxM0",
    authDomain: "meal-web.firebaseapp.com",
    databaseURL: "https://meal-web.firebaseio.com",
    projectId: "meal-web",
    storageBucket: "meal-web.appspot.com",
    messagingSenderId: "320813722206",
    appId: "1:320813722206:web:e41f1364e4f58c597b62cf",
    measurementId: "G-CVLBHS8VHX"
  };
  // Initialize Firebase
  firebase.initializeApp(firebaseConfig);
  firebase.analytics();