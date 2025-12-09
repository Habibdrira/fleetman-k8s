pipeline {
    agent any

    environment {
        // Nom du serveur configuré dans Jenkins → Manage Jenkins → Configure System → SonarQube
        SONARQUBE_ENV = 'local-sonar'
    }

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Habibdrira/fleetman-k8s.git'
            }
        }

        stage('SonarQube Analysis') {
            environment {
                scannerHome = tool 'sonar-scanner'   // Nom configuré dans Jenkins → Global Tool Configuration
            }
            steps {
                withSonarQubeEnv("${SONARQUBE_ENV}") {
                    sh '''
                        ${scannerHome}/bin/sonar-scanner \
                        -Dsonar.projectKey=fleetman-k8s \
                        -Dsonar.projectName="Fleetman K8s" \
                        -Dsonar.projectVersion=1.0 \
                        -Dsonar.sources=. \
                        -Dsonar.language=java \
                        -Dsonar.sourceEncoding=UTF-8 \
                        -Dsonar.host.url=http://localhost:9000 \
                        -Dsonar.login=$SONARQUBE_AUTH_TOKEN
                    '''
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                echo "Déploiement de l'application Fleetman sur Minikube..."

                sh '''
                    kubectl config current-context

                    kubectl apply -f storage
                    kubectl apply -f database
                    kubectl apply -f queue
                    kubectl apply -f position-simulator
                    kubectl apply -f position-tracker
                    kubectl apply -f api-gateway
                    kubectl apply -f webapp

                    echo "Pods déployés :"
                    kubectl get pods

                    echo "Services déployés :"
                    kubectl get svc
                '''
            }
        }
    }

    post {
        success {
            echo "Pipeline exécuté avec succès !"
        }
        failure {
            echo "Le pipeline a échoué !"
        }
    }
}

