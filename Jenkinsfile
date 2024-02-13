pipeline {
    agent any
    stages {
        stage('Clone Stage') {
            steps {
                echo 'Inside Clone Stage'
                git branch: 'main', url: 'https://github.com/ankitr-c/db-calculator-app.git'
            }
        }
        stage('Build Stage') {
            steps {
                echo 'Inside Build Stage'
                script {
                    ver = readFile('version').trim()
                    sh "sudo docker buildx build -t ${ver} ."
                }
            }
        }

        stage('DockerHub Push Stage') {
            steps {
                echo 'Inside DockerHub Push Stage'
                script {
                    withCredentials([usernamePassword(credentialsId: 'docker-creds', passwordVariable: 'pass', usernameVariable: 'user')]) {
                        sh 'sudo docker login -u ankitraut0987 -p ${pass} > /dev/null 2>&1'
                        sh 'echo ${ver}'
                        sh 'sudo docker push ${ver}'
                    }
                }
            }
        }
        stage('Deploy Stage') {
            steps {
                echo 'Inside Deploy Stage'
                sh 'sudo docker rm -f calc-app'
                sh 'sudo docker run -p 8001:8000 --name calc-app ${ver}'
            }
        }
    }
}
