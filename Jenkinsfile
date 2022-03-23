pipeline {
    agent {
        label 'master'
    }
    stages {
        stage('Build') {
            steps {
                bat 'mvn -B -DskipTests clean package'
            }
        }
        stage('Sonar-Report') {
            steps {
                sh 'mvn sonar:sonar \
  -Dsonar.projectKey=init \
  -Dsonar.host.url=http://localhost:9000 \
  -Dsonar.login=9f699783152413c83953930d6caa01cc59300cf8'
            }
        }
        stage('Test') { 
            steps {
                bat 'mvn test' 
            }
            post {
                always {
                    junit 'target/surefire-reports/*.xml' 
                }
            }
        }
    }
}
