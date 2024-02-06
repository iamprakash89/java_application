@Library('my-shared-library') _

pipeline {
    agent any	

    parameters{
        choice(name: 'action', choices: 'create\ndelete', description: 'Choose create/Destroy')
    }

   environment {
        MAVEN_HOME = '/opt/apache-maven-3.9.1' // Update with the actual path to Maven
        PATH = "$MAVEN_HOME/bin:$PATH"
    }

    stages {
        when { expression { param.action == 'create' } }

        stage('GIT CHECKOUT') {
            steps {
                script{
                    gitcheckout(
                        branch: "main",
                        url: "https://github.com/iamprakash89/java_application.git"
                    )
                }
            }
        }
        stage('Unit Test maven'){
            when { expression { param.action == 'create' } }

            steps{
                script{
                    mvnTest()
                }
            }
        }
        stage('Maven Integration Test'){
            when { expression { param.action == 'create' } }

            steps{
                script{
                    mvnintegrationtest()
                }
            }
        }
        stage('staic code Analysis'){
            when { expression { param.action == 'create'}}

            steps{
                script{
                    staticcodeAnalysis()
                }
            }
        }
    }
}