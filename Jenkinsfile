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
        stage('Code Analysis') {
            parallel {
                stage('CppCheck') {
                    steps {
                        sleep 3
                        sh 'cppcheck_configs/cpp_check_scripts.sh'
                    }
                }
                stage('Clang Tidy') {
                    steps {
                        sh 'clang_configs/clang_tidy_script.sh'
                    }
                }

                stage('Clang Format') {
                    steps {
                        sh 'clang_configs/clang_format_script.sh'
                    }
                }
            }
        }
        stage('Deploy') { 
            steps {
                sleep 10
                echo "Deploy"
            }
        }
        stage('Cleaning') {
            steps {
                sh "rm -fr jenkins-test3"
            }
        }
    }
}
