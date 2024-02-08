@Library('my-shared-library') _

pipeline {
    agent any	

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
                withSonarQubeEnv('http://23.253.164.236:9000'){
                script{
                    def credentialsId = 'sonarqube'
                     staticcodeAnalysis(credentialsId)
                }
             }
            }
        }

        stage('Quality Gate Status Sonarqube'){
           
            steps{
                script{
                     qualitygatestatus()
                }
            }
        }


    }
}
