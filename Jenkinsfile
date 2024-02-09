@Library('my-shared-library') _

pipeline{


    agent any

    parameters{
        choice(name: 'action', choices: 'create\ndelete', description: 'choose create/Destroy')
    }
    //agent { label 'Demo' }
    stages{
         
        
        stage('Git Checkout'){
            when { expression {  params.action == 'create' } }
            //       
            steps{
            gitcheckout(
                branch: "main",
                url: "https://github.com/iamprakash89/java_application.git"
            )
            }
        }
        
        stage('Maven Test'){
          when { expression {  params.action == 'create' } }
            steps{
            mvnTest()
            }
        }
        
       
        stage('Maven Integration Test'){
           when { expression {  params.action == 'create' } }
            steps{
            mvnintegrationtest()
            }
        }

        stage('Maven Static Code Analysis'){
             // when { expression {  params.action == 'create' } }
            steps{
                def credentialsId = 'sonarqube-api'
                staticcodeAnalysis(credentialsId)
            }
        }

    }
}