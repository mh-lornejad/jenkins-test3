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
                sh label: '', returnStatus: true, script: 'cppcheck . --xml --language=c++ --enable=all --inconclusive --debug --template=gcc  2> cppcheck-result.xml'
                publishCppcheck allowNoReport: true, ignoreBlankFiles: true, pattern: '**/cppcheck-result.xml'
            }
        }
        stage('Deploy') { 
            steps {
                echo "Deploy"
            }
        }
    }
   
}
