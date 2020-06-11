pipeline {
    agent any
    tools {
        maven 'MAVEN_HOME'
        jdk 'JAVA_HOME'
        docker 'docker'
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
