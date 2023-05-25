pipeline{
    agent any 
    tools {
        terraform 'Terraform'
    }
    environment {
        TF_HOME = tool('Terraform')
        TF_IN_AUTOMATION = "true"
        PATH = "$TF_HOME:$PATH"
    }
    stages {
    
        stage('Terraform Init'){
            
            steps {
                    ansiColor('xterm') {
                    withCredentials([azureServicePrincipal(
                    credentialsId: 'Azure_Service_Principal',
                    subscriptionIdVariable: 'SUBSCRIPTION_ID',
                    clientIdVariable: 'CLIENT_ID',
                    clientSecretVariable: 'CLIENT_SECRET',
                    tenantIdVariable: 'TENANT_ID'
                ), string(credentialsId: 'access_key', variable: 'ACCESS_KEY')]) {
                        
                        sh """
                                
                        echo "Initialising Terraform"
                        terraform init -backend-config="access_key=$ACCESS_KEY" -backend-config="storage_account_name=jenkintfstate" -backend-config="container_name=terraformfiles" -backend-config="key=$ARM_ACCESS_KEY" -backend-config="resource_group_name=Jenkins"
                        """
                           }
                    }
             }
        }
    }
}