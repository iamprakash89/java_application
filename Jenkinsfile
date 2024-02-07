@Library('my-shared-library') _

pipeline {
    agent any	


   environment {
        MAVEN_HOME = '/opt/apache-maven-3.9.1' // Update with the actual path to Maven
        PATH = "$MAVEN_HOME/bin:$PATH"
    }

    stages {
       

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
           

            steps{
                script{
                    mvnTest()
                }
            }
        }
        stage('Maven Integration Test'){
           
            steps{
                script{
                    mvnintegrationtest()
                }
            }
        }

        stage('Static Code Analysis Sonarqube'){
           
            steps{
                script{
                     staticcodeAnalysis()
                }
            }
        }

    }
}