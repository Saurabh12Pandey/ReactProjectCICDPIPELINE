pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                git url: 'https://github.com/Saurabh12Pandey/ReactProjectCICDPIPELINE.git', branch: "main"
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t react-app:latest .'
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'dockerhubPass', usernameVariable: 'dockerhubUser')]) {
                    sh 'echo ${dockerhubPass} | docker login -u ${dockerhubUser} --password-stdin'
                    sh 'docker tag react-app:latest ${dockerhubUser}/react-app:latest'
                    sh 'docker push ${dockerhubUser}/react-app:latest'
                }
            }
        }
        stage("deploy"){
            steps{
                sh 'docker run -d -p 7000:3000 sp8970196621/react-app:latest'
            }
        }
    }
}
