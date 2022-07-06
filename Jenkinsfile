pipeline{
    agent any
    tools {
        maven 'Maven1'
        docker 'Docker1'
    }
    environment {
        DATE = new Date().format('yy.M')
        TAG = "${DATE}.${BUILD_NUMBER}"
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
        stage("Check Docker version"){
            steps{
              sh 'docker version'  
            }
        }
        stage("Image Build"){
            steps{
                script{
                    docker.build("dockeravik22/hello-world-maven:${TAG}")
                }
            }
        }
    }    
 }
