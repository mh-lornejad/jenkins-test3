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
                sh "cppcheck . --force — enable=all — inconclusive — xml — xml-version=2 . 2 > cppcheck.xml"
            }
        }
        stage('Deploy') { 
            steps {
                echo "Deploy"
            }
        }
    }
    post {
        always {
            // scanForIssues tool: cppCheck(pattern: 'cppcheck.xml')
            publishCppcheck(pattern: 'cppcheck.xml')
        }
    }
}
