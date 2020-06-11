pipeline {
    agent any
    tools {
        maven 'MAVEN_HOME'
        jdk 'JAVA_HOME'
    }
    stages {
        stage ('Initialize') {
            steps {
                sh '''
                    echo "PATH = ${PATH}"
                    echo "M2_HOME = ${M2_HOME}"
                '''
            }
        }

        stage ('Build') {
            steps {
                sh 'mvn clean -Dmaven.test.failure.ignore=true install'
                sh 'cp /Users/bharadwajgandrakota/.jenkins/workspace/project_pipeline/target/sample_project-1.jar sample.jar'
                sh 'git add .'
                sh 'git commit -m "sampleproject"'
                sh 'git push origin HEAD:master'
                '
                
            }
        }
    }
}
