pipeline {
    agent any
	
    stages {
        stage('GIT CHECKOUT') {
            steps {
                script{
                    gitcheckout(
                        branches: "main"
                        url: "https://github.com/iamprakash89/java_application.git"
                    )
                }
            }
        }
    }
}