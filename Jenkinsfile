pipeline {
    agent any
    stages {
        stage('Clone') {
            steps {
                echo 'Inside Clone Stage'
                git branch: 'main', url: 'https://github.com/ankitr-c/db-calculator-app.git'
                pwd
            }
        }
        stage('Config') {
            steps {
                echo 'Inside Config Stage'
                script {
                    sh '''
                        sudo apt update
                        sudo apt install -y python3-pip
                        pip3 install -r requirements.txt
                    '''
                }
            }
        }
        stage('Schema') {
            steps {
                echo 'Inside Schema Stage'
                script {
                    sh'''
                    python3 schema.py
                    '''
                }
            }
        }
        stage('Deploy') {
            steps {
                echo 'Inside Deploy Stage'
                script {
                    sh '''
                        nohup python3 main.py > output.log 2>&1 &
                    '''
                }
            }
        }
    }
}
