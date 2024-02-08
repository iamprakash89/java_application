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
    }
}