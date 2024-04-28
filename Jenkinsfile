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
                        sleep 10
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
                stage('Clang-Tidy') {
                    steps {
                        // Find all C++ files in the project directory and its subdirectories
                        script {
                            def files = sh(script: 'find . -name "*.cpp"', returnStdout: true).trim().split('\n')
                            for (def file in files) {
                                echo "Running clang-tidy for file: $file"
                                def clangTidyOutput = sh(script: "clang-tidy $file -- -I/usr/include/c++/11 -I/usr/include/x86_64-linux-gnu/c++/11 -L /usr/lib/gcc/x86_64-linux-gnu/11  -DMY_DEFINES ...", returnStdout: true).trim()
                                if (clangTidyOutput.contains('warning:')) {
                                    echo "clang-tidy found warnings in file: $file"
                                    echo clangTidyOutput
                                    error('clang-tidy found warnings')
                                }
                            }
                        }
                    }
                }


                stage('Another Test') {
                    steps {
                        sleep 10
                        // Add another test here
                        echo "Running another test..."
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
