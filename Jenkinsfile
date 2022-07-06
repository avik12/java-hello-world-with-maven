pipeline{
    agent any
    tools {
        maven 'Maven1'
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
        stage("Push To Docker Registory"){
            steps{
                script{
                    docker.withRegistry('https://registry.hub.docker.com', 'Docker_Credentials'){
                        docker.image("dockeravik22/hello-world-maven:${TAG}").push()
                        docker.image("dockeravik22/hello-world-maven:${TAG}").push("latest")
                    }
                }
            }
        }
        stage("Run the application"){
            steps{
                sh 'docker run --name hello-world -d -p 9004:8080 dockeravik22/hello-world-maven:${TAG}'
            }
        }
    }    
 }
