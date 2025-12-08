pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Récupère le code depuis Git (Jenkins va utiliser l’URL du job)
                checkout scm
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                echo "Déploiement de l'application Fleetman sur Minikube..."

                sh '''
                  # Affiche le contexte K8s pour debug
                  kubectl config current-context

                  # Applique les manifests dans le bon ordre
                  kubectl apply -f storage
                  kubectl apply -f database
                  kubectl apply -f queue
                  kubectl apply -f position-simulator
                  kubectl apply -f position-tracker
                  kubectl apply -f api-gateway
                  kubectl apply -f webapp

                  # Affiche l’état des pods après le déploiement
                  kubectl get pods
                  kubectl get svc
                '''
            }
        }
    }
}
