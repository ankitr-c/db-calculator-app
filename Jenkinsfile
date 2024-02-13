pipeline {
    agent any
    stages {
        stage('Clone') {
            steps {
                echo 'Inside Clone Stage'
                git branch: 'main', url: 'https://github.com/ankitr-c/db-calculator-app.git'
                script {
                    sh '''
                    pwd
                    '''
                }
            }
        }
        stage('Deploy') {
            steps {
                echo 'Inside Deploy Stage'
                script {
                    sh '''
                    sudo apt update
                    sudo apt install -y python3-pip
                    pip3 install -r requirements.txt
                    python3 schema.py
                    nohup python3 main.py > output.log 2>&1 &
                    '''
                }
            }
        }
    }
}
