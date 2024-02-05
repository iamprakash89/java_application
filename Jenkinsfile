@Library('my-shared-library') _

pipeline {
    agent any	
    tools{
        mvn 'M2_HOME'
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
    }
}