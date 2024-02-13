pipeline {
    agent any
    stages {
        stage('Clone') {
            steps {
                echo 'Inside Clone Stage'
                script {
                    sh '''
                    sudo rm -rf /home/mitconvocationfeedback/db-calculator-app
                    sudo git clone https://github.com/ankitr-c/db-calculator-app.git /home/mitconvocationfeedback/db-calculator-app
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
                    cd /home/mitconvocationfeedback/db-calculator-app
                    sudo pip3 install -r requirements.txt
                    sudo python3 schema.py
                    sudo nohup /usr/bin/python3 main.py > output.log 2>&1 &
                    '''
                }
            }
        }
    }
}
