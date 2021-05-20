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
        withMaven(jdk: 'jdk8.0', maven:'m2') {
            sh 'mvn compile'
        }
    }
<<<<<<< HEAD
     stage('Test') {
=======
     stage('Testing') {
>>>>>>> 2b05481cf03d7d0ead1ba6e165dab11eeff552c6
        withMaven(jdk: 'jdk8.0', maven:'m2') {
            sh 'mvn test'

        }
    }

     stage('Package') {
        withMaven(jdk: 'jdk8.0', maven:'m2') {
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
