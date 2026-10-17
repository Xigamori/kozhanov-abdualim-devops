pipeline {
    agent any

    environment {
        STUDENT_NAME    = 'Abdualim'
        STUDENT_SURNAME = 'Kozhanov'
        STUDENT_GROUP   = 'IT2-2313'
        STUDENT_ID      = '37019'
        IMAGE_NAME      = 'kozhanov-abdualim-devops'
        CONTAINER_NAME  = 'kozhanov-abdualim-container'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
                sh 'git log -1 --oneline'
            }
        }

        stage('Build') {
            steps {
                echo "Student: ${STUDENT_NAME} ${STUDENT_SURNAME}"
                echo "Group: ${STUDENT_GROUP}"
                echo "Student ID: ${STUDENT_ID}"
                sh 'python3 -m py_compile app/app.py'
                sh 'chmod +x scripts/Kozhanov_Abdualim_system.sh'
            }
        }

        stage('Test') {
            steps {
                sh 'test -f Dockerfile'
                sh 'test -f docker-compose.yml'
                sh 'test -f Kozhanov_Abdualim_info.txt'
                sh 'bash -n scripts/Kozhanov_Abdualim_system.sh'
                sh './scripts/Kozhanov_Abdualim_system.sh | grep "Student information file exists"'
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t ${IMAGE_NAME} .'
                sh 'docker images ${IMAGE_NAME}'
            }
        }

        stage('Docker Run') {
            steps {
                sh 'docker rm -f ${CONTAINER_NAME} || true'
                sh '''
                    docker run -d -p 5000:5000 \
                      -e STUDENT_NAME="$STUDENT_NAME" \
                      -e STUDENT_SURNAME="$STUDENT_SURNAME" \
                      -e STUDENT_GROUP="$STUDENT_GROUP" \
                      -e STUDENT_ID="$STUDENT_ID" \
                      --name ${CONTAINER_NAME} ${IMAGE_NAME}
                '''
                sh 'sleep 3'
                sh 'docker ps --filter name=${CONTAINER_NAME}'
                sh 'docker logs ${CONTAINER_NAME}'
            }
        }
    }

    post {
        success {
            echo 'Pipeline finished successfully!'
        }
        failure {
            echo 'Pipeline failed. Check the stage logs above.'
        }
    }
}
