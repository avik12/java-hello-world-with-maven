pipeline{
    agent any
    tools {
        maven 'Maven1'
    }
    stages{
        stage("Git Checkout"){
            steps{    
            git credentialsId: 'GitHubAcc', url: 'https://github.com/avik12/java-hello-world-with-maven.git'
            }
        }
        stage("Maven Build"){
            steps{
             sh 'mvn clean install'   
            }
        }
        stage("Docker Build"){
            steps{
              sh 'docker version'  
            }
        }
    }    
}
