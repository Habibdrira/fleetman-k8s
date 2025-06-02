pipeline {
    agent any

    stages {
        stage('Cloner le repo') {
            steps {
                git 'https://github.com/Habibdrira/fleetman-k8s.git'
            }
        }

        stage('Appliquer les fichiers Kubernetes') {
            steps {
                sh 'kubectl apply -f .'
            }
        }
    }
}
