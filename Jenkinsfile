pipeline {
    agent any

    tools {
        maven 'maven'
    }

    stages {

      stage('Checkout') {
    steps {
        git branch: 'main',
            url: 'https://github.com/Waseema761/hiring-app.git'
    }
}

        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv('sonarqube') {
                    sh 'mvn sonar:sonar'
                }
            }
        }

        stage('Deploy to Nexus') {
            steps {
                sh 'mvn deploy'
            }
        }
    }
}
