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
        // stage("Build Nginx") {
        //     steps {
        //         sh "docker build -f ./nginx.Dockerfile -t qytela/nginx ."
        //     }
        // }
        // stage("Build Caddy") {
        //     steps {
        //         sh "docker build -f ./caddy.Dockerfile -t qytela/caddy ."
        //     }
        // }
        stage("Stopping") {
            steps {
                sh "docker stop php-fpm || true"
                sh "docker rm php-fpm || true"
            }
            post {
                success {
                    echo "Stopping OK"
                }
            }
        }
        stage("Running App") {
            steps {
                sh "docker run --name php-fpm -d qytela/app"
            }
        }
        stage("Clean Up") {
            steps {
                sh "docker rmi qytela/app"
            }
            post {
                success {
                    echo "Clean Up OK"
                }
            }
        }
        // stage("Running Nginx") {
        //     steps {
        //         sh "docker run --name nginx -p 80:80 --link php-fpm -d qytela/nginx"
        //     }
        // }
        // stage("Running Caddy") {
        //     steps {
        //         sh "docker run --name caddy -p 80:80 -p 443:443 --link php-fpm -d qytela/caddy"
        //     }
        // }
    }
}