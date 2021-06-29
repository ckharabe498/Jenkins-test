pipeline {
    agent any

    stages {
        stage('Checkout') {
        steps {
            checkout scm
            script {          
                git branch: 'vnetpeering', credentialsId: 'Git', url: 'https://github.com/YogeshBaldha/Vantage.git'
                }
            }
        }          
        stage('Terraform-init') {
            steps {
                    withCredentials([azureServicePrincipal(
                    credentialsId: 'AzureScript','azure-SP',
                    subscriptionIdVariable: 'ARM_SUBSCRIPTION_ID',
                    clientIdVariable: 'ARM_CLIENT_ID',
                    clientSecretVariable: 'ARM_CLIENT_SECRET',
                    tenantIdVariable: 'ARM_TENANT_ID'
                )]){ 
                      
                sh "terraform init -input=false"
                } 
            }
        }               
        stage('Terraform-Plan') {
            steps {
                    withCredentials([azureServicePrincipal(
                    credentialsId: 'AzureScript','Azure-SP',
                    subscriptionIdVariable: 'ARM_SUBSCRIPTION_ID',
                    clientIdVariable: 'ARM_CLIENT_ID',
                    clientSecretVariable: 'ARM_CLIENT_SECRET',
                    tenantIdVariable: 'ARM_TENANT_ID'
                )]){ 
                sh """
                        
                        echo "Creating Terraform Plan"
                        terraform plan -var "client_id=$ARM_CLIENT_ID" -var "client_secret=$ARM_CLIENT_SECRET"  """
            }
        }
        }
        stage('Terraform-Apply') {
             steps {
                    withCredentials([azureServicePrincipal(
                    credentialsId: 'AzureScript','Azure-SP',',
                    subscriptionIdVariable: 'ARM_SUBSCRIPTION_ID',
                    clientIdVariable: 'ARM_CLIENT_ID',
                    clientSecretVariable: 'ARM_CLIENT_SECRET',
                    tenantIdVariable: 'ARM_TENANT_ID'
                )]){
                
                 sh """
                        echo "Applying the plan"
                        terraform apply -auto-approve -var "client_id=$ARM_CLIENT_ID" -var "client_secret=$ARM_CLIENT_SECRET" 
                        """
            }
        }
    }
}
}
