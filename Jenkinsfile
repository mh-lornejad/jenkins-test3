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
            parallel {
                stage('Cpp-Check') {
                    steps {
                        sleep 10
                        sh 'cppcheck_configs/cpp_check_scripts.sh'
                    }
                }
                stage('Clang-Tidy') {
                    steps {
                        sleep 10
                        sh 'clang_configs/clang_tidy_script.sh'
                    }
                }

                stage('Clang-Format') {
                    steps {
                        sleep 10
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
    }
}
