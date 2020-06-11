#!/usr/bin/groovy

pipeline {
  agent any
  stages {
    stage ('Build') {
      steps {
        sh 'mvn -version'
        sh 'mvn clean install -DskipTests=true'
        echo 'myproject'
      }
    }
  }
}
