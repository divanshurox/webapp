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
                bat 'mvn clean install sonar:sonar -Dsonar.host.url=http://localhost:9000/ -Dsonar.analysis.mode=publish'
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
        stage('Deploy'){
            steps {
                bat """
                    pscp -pw 1964 "C:\\Users\\Divanshu Agarwal\\.jenkins\\workspace\\webapp\\target\\java-webapp-1.0.jar" div@192.168.56.101:/home/div/staging/java-webapp-1.0.jar
                    plink -v div@192.168.56.101 -pw 1964 "java -jar /home/div/staging/java-webapp-1.0.jar"
                """
            }
        }
    }
}