pipeline {
    agent any
    
    tools {
        terraform 'Terraform'
    }
    stages {
        stage ("checkout from GIT") {
            steps {
                git branch: 'Dev', credentialsId: '02b803e5-b2c6-4abf-a5a4-b42f72e2a47f', url: 'https://github.com/Mounika220/Terraform-Scripts.git'
            }
        }
        stage ("terraform init") {
            steps {
                dir("AppService"){
                    sh 'terraform init'
                }
            }
        }
        stage ("terraform fmt") {
            steps {
                sh 'terraform fmt'
            }
        }
        stage ("terraform validate") {
            steps {
                sh 'terraform validate'
            }
        }
    }
}
