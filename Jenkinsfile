pipeline {
    agent any 
    stages {
        stage('Clone the repo') { 
            steps {
                echo "Clone the repo"
                sh "rm -fr jenkins-test2"
                sh "git clone https://github.com/mh-lornejad/jenkins-test2.git"
            }
        }
        stage('Test') { 
            steps {
                echo "Test"
                sh "ls"
            }
        }
        stage('Deploy') { 
            steps {
                echo "Deploy"
            }
        }
    }
}
