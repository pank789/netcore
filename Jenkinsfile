pipeline {
  agent any
  stages {
    stage('prepare image') {
      steps {
        sh 'bash ./jenkins/scripts/prepare-image.sh'
      }
    }
    stage('Clean prune images') {
      steps {
        sh 'bash ./jenkins/scripts/cleanup-images.sh'
      }
    }
    stage('Push Image') {
      steps {
        sh 'bash ./jenkins/scripts/push-images.sh'
      }
    }
    stage('run container / wait for input') {
      steps {
        sh 'bash ./jenkins/scripts/run-container.sh'
        input(message: 'Have verified container', ok: 'yes')
        sh 'bash ./jenkins/scripts/cleanup-containers.sh'
      }
    }
  }
  environment {
    HOME = '.'
    DOCKER_HUB_USER = 'pank789'
    DOCKER_HUB_PASSWORD = 'pank789'
    CONTAINER_PORT = '9090'
    HOST_PORT = '9090'
    DB_CONN_STRING = 'ZGF0YSBzb3VyY2U9aW9tZWdhc3Fsc2VydmVydjIuZGF0YWJhc2Uud2luZG93cy5uZXQ7dXNlciBpZD1pb21lZ2FhZG1pbjtwYXNzd29yZD1QcmVzdGlnZTEyMztpbml0aWFsIGNhdGFsb2c9aW9tZWdhc3FsZGF0YWJhc2V2Mjs='
    CONTAINER_NAME = 'restservices'
    CLUSTER_NAME = 'pank-cluster'
  }
}