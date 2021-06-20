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
        
            sh 'docker build -t alok1980/testimage:1.0.1 .'
        
    }
    stage('Publishing Docker Image') {
        sh "echo ${Author}"
    }

}
