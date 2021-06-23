node  {
    def app
    
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

    stage('Building image') {
        
            app = docker build -t ('alok1980/testimage')
        
    }
    stage('Test image') {
        sh "echo Test Passed"
    }

}
