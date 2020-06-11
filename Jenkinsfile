pipeline {
    agent { dockerfile true }
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
                    echo "docker=${docker}"
                '''
            }
        }

        stage('Docker node test') {
      agent {
        docker {
          // Set both label and image
          label 'docker'
          image 'node:7-alpine'
          args '--name docker-node' // list any args
        }
      }
      steps {
        // Steps run in node:7-alpine docker container on docker slave
        sh 'node --version'
      }
    }


        stage('Docker node test') {
               agent {
                 docker {
                   // Set both label and image
                   label 'docker'
                   image '8-jre-alpine'
                   args '--name docker-node' // list any args
                 }
               }
               steps {
                 // Steps run in node:7-alpine docker container on docker slave
                 sh 'node --version'
               }
             }


        stage ('Build') {
            steps {
                sh 'mvn clean -Dmaven.test.failure.ignore=true install'
                sh 'cp /Users/bharadwajgandrakota/.jenkins/workspace/project_pipeline/target/sample_project-1.jar sample.jar'
                sh 'git remote set-url origin git@github.com:bharadwaj1995/helloworld.git'
                sh 'git add .'
                sh 'git commit -m "sampleproject"'
                sh 'git push origin HEAD:master'
            }
        }

        stage ('Push'){
            steps{
//                 sh 'chmod +x image_push.sh'
                sh 'IMAGE="testingoperations"'
                sh 'docker login -u bharadwaj1995 -p R@m@r@m@123'
                sh 'docker tage $IMAGE:sampleprojectmaven bharadwaj1995/$IMAGE:sampleprojectmaven'
                sh 'docker push bharadwaj1995/$IMAGE:sampleprojectmaven'
                sh './image_push.sh'
                sh 'docker-compose up -d'
            }
        }
    }
}
