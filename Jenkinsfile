#!/usr/bin/groovy

pipeline {
  agent any
  stages {
    stage ('Build') {
      steps {
        sh 'mvn clean install -DskipTests=true'
        /echo 'myproject'/
      }
    }
  }
}
