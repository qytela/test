pipeline {
    agent any

    stages {
        stage("Checkout") {
            steps {
                checkout scm
            }
        }
        stage("Build App") {
            steps {
                sh "docker build -f ./app.Dockerfile -t qytela/app ."
            }
        }
        stage("Build Web") {
            steps {
                sh "docker build -f ./web.Dockerfile -t qytela/web ."
            }
        }
        stage("Clean Up") {
            steps {
                sh "docker stop app web || true"
                sh "docker rm app web || true"
            }
            post {
                success {
                    echo "Clean Up OK"
                }
            }
        }
        stage("Running App") {
            steps {
                sh "docker run --name php-fpm -d qytela/app"
            }
        }
        stage("Running Web") {
            steps {
                sh "docker run --name web -p 80:80 --link php-fpm -d qytela/web"
            }
        }
    }
}