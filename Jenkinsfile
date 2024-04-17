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
                script {
                    def cppFiles = sh(script: 'find . -name "*.cpp"', returnStdout: true).trim().split('\n')
                    
                    for (String cppFile : cppFiles) {
                        sh "clang-tidy $cppFile --"
                    }
                }
            }
        }
        stage('Deploy') { 
            steps {
                echo "Deploy"
            }
        }
    }
   
}
