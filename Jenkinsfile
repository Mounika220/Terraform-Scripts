pipeline {
    agent any
    
    tools {
        terraform 'Terraform'
    }
    stages {
        stage ("checkout from GIT") {
            steps {
                git branch: 'Test', credentialsId: '02b803e5-b2c6-4abf-a5a4-b42f72e2a47f', url: 'https://github.com/Mounika220/Terraform-Scripts.git'
            }
        }
        stage ("terraform init") {
            steps {
                dir("Resourcegroup"){
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
        stage ("terraform plan") {
            steps {
                withCredentials([azureServicePrincipal(credentialsId: 'jenkins-service-principal',
                                    subscriptionIdVariable: 'SUBS_ID',
                                    clientIdVariable: 'CLIENT_ID',
                                    clientSecretVariable: 'CLIENT_SECRET',
                                    tenantIdVariable: 'TENANT_ID')]) 
                {
                    dir("Resourcegroup"){
                        sh 'az login --service-principal -u $CLIENT_ID -p $CLIENT_SECRET -t $TENANT_ID'
                        sh 'terraform plan'
                    }
                }
            }
        }
        stage ("terraform apply") {
            steps {
                withCredentials([azureServicePrincipal(credentialsId: 'jenkins-service-principal',
                                    subscriptionIdVariable: 'SUBS_ID',
                                    clientIdVariable: 'CLIENT_ID',
                                    clientSecretVariable: 'CLIENT_SECRET',
                                    tenantIdVariable: 'TENANT_ID')]) 
                {
                    dir("Resourcegroup"){
                        sh 'terraform apply'
                    }
                }
            }
        }
    }
}
