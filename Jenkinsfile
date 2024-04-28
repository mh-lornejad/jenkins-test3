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
                stage('Cppcheck') {
                    steps {
                        // Run cppcheck and capture its output in XML format
                        sh 'cppcheck . --enable=all --suppress=missingIncludeSystem --xml --language=c++  -i cppcheck.xml --enable=all --inconclusive --debug --template=gcc 2> cppcheck-result.xml'
                        
                        // Parse cppcheck output and fail the build if errors are found
                        script {
                            def cppcheckOutput = readFile('cppcheck-result.xml')
                            
                            // Check if cppcheck found any errors
                            if (cppcheckOutput.contains('<error ')) {
                                // Print cppcheck output for debugging
                                echo "cppcheck found errors:"
                                echo cppcheckOutput
                                
                                // Fail the Jenkins build
                                error('cppcheck found errors')
                            }
                        }
                    }
                }
                stage('Other Tests') {
                    steps {
                        // Add other tests here
                        echo "Running other tests..."
                    }
                }
                stage('Another Test') {
                    steps {
                        // Add another test here
                        echo "Running another test..."
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
