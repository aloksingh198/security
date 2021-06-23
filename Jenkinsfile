//declarative pipeline code

pipeline{
    agent any
    options { 
        quietPeriod(10) 
    }
    triggers {
        pollSCM('* * * * *')
    }
    tools {
        maven 'm2'
        jdk 'jdk11'
    }

    stages {
        stage('Clean Ws') {
            steps{
                cleanWs()
            }
        }
        stage('Git CheckoutOut'){
            steps{
                checkout scm
            }
        }
        stage ('Maven Package'){
            steps{
                sh 'mvn package'
            }   
        }
        stage ('Build Docker Image '){
            steps{
                sh 'docker build -t alok1980/myapp:1.0.0 .'
            }   
        }
        stage ('Docker Image Push'){
            steps{
                withCredentials([string(credentialsId: 'docker_hub_pass', variable: 'docker_hub_pass')]) {
                    sh "docker login -u alok1980 -p ${docker_hub_pass}"
                }
                sh 'docker push alok1980/myapp:1.0.0'
            }   
        }
        
    }
}

