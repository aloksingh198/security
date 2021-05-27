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

    stage('Upload To Artifactory') {
        withMaven(jdk: 'jdk8.0', maven:'m2') {
            sh 'mvn install'
        }
    }
    stage('Who Completed') {
        sh "echo ${Author}"
    }

}
