@Library('my-shared-library') _

pipeline{

    agent any
    //agent { label 'Demo' }

    parameters{

        choice(name: 'action', choices: 'create\ndelete', description: 'Choose create/Destroy')
        //string(name: 'ImageName', description: "name of the docker build", defaultValue: 'javapp')
        //string(name: 'ImageTag', description: "tag of the docker build", defaultValue: 'v1')
        //string(name: 'DockerHubUser', description: "name of the Application", defaultValue: 'praveensingam1994')
    }

    stages{
         
        stage('Git Checkout'){
                    when { expression {  params.action == 'create' } }
            steps{
            gitcheckout(
                branch: "main",
                url: "https://github.com/praveen1994dec/Java_app_3.0.git"
            )
            }
        }
         stage('Unit Test maven'){
         
         when { expression {  params.action == 'create' } }

            steps{
               script{
                   
                   mvnTest()
               }
            }
        }
         stage('Integration Test maven'){
         when { expression {  params.action == 'create' } }
            steps{
               script{
                   
                   mvnintegrationtest()
               }
            }
        }

        stage('Statc Code Analysis'){
         when { expression {  params.action == 'create' } }
            steps{
               script{
                   
                   staticcodeAnalysis()
               }
            }
        }

        stage('Quality Gate Analysis'){
         when { expression {  params.action == 'create' } }
            steps{
               script{
                   
                   QualityGateStatus()
               }
            }
        }

    }
}