@Library('my-shared-library') _

pipeline{

    agent any
    //agent { label 'Demo' }
    stages{
         
        stage('Git Checkout'){
            //        when { expression {  params.action == 'create' } }
            steps{
            gitcheckout(
                branch: "main",
                url: "https://github.com/iamprakash89/java_application.git"
            )
            }
        }

        stage('Maven Test'){
            //        when { expression {  params.action == 'create' } }
            steps{
            mvnTest()
            }
        }
    }
}