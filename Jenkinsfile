pipeline {
    agent any

    environment {
        WORKSPACE = "jenkins_home/workspace/test_master"
    }

    stages {
        stage("Checkout") {
            steps {
                checkout scm
            }
        }
        stage("1") {
            steps {
                sh "ssh -p 22 root@172.17.0.1 'cd /${WORKSPACE} && cp -r ${WORKSPACE} $HOME/tt_ayam' "
            }
        }
        // stage("Local Env") {
        //     steps {
        //         sh "ssh -p 22 root@172.17.0.1 'cd ${WORKSPACE} && composer install && cp .env.example .env && php artisan key:generate' "
        //     }
        // }
        // stage("Laradock Env") {
        //     steps {
        //         dir("laradock") {
        //             sh '''
        //                 #!/bin/bash
        //                 cp env-example .env
        //             '''
        //         }
        //     }
        // }
        // stage("Deploy") {
        //     steps {
        //         sh "ssh -p 22 root@172.17.0.1 'cd ${WORKSPACE}/laradock && docker-compose -f docker-compose.yml down --volumes && docker-compose -f docker-compose.yml up -d caddy' "
        //     }
        //     post {
        //         always {
        //             cleanWs()
        //         }
        //     }
        // }
    }
}