@Library('my-shared-library') _

pipeline{

    agent any

    parameters{

        choice(name: 'action', choices: 'create\ndelete', description: 'Choose create/Destroy')
        string(name: 'ImageName', description: "name of the docker build", defaultValue: 'javapp')
        string(name: 'ImageTag', description: "tag of the docker build", defaultValue: 'v1')
        string(name: 'DockerHubUser', description: "name of the Application", defaultValue: 'devopskvk')
    }

    stages{
         
        stage('Git Checkout :Git'){
                    when { expression {  params.action == 'create' } }
            steps{
            gitcheckout(
                branch: "main",
                url: "https://github.com/praveen1994dec/Java_app_3.0.git"
            )
            }
        }
         stage('Unit Test :Maven'){
         
         when { expression {  params.action == 'create' } }

            steps{
               script{
                   
                   mvnTest()
               }
            }
        }
         stage('Integration Test  : Maven'){
         when { expression {  params.action == 'create' } }
            steps{
               script{
                   
                   mvnintegrationtest()
               }
            }
        }

        stage('Statc Code Analysis :Sonarqube'){
         when { expression {  params.action == 'create' } }
            steps{
               script{
                   
                   staticcodeAnalysis()
               }
            }
        }

        stage('Quality Gate Analysis :Sonarqube'){
         when { expression {  params.action == 'create' } }
            steps{
               script{
                   
                   QualityGateStatus()
               }
            }
        }

        stage('Maven Build :Maven'){
         when { expression {  params.action == 'create' } }
            steps{
               script{
                   
                   mvnBuild()
               }
            }
        }

        stage('Docker Image Build :Docker'){
         when { expression {  params.action == 'create' } }
            steps{
               script{
                   
                   dockerbuild("${params.ImageName}","${params.ImageTag}","${params.DockerHubUser}")
               }
            }
        }

        stage('Docker Image scan :Trivy'){
         when { expression {  params.action == 'create' } }
            steps{
               script{
                   
                   dockerimagescan("${params.ImageName}","${params.ImageTag}","${params.DockerHubUser}")
               }
            }
        }

        stage('Docker Image push :Docker'){
         when { expression {  params.action == 'create' } }
            steps{
               script{
                   
                   dockerpush("${params.ImageName}","${params.ImageTag}","${params.DockerHubUser}")
               }
            }
        }


    }
}