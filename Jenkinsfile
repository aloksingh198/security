node  {
    def Author = 'Alok Singh'

    stage('Clean WS') {
        sh 'echo "Cleaning WorkSpace"'
        cleanWs();

    }
    stage('Declartive Checkout'){
        checkout scm;
    }
    stage('Compile') {
        withMaven(jdk: 'jdk11', maven:'m2') {
            sh 'mvn compile'
        }
    }
     stage('Test') {
        withMaven(jdk: 'jdk11', maven:'m2') {
            sh 'mvn test'

        }
    }

     stage('Package') {
        withMaven(jdk: 'jdk11', maven:'m2') {
            sh 'mvn package'
        }
    }

    stage('Building Docker Image') {
        steps {
            sh 'docker image build -t aloksingh1980/myapp:1.0.0.'
        }
    }
    stage('Docker Image Push'){
        steps {
            withCredentials([string(credentialsId: 'docker_hub_pass', variable: 'docker_hub_pass')]) {
                    sh "docker login -u alok1980 -p ${docker_hub_pass}"
            }
            sh 'docker push aloksingh1980/myapp:1.0.0'
        }
    }
     stage('Deploy Container on dev_server') {
            environment { 
                dockerRUN = 'sh /home/ubuntu/dockerRUN.sh'
                }
            steps {
                sshagent(['dev_server']) {
                    sh "ssh -o StrictHostKeyChecking=no ubuntu@3.142.249.149 ${dockerRUN}"
                }
            }

    }

}
