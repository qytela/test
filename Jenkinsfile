// pipeline {
//     agent any

//     stages {
//         stage("Checkout") {
//             steps {
//                 checkout scm
//             }
//         }
//         stage("Build App") {
//             steps {
//                 sh "docker build -f ./app.Dockerfile -t qytela/app ."
//             }
//         }
//         // stage("Build Nginx") {
//         //     steps {
//         //         sh "docker build -f ./nginx.Dockerfile -t qytela/nginx ."
//         //     }
//         // }
//         // stage("Build Caddy") {
//         //     steps {
//         //         sh "docker build -f ./caddy.Dockerfile -t qytela/caddy ."
//         //     }
//         // }
//         stage("Stopping") {
//             steps {
//                 sh "docker stop php-fpm || true"
//                 sh "docker rm php-fpm || true"
//             }
//             post {
//                 success {
//                     echo "Stopping OK"
//                 }
//             }
//         }
//         stage("Running App") {
//             steps {
//                 sh "docker run --name php-fpm -d qytela/app"
//             }
//         }
//         // stage("Running Nginx") {
//         //     steps {
//         //         sh "docker run --name nginx -p 80:80 --link php-fpm -d qytela/nginx"
//         //     }
//         // }
//         stage("Running Caddy") {
//             steps {
//                 sh "docker run --name caddy -p 80:80 -p 443:443 --link php-fpm -d qytela/caddy || true"
//             }
//         }
//     }
// }

pipeline {
    agent any
    
    environment {
        SSH = 'ssh -p 22 root@172.17.0.1'
    }

    stages {
        stage("Checkout") {
            steps {
                checkout scm
            }
        }
        stage("Git Pull") {
            steps {
                sh "${SSH} 'cd test2 && \
                git pull origin master' "
            }
        }
        stage("Local Env") {
            steps {
                sh "${SSH} 'cd test2 && \
                cp .env.example .env && \
                export DB_CONNECTION=mysql && \
                export DB_HOST=laradock_mysql_1
                export DB_PORT=3306 && \
                export DB_DATABASE=laravel && \
                export DB_USERNAME=root && \
                export DB_PASSWORD=root && \
                composer install && \
                php artisan key:generate && \
                chmod -R 777 storage bootstrap/cache' "
            }
        }
        stage("Laradock Env") {
            steps {
                sh "${SSH} 'cd test2/laradock && \
                cp env-example .env && \
                export PMA_PORT=8091' "
            }
        }
        stage("Running App") {
            steps {
                sh "${SSH} 'cd test2/laradock && \
                docker-compose up -d --build caddy mysql phpmyadmin' "
            }
        }
    }
}