pipeline {
    agent any 
    stages {
        stage('Clone the repo') { 
            steps {
                echo "Clone the repo"
                sh "rm -fr jenkins-test3"
                git branch: 'main', credentialsId: 'test', url: 'https://github.com/mh-lornejad/jenkins-test3.git'
            }
        }
        stage('Test') { 
            steps {
                echo "Test"
                sh "cppcheck ."
                sh "make all"
                sh "cppcheck — enable=all — inconclusive — xml — xml-version=2 graph 2 > cppcheck.xml"
                echo "what is your problem"
            }
        }
        stage('Deploy') { 
            steps {
                echo "Deploy"
            }
        }
    }
}
