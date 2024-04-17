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
                    sh "clang-tidy test1.cpp -- -Imy_project/include -DMY_DEFINES ..."
                    for (String cppFile : cppFiles) {
                        sh "clang-tidy $cppFile -- -Imy_project/include -DMY_DEFINES ..."
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
